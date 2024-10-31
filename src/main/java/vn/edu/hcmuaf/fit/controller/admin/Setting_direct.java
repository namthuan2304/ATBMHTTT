package vn.edu.hcmuaf.fit.controller.admin;

import com.google.gson.Gson;
import vn.edu.hcmuaf.fit.model.SocialMedia;
import vn.edu.hcmuaf.fit.service.impl.SocialMediaService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(urlPatterns = "/admin/setting")
public class Setting_direct extends HttpServlet {
    private final SocialMediaService socialMediaService = (SocialMediaService) SocialMediaService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        request.setAttribute("current_page", "setting");
        request.setAttribute("title", "Quản lý Mạng Xã Hội");

        SocialMedia socialMedia = socialMediaService.load();
        request.setAttribute("socialMedia", socialMedia);

        request.getRequestDispatcher("/WEB-INF/admin/setting.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        Map<String, String> result = new HashMap<>();

        if ("edit".equals(action)) {
            String facebook = request.getParameter("facebook");
            String instagram = request.getParameter("instagram");
            String twitter = request.getParameter("twitter");
            String pinterest = request.getParameter("pinterest");
            String youtube = request.getParameter("youtube");
            String linkedin = request.getParameter("linkedin");

            boolean updated = socialMediaService.update(facebook, instagram, twitter, pinterest, youtube, linkedin);

            if (updated) {
                result.put("status", "success");
                result.put("message", "Bạn đã cập nhật thành công.");
            } else {
                result.put("status", "error");
                result.put("message", "Cập nhật thất bại.");
            }
        } else {
            result.put("status", "error");
            result.put("message", "Invalid action.");
        }

        Gson gson = new Gson();
        String jsonResponse = gson.toJson(result);
        response.getWriter().write(jsonResponse);
    }
}
