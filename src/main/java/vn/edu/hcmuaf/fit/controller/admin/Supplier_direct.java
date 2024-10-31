package vn.edu.hcmuaf.fit.controller.admin;

import org.json.simple.JSONObject;
import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.model.Supplier;
import vn.edu.hcmuaf.fit.service.impl.SupplierService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(urlPatterns = "/admin/supplier")
public class Supplier_direct extends HttpServlet {
    private final SupplierService supplierService = (SupplierService) SupplierService.getInstance();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        request.setAttribute("current_page", "supplier");
        request.setAttribute("title", "Nhà cung cấp");

        String type = request.getParameter("type");
        String id = request.getParameter("id");

        Supplier supplier = new Supplier();
        List<Supplier> suppliers = supplierService.getSuppliers();

        if (type != null && !type.isEmpty()) {
            request.setAttribute("type", type);
        }

        if ("edit".equals(type) && id != null) {
            supplier = supplierService.getSupplierById(Integer.parseInt(id));
            if (supplier == null) {
                request.setAttribute("error", "Nhà cung cấp không tồn tại.");
            }
        }

        request.setAttribute("supplier", supplier);
        request.setAttribute("suppliers", suppliers);
        request.getRequestDispatcher("/WEB-INF/admin/supplier.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();

        String action = request.getParameter("action");
        String id = request.getParameter("id");
        String supplierName = request.getParameter("supplierName");
        String contactName = request.getParameter("contactName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String detailAddress = request.getParameter("detailAddress");
        String imageUrl = request.getParameter("imageUrl");
        String activeParam = request.getParameter("active");
        Boolean active = (activeParam != null && activeParam.equalsIgnoreCase("true"));
        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null) ip = request.getRemoteAddr();

        Supplier supplier;

        if ("edit".equals(action) || "add".equals(action)) {
            try {
                supplier = new Supplier();
                if (id != null && !id.isEmpty()) {
                    supplier.setId(Integer.parseInt(id));
                }
                supplier.setSupplierName(supplierName);
                supplier.setContactName(contactName);
                supplier.setEmail(email);
                supplier.setPhone(phone);
                supplier.setDetailAddress(detailAddress);
                supplier.setImageUrl(imageUrl);
                supplier.setActive(active);

                boolean valid = supplierName != null &&  contactName != null && email != null && phone != null  &&  detailAddress != null;

                if (valid && "edit".equals(action)) {
                    supplierService.updateSupplier(supplier, supplierName, email, phone, detailAddress, imageUrl, active, ip, "admin/supplier");
                    jsonResponse.put("status", "success");
                } else if (valid && "add".equals(action)) {
                    supplierService.insertSupplier(supplier, ip, "admin/supplier");
                    jsonResponse.put("status", "success");
                }
            } catch (NumberFormatException e) {
                response.getWriter().print("{\"error\":\"Invalid number format.\"}");
                response.getWriter().flush();
                return;
            }
        } else if ("delete".equals(action)) {
            try {
                Supplier supplierToDelete = new Supplier();
                supplierToDelete.setId(Integer.valueOf(id));

                boolean deleted = supplierService.deleteSupplier(supplierToDelete, ip, "admin/supplier");

                if (deleted) {
                    jsonResponse.put("status", "success");
                    System.out.println("Product with ID " + id + " deleted successfully.");
                } else {
                    jsonResponse.put("status", "error");
                    jsonResponse.put("message", "Failed to delete product.");
                    System.out.println("Failed to delete product with ID " + id + ".");
                }
            } catch (NumberFormatException e) {
                jsonResponse.put("error", "Invalid number format.");
            }
        }

        out.print(jsonResponse.toJSONString());
        out.flush();
        out.close();
    }
}
