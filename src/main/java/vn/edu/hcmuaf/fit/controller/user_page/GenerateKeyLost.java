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
import java.util.Base64;

@WebServlet("/user/generateKeyLost")
public class GenerateKeyLost extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("auth") == null) {
            response.getWriter().write("{\"status\":\"error\", \"message\":\"Session expired. Please log in again.\"}");
            return;
        }

        User user = (User) session.getAttribute("auth");

        try {
            // Tạo cặp khóa RSA mới khi người dùng báo mất khóa
            RSAKeyGeneratorImpl rsaKeyGenerator = new RSAKeyGeneratorImpl();
            KeyPair keyPair = rsaKeyGenerator.generateKeyPair();
            PublicKey publicKey = keyPair.getPublic();
            PrivateKey privateKey = keyPair.getPrivate();

            String publicKeyBase64 = rsaKeyGenerator.encodePublicKey(publicKey);
            String privateKeyBase64 = rsaKeyGenerator.encodePrivateKey(privateKey);  // privateKeyBase64 là base64 không cần giải mã

            // Lưu thông tin public key vào cơ sở dữ liệu
            String ip = request.getRemoteAddr();
            UserService.getInstance().savePublicKeyOnLost(user, publicKeyBase64, ip, "/user/generateKeyLost");

            // Cập nhật public key vào session và cơ sở dữ liệu
            user.setPublicKey(publicKeyBase64);
            session.setAttribute("auth", user);

            // Kiểm tra nếu yêu cầu tải private key
            String download = request.getParameter("download");
            if ("true".equalsIgnoreCase(download)) {
                // Nếu yêu cầu tải private key, trả về private key dưới dạng base64
                sendPrivateKey(response, privateKeyBase64, user.getEmail());
                return;  // Dừng xử lý thêm, vì file đã được gửi về
            }

            // Trả về thông báo thành công
            response.getWriter().write("{\"status\":\"success\", \"message\":\"Keys generated successfully.\"}");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("{\"status\":\"error\", \"message\":\"Failed to generate keys. Please try again later.\"}");
        }
    }


    public void sendPrivateKey(HttpServletResponse response, String privateKeyBase64, String userEmail) throws IOException {
        // Cấu hình phản hồi HTTP để gửi private key dưới dạng văn bản (base64)
        response.setContentType("text/plain; charset=UTF-8");  // Đảm bảo kiểu dữ liệu là văn bản
        response.setCharacterEncoding("UTF-8");

        // Tên file private key sẽ gửi cho người dùng
        String fileName = userEmail + "_private_key.pem";

        // Thiết lập headers để tải file về
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");  // Đặt tên file tải về

        // Gửi private key dưới dạng base64 (không cần giải mã)
        try (ServletOutputStream outputStream = response.getOutputStream()) {
            outputStream.write(privateKeyBase64.getBytes("UTF-8"));  // Ghi khóa vào output stream (dưới dạng base64)
            outputStream.flush();  // Đảm bảo tất cả dữ liệu đã được gửi đi
        } catch (IOException e) {
            e.printStackTrace();
            response.getWriter().write("{\"status\":\"error\", \"message\":\"Error while downloading private key.\"}");
        }
    }
}