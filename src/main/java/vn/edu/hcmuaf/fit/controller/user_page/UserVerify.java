package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.controller.user_page.APIService.SendEmail;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.model.Utils;
import vn.edu.hcmuaf.fit.service.impl.UserService;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/user/verify")
public class UserVerify extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");

        if (action != null) {
            HttpSession session = request.getSession(true);
            if(action.equals("resend")) {
                SendEmail send = new SendEmail();
                String code = send.getRandomVerifyCode();

                String email = (String) getServletContext().getAttribute("email");
                if (email == null || email.equals("")) {
                    email = request.getParameter("verifyEmail");
                    getServletContext().setAttribute("email", email);
                }
                User user = UserService.getInstance().chkUsrByNameOrEmail("", email);

                if (user != null && send.sendVerifyCode(email, code)) {
                    session.setAttribute("authCode", code);
                    session.setAttribute("success", "The activation code has been sent to your email again!");
                    session.setMaxInactiveInterval(5*60);
                } else {
                    session.invalidate();
                    request.setAttribute("errorExist", "Your account is not existed!");
                }
            } else if(action.equals("activated") || action.equals("unlocked") || action.equals("reset")) {
                getServletContext().removeAttribute("email");
                getServletContext().setAttribute("action", action);
                session.invalidate();
            }
        }
        request.getRequestDispatcher("/WEB-INF/user/verify.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(true);
        String code = request.getParameter("verifyCode");
        String authCode = (String) session.getAttribute("authCode");
        String verifyEmail = request.getParameter("verifyEmail");
        String email = (String) getServletContext().getAttribute("email");
        String actionParam = request.getParameter("action");
        String actionApp = (String) getServletContext().getAttribute("action");

        boolean ok = true;
        if ((verifyEmail == null) || (verifyEmail.equals(""))) {
            if ((code == null) || (code.equals(""))) ok = false;
        }

        if (!ok) {
            out.write("{\"error\":\"Please fill in all information completely\"}");
        } else {
            String existEmail = (verifyEmail == null || verifyEmail.equals(""))? email: verifyEmail;
            String existAction = (actionParam == null || actionParam.equals(""))? actionApp: actionParam;

            User user = new User();
            user.setEmail(existEmail);

            String ip = request.getHeader("X-FORWARDED-FOR");
            if (ip == null) ip = request.getRemoteAddr();

            if ((code == null) || (code.equals(""))) {
                User u = UserService.getInstance().chkUsrByNameOrEmail("", existEmail);
                if (u != null) {
                    SendEmail send = new SendEmail();
                    if (!existAction.equals("reset")) {
                        String codeSendMail = send.getRandomVerifyCode();
                        if (send.sendVerifyCode(existEmail, codeSendMail)) {
                            session.setAttribute("authCode", codeSendMail);
                            session.setAttribute("success", "The activation code has been sent to your email!");
                            session.setMaxInactiveInterval(5*60);
                            getServletContext().setAttribute("email", existEmail);
                        }
                        out.write("{ \"status\": \"sendComplete\"}");
                    } else {
                        String newPassword = Utils.generateRandomPassword();
                        boolean success = UserService.getInstance().updatePassword(u, newPassword, ip, "/user/verify");
                        if (success) {
                            if(send.sendPassword(existEmail, newPassword)) {
                                session.setAttribute("authCode", newPassword);
                                session.setAttribute("success", "The new password has been sent to your email!");
                                getServletContext().setAttribute("email", existEmail);
                            }
                        }
                        out.write("{ \"status\": \"success\"}");
                    }
                } else {
                    out.write("{ \"error\" : \"Email is not existed!\"}");
                }
                out.close();
                return;
            }

            if(existAction != null && !existEmail.isEmpty()) {
                if (existAction.equals("activated")) {
                    String error = UserService.getInstance().setVerified(user, code, authCode, ip, "/user/verify");
                    if(!error.isEmpty() && !error.equals("Your account has been verified!")) {
                        out.write("{ \"error\" :\"" + error + "\"}");
                    } else {
                        if(error.isEmpty()) session.setAttribute("success", "Account activation successful!");
                        else session.setAttribute("success", error);
                        getServletContext().removeAttribute("email");
                        getServletContext().removeAttribute("action");
                        session.removeAttribute("authCode");
                        out.write("{ \"status\": \"success\"}");
                    }
                } else if(existAction.equals("unlocked")) {
                    String error = UserService.getInstance().resetLoginTimes(user, code, authCode, ip, "/user/verify");
                    if(!error.isEmpty() && !error.equals("Your account has been unlocked!")) {
                        out.write("{ \"error\" :\"" + error + "\"}");
                    } else {
                        if(error.isEmpty()) session.setAttribute("success", "The account has been successfully unlocked!");
                        else session.setAttribute("success", error);
                        getServletContext().removeAttribute("email");
                        getServletContext().removeAttribute("action");
                        session.removeAttribute("authCode");
                        out.write("{ \"status\": \"success\"}");
                    }
                } else if(existAction.equals("reset")) {

                }
            }
        }
        out.close();
    }
}