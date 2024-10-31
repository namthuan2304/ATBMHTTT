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

@WebServlet(urlPatterns = "/admin/user")
public class Users_direct extends HttpServlet {
    private final UserService userService = (UserService) UserService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        request.setAttribute("current_page", "user");
        request.setAttribute("title", "Quản lý người dùng");

        String type = request.getParameter("type");
        String id = request.getParameter("id");

        User user = new User();

        Role role = new Role();
        role.setId(1);
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
        request.getRequestDispatcher("/WEB-INF/admin/users.jsp").forward(request, response);
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

        if ("edit".equals(action)) {
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

                boolean valid = username != null && email != null && fullName != null && role_id != null;

                if (valid) {
                    userService.updateUserInAdmin(user, ip, "admin/user");
                    jsonResponse.put("status", "success");
                } else {
                    jsonResponse.put("status", "error");
                    jsonResponse.put("message", "Validation failed. Please check the input values.");

                }
            } catch (NumberFormatException e) {
                jsonResponse.put("error", "Invalid number format.");
                System.out.println("Number format exception: " + e.getMessage());
            } catch (Exception e) {
                jsonResponse.put("error", "An unexpected error occurred.");
                System.out.println("Exception: " + e.getMessage());
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
