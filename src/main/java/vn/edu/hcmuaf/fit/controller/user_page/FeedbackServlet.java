package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.model.Feedback;
import vn.edu.hcmuaf.fit.model.Utils;
import vn.edu.hcmuaf.fit.service.impl.FeedbackService;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/user/feedback")
public class FeedbackServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.getRequestDispatcher("/WEB-INF/user/contact.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String content = request.getParameter("feedback");

        if (name == null || email == null || content == null || name.isEmpty() || email.isEmpty() || content.isEmpty()) {
            out.write("{\"error\":\"Please fill in all information completely!\"}");
        } else if (!Utils.isValidEmail(email)) {
            out.write("{\"error\":\"Email is invalid!\"}");
        } else if (content.length() < 10) {
            out.write("{\"error\":\"Nội dung đóng góp phải có ít nhất 10 ký tự!\"}");
        } else {
            String ip = request.getHeader("X-FORWARDED-FOR");
            if (ip == null) ip = request.getRemoteAddr();

            Feedback feedback = new Feedback();
            feedback.setName(name);
            feedback.setEmail(email);
            feedback.setContent(content);

            Feedback success = FeedbackService.getInstance().addFeedback(feedback, ip, "/user/feedback");
            if (success != null) {
                out.write("{ \"status\": \"success\"}");
                request.getSession().setAttribute("ok", "Phản hồi của bạn đã được gửi thành công!");
            } else {
                out.write("{\"error\":\"Phản hồi của bạn được gửi thất bại!\"}");
            }
        }
        out.flush();
        out.close();
    }
}