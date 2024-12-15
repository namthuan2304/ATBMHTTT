package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@WebServlet("/user/downloadToolKySo")
public class DownloadToolKySoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy file ToolKySo.zip từ resources/tools/ (sẽ được đưa vào classpath)
        InputStream zipFileInputStream = getClass().getClassLoader().getResourceAsStream("tools/ToolKySo.zip");

        if (zipFileInputStream == null) {
            // Trả về lỗi nếu không tìm thấy file
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Không tìm thấy file ToolKySo.zip");
            return;
        }

        // Thiết lập các header cho trình duyệt để tải file về
        response.setContentType("application/zip");
        response.setHeader("Content-Disposition", "attachment; filename=ToolKySo.zip");

        try (BufferedInputStream bufferedInputStream = new BufferedInputStream(zipFileInputStream);
             OutputStream outputStream = response.getOutputStream()) {

            byte[] buffer = new byte[1024];
            int length;
            while ((length = bufferedInputStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, length);
            }

            outputStream.flush();
        }
    }
}
