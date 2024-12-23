package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import org.json.JSONObject;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.impl.UserService;

@WebServlet("/user/uploadPublicKey")
public class UploadPublicKeyServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");

        // Kiểm tra session và lấy user
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("auth") == null) {
            response.getWriter().write("{\"status\":\"error\", \"message\":\"Session expired. Please log in again.\"}");
            return;
        }
        User user = (User) session.getAttribute("auth");

        // Đọc dữ liệu JSON từ request body
        BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()));
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }

        // Phân tích JSON
        String requestData = sb.toString();
        JSONObject jsonObject = new JSONObject(requestData);
        String publicKey = jsonObject.getString("publicKey");

        // Kiểm tra nếu public key rỗng
        if (publicKey.isEmpty()) {
            response.getWriter().write("{\"status\":\"error\", \"message\":\"Public key is empty.\"}");
            return;
        }

        // Lưu public key vào cơ sở dữ liệu
        String ip = request.getRemoteAddr();
        try {
            UserService.getInstance().savePublicKeyOnLost(user, publicKey, ip, "/user/uploadPublicKey");

            // Cập nhật khóa công khai vào session
            user.setPublicKey(publicKey);
            session.setAttribute("auth", user);

            // Phản hồi thành công
            response.getWriter().write("{\"status\":\"success\", \"message\":\"Public key uploaded successfully.\"}");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("{\"status\":\"error\", \"message\":\"Failed to save public key. Please try again later.\"}");
        }
    }
}
