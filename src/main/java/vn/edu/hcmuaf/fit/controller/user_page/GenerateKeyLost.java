package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.impl.RSAKeyGeneratorImpl;
import vn.edu.hcmuaf.fit.service.impl.UserService;

import java.io.IOException;
import java.security.KeyPair;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.sql.Timestamp;
import java.util.Base64;

@WebServlet("/user/generateKeyLost")
public class GenerateKeyLost extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");

        // Kiểm tra session người dùng
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("auth") == null) {
            response.getWriter().write("{\"status\":\"error\", \"message\":\"Session expired. Please log in again.\"}");
            return;
        }

        User user = (User) session.getAttribute("auth");

        try {
            // Tạo cặp khóa RSA
            RSAKeyGeneratorImpl rsaKeyGenerator = new RSAKeyGeneratorImpl();
            KeyPair keyPair = rsaKeyGenerator.generateKeyPair();
            PublicKey publicKey = keyPair.getPublic();
            PrivateKey privateKey = keyPair.getPrivate();

            String publicKeyBase64 = rsaKeyGenerator.encodePublicKey(publicKey);
            String privateKeyBase64 = rsaKeyGenerator.encodePrivateKey(privateKey);

            // Lấy IP của người dùng
            String ip = request.getRemoteAddr();


            // Kiểm tra các thông tin về liên kết khóa
            String linkKey = (String) session.getAttribute("linkKey");
            Long linkKeyExpiry = (Long) session.getAttribute("linkKeyExpiry");

            // Kiểm tra yêu cầu tải xuống khóa riêng tư
            String download = request.getParameter("download");
            if (linkKey != null && linkKeyExpiry != null && System.currentTimeMillis() <= linkKeyExpiry) {
                if ("true".equalsIgnoreCase(download)) {
                    // Lưu khóa công khai vào cơ sở dữ liệu khi người dùng tải xuống khóa riêng tư
                    UserService.getInstance().savePublicKey(user, publicKeyBase64, ip, "/user/generateKeyLost");

                    // Cập nhật khóa công khai vào session
                    user.setPublicKey(publicKeyBase64);
                    session.setAttribute("auth", user);

                    // Gửi private key
                    sendPrivateKey(response, privateKeyBase64, user.getEmail());
                    return; // Dừng xử lý sau khi gửi file
                }
            } else {
                // Liên kết đã hết hạn hoặc không hợp lệ
                response.sendError(HttpServletResponse.SC_FORBIDDEN, "Link đã hết hạn hoặc không hợp lệ.");
                session.removeAttribute("linkKey");
                session.removeAttribute("linkKeyExpiry");
            }

            // Phản hồi thành công nếu không có yêu cầu tải xuống
            response.getWriter().write("{\"status\":\"success\", \"message\":\"Keys generated successfully.\"}");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("{\"status\":\"error\", \"message\":\"Failed to generate keys. Please try again later.\"}");
        }
    }

    public void sendPrivateKey(HttpServletResponse response, String privateKeyBase64, String userEmail) throws IOException {
        // Cấu hình phản hồi HTTP để gửi private key
        response.setContentType("text/plain; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        // Tên file private key
        String fileName = userEmail + "_private_key.pem";

        // Đặt headers cho file download
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

        // Gửi private key dưới dạng base64
        try (ServletOutputStream outputStream = response.getOutputStream()) {
            outputStream.write(privateKeyBase64.getBytes("UTF-8"));
            outputStream.flush();
        } catch (IOException e) {
            e.printStackTrace();
            response.getWriter().write("{\"status\":\"error\", \"message\":\"Error while downloading private key.\"}");
        }
    }
}
