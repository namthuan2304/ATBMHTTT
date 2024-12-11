package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.impl.RSAKeyGeneratorImpl;
import vn.edu.hcmuaf.fit.service.impl.UserService;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.KeyPair;
import java.security.PrivateKey;
import java.security.PublicKey;

@WebServlet("/user/generateKey")
public class GenerateKey extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        // Kiểm tra session
        HttpSession session = request.getSession(false); // Không tạo session mới
        User user = (session != null) ? (User) session.getAttribute("auth") : null;

        if (user == null) {
            // Nếu người dùng chưa đăng nhập, chuyển hướng đến trang đăng nhập
            response.sendRedirect("/user/signin");
            return;
        }

        // Nếu người dùng đã đăng nhập nhưng chưa có public key, forward đến generateKey.jsp
        if (user.getPublicKey() == null || user.getPublicKey().isEmpty()) {
            request.getRequestDispatcher("/WEB-INF/user/generateKey.jsp").forward(request, response);
            return;
        }

        // Nếu đã có public key, chuyển hướng về trang chủ hoặc xử lý khác
        response.sendRedirect("/user/home");
    }



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
            RSAKeyGeneratorImpl rsaKeyGenerator = new RSAKeyGeneratorImpl();
            KeyPair keyPair = rsaKeyGenerator.generateKeyPair();
            PublicKey publicKey = keyPair.getPublic();
            PrivateKey privateKey = keyPair.getPrivate();

            String publicKeyBase64 = rsaKeyGenerator.encodePublicKey(publicKey);
            String privateKeyBase64 = rsaKeyGenerator.encodePrivateKey(privateKey);

            String ip = request.getRemoteAddr();
            UserService.getInstance().savePublicKey(user, publicKeyBase64, ip, "/user/generateKey");

            user.setPublicKey(publicKeyBase64);
            session.setAttribute("auth", user);

            String download = request.getParameter("download");
            if ("true".equalsIgnoreCase(download)) {
                sendPrivateKeyAsFile(response, privateKeyBase64, user.getEmail());
                return;
            }

            // Nếu không yêu cầu tải khóa riêng, trả về thông báo thành công và chuyển hướng về trang chủ
            response.getWriter().write("{\"status\":\"success\", \"message\":\"Keys generated successfully.\"}");

            session.setAttribute("auth", user);
            session.setAttribute("flag", 0);
            // Chuyển hướng về trang chủ sau khi tạo khóa xong
            response.sendRedirect(request.getContextPath() + "/user/home");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("{\"status\":\"error\", \"message\":\"Failed to generate keys. Please try again later.\"}");
        }
    }


    private void sendPrivateKeyAsFile(HttpServletResponse response, String privateKey, String userEmail) throws IOException {
        String fileName = userEmail + "_private_key.pem";
        byte[] privateKeyBytes = privateKey.getBytes("UTF-8");

        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
        response.setContentLength(privateKeyBytes.length);

        try (ServletOutputStream outputStream = response.getOutputStream()) {
            outputStream.write(privateKeyBytes);
            outputStream.flush();
        }
    }


}
