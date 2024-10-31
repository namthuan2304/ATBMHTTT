package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.edu.hcmuaf.fit.controller.user_page.APIService.OAuth2Callback;
import vn.edu.hcmuaf.fit.controller.user_page.APIService.OAuth2Service;
import vn.edu.hcmuaf.fit.model.CartItem;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.impl.UserService;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/user/signin")
public class SignIn extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String apis = request.getParameter("apis");
        if (apis == null) {
            Cookie arr[] = request.getCookies();
            if (arr != null) {
                for (Cookie o : arr) {
                    if (o.getName().equals("userC")) {
                        request.setAttribute("email", o.getValue());
                    }
                    if (o.getName().equals("passC")) {
                        request.setAttribute("password", o.getValue());
                    }
                }
            }
            request.getRequestDispatcher("/WEB-INF/user/signIn.jsp").forward(request, response);
            return;
        }
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();

        String code = request.getParameter("code");
        String apis = request.getParameter("apis");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("rememberMe");

        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null) ip = request.getRemoteAddr();

        if (apis == null) {
            boolean ok = true;
            if ((email == null) || (email.equals(""))) {
                ok = false;
            }
            if ((password == null) || (password.equals(""))) {
                ok = false;
            }
            if(!ok) {
                out.write("{\"error\":\"Please fill in all information completely\"}");
            } else {
                User u = new User();
                u.setEmail(email);
                u.setPassword(password);

                User user = UserService.getInstance().signIn(u, ip, "/user/signin");
                User userMail = UserService.getInstance().chkUsrByNameOrEmail("", email);
                if (user == null) {
                    if (userMail != null) {
                        if(userMail.getVerified() && userMail.getLoginTimes() < 5) {
                            int times = userMail.getLoginTimes()+1;
                            UserService.getInstance().updateLoginFail(userMail, times, ip, "/user/signin");
                            if(times < 5) out.println("{\"error\":\"Wrong password. You have "+ (5 - times) +" times to login!\"}");
                            else out.write("{\"error\":\"Login failed. We have locked the email " + email + "!\"}");
                        } else {
                            if(userMail.getLoginTimes() >= 5) out.write("{\"error\":\"Login failed. We have locked the email " + email + "!\"}");
                            else out.write("{\"error\":\"Account has not been activated to login!\"}");
                        }
                    } else {
                        out.write("{\"error\":\"Wrong email, please try again!\"}");
                    }
                } else {
                    if (user.getRole().getId() == 1 && user.getLoginTimes() < 5) {
                        UserService.getInstance().resetLoginTimes(user, "", "", ip, "/user/signin");
                        HttpSession session = request.getSession(true);
                        session.setAttribute("auth", user);
                        session.setAttribute("flag", 0);
                        Cookie uc = new Cookie("userC", email);
                        Cookie pc = new Cookie("passC", password);
                        uc.setMaxAge(30 * 24 * 60 * 60);
                        if (remember != null) {
                            if(Boolean.parseBoolean(remember)) {
                                pc.setMaxAge(30 * 24 * 60 * 60);
                            } else {
                                pc.setMaxAge(0);
                            }
                        } else {
                            pc.setMaxAge(0);
                        }
                        response.addCookie(uc);
                        response.addCookie(pc);
                        out.write("{ \"status\": \"success\"}");

                    } else if (user.getRole().getId() == 2 && user.getLoginTimes() < 5) {
                        UserService.getInstance().resetLoginTimes(user, "", "", ip, "/user/signin");
                        HttpSession session = request.getSession();
                        session.setAttribute("adminAuth", user);
                        out.write("{ \"status\": \"success\", \"role\": \"admin\"}");
                    } else {
                        if(user.getLoginTimes() == 5) out.write("{\"error\":\"Login failed. We have locked the email " + email + "!\"}");
                        else if(user.getRole().getId() != 1) out.write("{\"error\":\"You do not have access rights\"}");
                    }
                }
            }
            out.close();
            return;
        }
        try {
            User userToken = null;
            switch (apis) {
                case "Google":
                    userToken = OAuth2Callback.getUserInfo(OAuth2Callback.getToken(code, OAuth2Service.GOOGLE), false);
                    break;
                case "Facebook":
                    userToken = OAuth2Callback.getUserInfo(OAuth2Callback.getToken(code, OAuth2Service.FACEBOOK), false);
                    break;
                case "Twitter":
                    userToken = OAuth2Callback.getUserInfo(OAuth2Callback.getToken(code, OAuth2Service.TWITTER), true);
                    break;
                case "Discord":
                    userToken = OAuth2Callback.getUserInfo(OAuth2Callback.getToken(code, OAuth2Service.DISCORD), true);
                    break;
                case "Github":
                    userToken = OAuth2Callback.getUserInfo(OAuth2Callback.getToken(code, OAuth2Service.GITHUB), true);
                    break;
            }
            this.loginByAPIS(request, response, userToken, ip, apis);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private void loginByAPIS(HttpServletRequest request, HttpServletResponse response, User userToken, String ip, String apis) throws ServletException, IOException {
        User user = UserService.getInstance().loginByAPIS(userToken, ip, "/user/loginByAPIS");
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("auth", user);
            session.setAttribute("flag", 0);
            response.sendRedirect("./home");
            return;
        }
        request.setAttribute("loginFail", "Login fail with " + apis);
        request.getRequestDispatcher("/WEB-INF/user/signIn.jsp").forward(request, response);
    }
}