package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.controller.user_page.APIService.SendEmail;
import vn.edu.hcmuaf.fit.model.Role;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.impl.UserService;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/user/signup")
public class SignUp extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        request.getRequestDispatcher("/WEB-INF/user/signUp.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String repass = request.getParameter("rePassword");
        Integer roleId = Integer.parseInt(request.getParameter("roleId"));
        String agree_terms = request.getParameter("agree_terms");

        boolean ok = true;
        if ((username == null) || (username.equals(""))) {
            ok = false;
        }
        if ((email == null) || (email.equals(""))) {
            ok = false;
        }
        if ((password == null) || (password.equals(""))) {
            ok = false;
        }
        if ((repass == null) || (repass.equals(""))) {
            ok = false;
        }

        if (!ok) {
            out.write("{\"error\":\"Please fill in all information completely\"}");
        } else {
            if (agree_terms == null) {
                out.write("{\"error\":\"Please click to agree to the terms of service and privacy policy\"}");
            } else {
                boolean agree = Boolean.parseBoolean(agree_terms);
                if (!agree) {
                    out.write("{\"error\":\"Please click to agree to the terms of service and privacy policy\"}");
                } else {
                    User user = new User();
                    user.setUsername(username);
                    user.setEmail(email);
                    user.setPassword(password);

                    Role role = new Role();
                    role.setId(roleId);
                    user.setRole(role);

                    SendEmail send = new SendEmail();
                    String code = send.getRandomVerifyCode();

                    String ip = request.getHeader("X-FORWARDED-FOR");
                    if (ip == null) ip = request.getRemoteAddr();

                    String error = UserService.getInstance().signUp(user, repass, ip, "/user/signup");
                    try {
                        Integer.parseInt(error);
                        if (send.sendVerifyCode(email, code)) {
                            HttpSession session = request.getSession();
                            session.setAttribute("authCode", code);
                            session.setAttribute("success", "The activation code has been sent to your email!");
                            session.setMaxInactiveInterval(5*60);
                            getServletContext().setAttribute("email", email);
                            getServletContext().setAttribute("action", "activated");
                        }
                        out.write("{ \"status\": \"success\"}");
                    } catch (NumberFormatException e) {
                        out.write("{ \"error\" :\"" + error + "\"}");
                    }
                }
            }
        }
        out.close();
    }
}