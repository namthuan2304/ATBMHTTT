package vn.edu.hcmuaf.fit.controller.admin;

import org.json.simple.JSONObject;
import vn.edu.hcmuaf.fit.model.Role;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.impl.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

@WebServlet(urlPatterns = "/admin/list-admin")
public class Admin_direct extends HttpServlet {
    private final UserService userService = (UserService) UserService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        request.setAttribute("current_page", "Admin");
        request.setAttribute("title", "Quản lý Admin");

        String type = request.getParameter("type");
        String id = request.getParameter("id");

        User user = new User();

        Role role = new Role();
        role.setId(2);
        List<User> users = userService.loadUsersWithRole(role);

        if (type != null && !type.isEmpty()) {
            request.setAttribute("type", type);
        }

        if ("edit".equals(type) && id != null) {
            user.setId(Integer.parseInt(id));
            user = userService.loadUsersWithId(user, request.getRemoteAddr(), request.getHeader("User-Agent"));

            if (user != null) {
                System.out.println("Editing user: " + user);
            } else {
                request.setAttribute("error", "Người dùng không tồn tại.");
                System.out.println("User null");
            }
        }

        request.setAttribute("user", user);
        request.setAttribute("users", users);
        request.getRequestDispatcher("/WEB-INF/admin/list-admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();

        String action = request.getParameter("action");
        String id = request.getParameter("id");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullName");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");
        String detail_address = request.getParameter("detail_address");
        String phone = request.getParameter("phone");
        String avatar = request.getParameter("avatar");
        String verifiedParam = request.getParameter("verified");
        Boolean verified = (verifiedParam != null && verifiedParam.equalsIgnoreCase("true"));

        String role_idStr = request.getParameter("role");
        String dateCreated = request.getParameter("dateCreated");



        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null) ip = request.getRemoteAddr();

        User user;

        if ("edit".equals(action) || "add".equals(action)) {
            try {
                user = new User();
                if (id != null && !id.isEmpty()) {
                    user.setId(Integer.parseInt(id));
                }
                Integer role_id = null;
                if (role_idStr != null && !role_idStr.isEmpty()) {
                    role_id = Integer.parseInt(role_idStr.trim());
                }

                user.setUsername(username);
                user.setPassword(password);
                user.setEmail(email);
                user.setFullName(fullName);
                if (dateOfBirth != null && !dateOfBirth.isEmpty()) {
                    user.setDateOfBirth(Date.valueOf(dateOfBirth));
                }
                user.setCity(city);
                user.setDistrict(district);
                user.setWard(ward);
                user.setDetail_address(detail_address);
                user.setPhone(phone);
                user.setAvatar(avatar);
                user.setVerified(verified);
                if (role_id != null) {
                    user.setRole(new Role(role_id));
                }

                if (dateCreated != null && !dateCreated.isEmpty()) {
                    String formattedDateCreated = dateCreated.replace("T", " ");
                    user.setDateCreated(Timestamp.valueOf(formattedDateCreated));
                }



                boolean valid = username != null && email != null  && password != null;

                if (valid && "edit".equals(action)) {
                    userService.updateUserInAdmin(user, ip, "admin/user");
                    jsonResponse.put("status", "success");
                } else if (valid && "add".equals(action)) {
                    userService.addAdmin(user, ip, "admin/user");
                    jsonResponse.put("status", "success");
                }
            } catch (NumberFormatException e) {
                jsonResponse.put("error", "Invalid number format.");
                System.out.println("Number format exception: " + e.getMessage());
            }
        } else if ("delete".equals(action)) {
            try {
                User userToDelete = new User();
                userToDelete.setId(Integer.valueOf(id));

                boolean deleted = userService.deleteUserById(userToDelete, ip, "admin/user");

                if (deleted) {
                    jsonResponse.put("status", "success");
                    System.out.println("User with ID " + id + " deleted successfully.");
                } else {
                    jsonResponse.put("status", "error");
                    jsonResponse.put("message", "Failed to delete user.");
                    System.out.println("Failed to delete user with ID " + id + ".");
                }
            } catch (NumberFormatException e) {
                jsonResponse.put("error", "Invalid number format.");
                System.out.println("Number format exception: " + e.getMessage());
            }
        }

        out.print(jsonResponse.toJSONString());
        out.flush();
        out.close();
    }

}
