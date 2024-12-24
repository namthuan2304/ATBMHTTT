package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.security.*;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

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
        String code = request.getParameter("code");
        String message = request.getParameter("verifyCode");
        if(code != null && message!=null) {
            if (!code.equals(message)) {
                response.getWriter().write("{\"status\":\"error\"}");
                return;
            } else {
                response.getWriter().write("{\"status\":\"success\"}");
                return;
            }
        }
        User user = (User) session.getAttribute("auth");
        String publicKey = request.getParameter("fileInput");
        String ip = request.getRemoteAddr();
        try {
//            if(isSHA256withRSA(publicKey)) {
                UserService.getInstance().savePublicKeyOnLost(user, publicKey, ip, "/user/uploadPublicKey");
//            } else {
//                response.getWriter().write("{\"status\":\"error\", \"message\":\"Public key uploaded not format.\"}");
//                return;
//            }

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

//    public boolean isSHA256withRSA(String publicKeyPem) {
//        try {
//            // Loại bỏ phần header/footer
//            String keyBody = publicKeyPem.replace("-----BEGIN PUBLIC KEY-----", "")
//                    .replace("-----END PUBLIC KEY-----", "")
//                    .replaceAll("\\s", "");
//
//            // Giải mã Base64
//            byte[] keyBytes = Base64.getDecoder().decode(keyBody);
//
//            // Tạo PublicKey từ bytes
//            KeyFactory keyFactory = KeyFactory.getInstance("RSA");
//            PublicKey publicKey = keyFactory.generatePublic(new X509EncodedKeySpec(keyBytes));
//
//            // Tạo một chuỗi giả để ký
//            byte[] testMessage = "Test Message".getBytes();
//
//            // Tạo chữ ký
//            Signature signature = Signature.getInstance("SHA256withRSA");
//            signature.initSign(KeyPairGenerator.getInstance("RSA").generateKeyPair().getPrivate());
//            signature.update(testMessage);
//            byte[] signedMessage = signature.sign();
//
//            // Kiểm tra việc xác minh
//            Signature verifier = Signature.getInstance("SHA256withRSA");
//            verifier.initVerify(publicKey);
//            verifier.update(testMessage);
//
//            return verifier.verify(signedMessage);
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            return false;
//        }
//    }
}
