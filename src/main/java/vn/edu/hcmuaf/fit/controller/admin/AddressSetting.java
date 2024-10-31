package vn.edu.hcmuaf.fit.controller.admin;

import org.json.simple.JSONObject;
import vn.edu.hcmuaf.fit.model.Address;
import vn.edu.hcmuaf.fit.service.impl.AddressService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(urlPatterns = "/admin/list-address")
public class AddressSetting extends HttpServlet {
    private final AddressService addressService = (AddressService) AddressService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        request.setAttribute("current_page", "Admin");
        request.setAttribute("title", "Quản lý Admin");

        String type = request.getParameter("type");
        String id = request.getParameter("id");

        Address address = new Address();
        Address addresses = addressService.loadAddress();

        if (type != null && !type.isEmpty()) {
            request.setAttribute("type", type);
        }

        if ("edit".equals(type) && id != null) {
            address = addressService.getAddressById(Integer.parseInt(id));
            if (address == null) {
                request.setAttribute("error", "Địa chỉ không tồn tại.");
            }
        }

        request.setAttribute("address", address);
        request.setAttribute("addresses", addresses);
        request.getRequestDispatcher("/WEB-INF/admin/setting-address.jsp").forward(request, response);
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
        String addressStr = request.getParameter("address");
        String phone = request.getParameter("phone");
        String hotline = request.getParameter("hotline");
        String email = request.getParameter("email");
        String timeOpen = request.getParameter("timeOpen");
        String map = request.getParameter("map");

        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null) ip = request.getRemoteAddr();

        Address address;

        if ("edit".equals(action) || "add".equals(action)) {
            try {
                address = new Address();
                if (id != null && !id.isEmpty()) {
                    address.setId(Integer.parseInt(id));
                }

                address.setAddress(addressStr);
                address.setPhone(phone);
                address.setHotline(hotline);
                address.setEmail(email);
                address.setTimeOpen(timeOpen);
                address.setMap(map);

                boolean valid = addressStr != null && phone != null && hotline != null && email != null;

                if (valid && "edit".equals(action)) {
                    addressService.updateAddress(address, ip, "admin/list-address");
                    jsonResponse.put("status", "success");
                } else if (valid && "add".equals(action)) {
                    addressService.insertAddress(address, ip, "admin/list-address");
                    jsonResponse.put("status", "success");
                }
            } catch (NumberFormatException e) {
                jsonResponse.put("error", "Invalid number format.");
                System.out.println("Number format exception: " + e.getMessage());
            }
        } else if ("delete".equals(action)) {
            try {
                Address addressToDelete = new Address();
                addressToDelete.setId(Integer.valueOf(id));

                boolean deleted = addressService.deleteAddress(addressToDelete, ip, "admin/list-address");

                if (deleted) {
                    jsonResponse.put("status", "success");
                    System.out.println("Address with ID " + id + " deleted successfully.");
                } else {
                    jsonResponse.put("status", "error");
                    jsonResponse.put("message", "Failed to delete address.");
                    System.out.println("Failed to delete address with ID " + id + ".");
                }
            } catch (NumberFormatException e) {
                jsonResponse.put("error", "Invalid number format.");
                System.out.println("Number format exception: " + e.getMessage());
            }
        } else if ("setMain".equals(action)) {
            try {
                if (id != null && !id.isEmpty()) {
                    int addressId = Integer.parseInt(id);
                    addressService.setMainAddress(addressId);
                    jsonResponse.put("status", "success");
                    jsonResponse.put("message", "Main address set successfully.");
                    System.out.println("Address with ID " + id + " set as main address.");
                } else {
                    jsonResponse.put("status", "error");
                    jsonResponse.put("message", "Address ID is missing.");
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
