package vn.edu.hcmuaf.fit.controller.admin;

import org.json.simple.JSONObject;
import vn.edu.hcmuaf.fit.model.*;
import vn.edu.hcmuaf.fit.service.impl.DiscountService;
import vn.edu.hcmuaf.fit.service.impl.ProductService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@WebServlet("/admin/product")
public class Product_direct extends HttpServlet {
    private final ProductService productService = (ProductService) ProductService.getInstance();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        request.setAttribute("current_page", "product");
        request.setAttribute("title", "Sản phẩm");

        String type = request.getParameter("type");
        String id = request.getParameter("id");

        Product product = new Product();
        Map<Product, List<String>> products = productService.getAllProducts();

        if (type != null && !type.isEmpty()) {
            request.setAttribute("type", type);
        }

        if ("edit".equals(type) && id != null) {
            Map<Product, List<String>> productWithSupplierInfo = productService.getProductByIdWithSupplierInfo(new Product(Integer.parseInt(id)), request.getRemoteAddr(), request.getHeader("User-Agent"));
            if (productWithSupplierInfo != null && !productWithSupplierInfo.isEmpty()) {
                product = productWithSupplierInfo.keySet().iterator().next();
            } else {
                request.setAttribute("error", "Sản phẩm không tồn tại.");
            }
        }

        request.setAttribute("product", product);
        request.setAttribute("products", products);
        request.getRequestDispatcher("/WEB-INF/admin/product.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();
        LocalDate today = LocalDate.now();

        String action = request.getParameter("action");
        String id = request.getParameter("id");
        String productName = request.getParameter("productName");
        String priceStr = request.getParameter("price");
        String cateIdStr = request.getParameter("categoryId");
        String quantityStr = request.getParameter("quantity");
        String purpose = request.getParameter("purpose");
        String contraindications = request.getParameter("contraindications");
        String ingredients = request.getParameter("ingredients");
        String dosage = request.getParameter("dosage");
        String instructions = request.getParameter("instructions");
        String warrantyPeriod = request.getParameter("warrantyPeriod");
        String storageCondition = request.getParameter("storageCondition");
        String typeIdStr = request.getParameter("typeId");
        String supplierIdStr = request.getParameter("supplierId");
        String activeParam = request.getParameter("active");
        Boolean active = (activeParam != null && activeParam.equalsIgnoreCase("true"));

        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null) ip = request.getRemoteAddr();

        Product product;

        if ("edit".equals(action) || "add".equals(action)) {
            try {
                Integer price = Integer.parseInt(priceStr.trim());
                Integer cateId = Integer.parseInt(cateIdStr.trim());
                Integer quantity = Integer.parseInt(quantityStr.trim());
                Integer typeId = Integer.parseInt(typeIdStr.trim());
                Integer supplierId = Integer.parseInt(supplierIdStr.trim());

                product = new Product();
                product.setId(id == null ? null : Integer.parseInt(id));
                product.setProductName(productName);
                product.setPrice(price);
                product.setQuantity(quantity);
                product.setPurpose(purpose);
                product.setContraindications(contraindications);
                product.setIngredients(ingredients);
                product.setDosage(dosage);
                product.setInstructions(instructions);
                product.setWarrantyPeriod(warrantyPeriod);
                product.setStorageCondition(storageCondition);
                product.setCate(new ProductCategories(cateId));
                product.setType(new ProductTypes(typeId));
                product.setSupplier(new Supplier(supplierId));
                product.setActive(active);

                boolean valid = productName != null && price > 0 && quantity != null && cateId != null && typeId != null && supplierId != null;


                if (valid && "edit".equals(action)) {
                    productService.updateProduct(product, ip, "admin/product");
                    jsonResponse.put("status", "success");

                } else if (valid && "add".equals(action)) {
                    productService.addProduct(product, ip, "admin/product");
                    jsonResponse.put("status", "success");

                }
            } catch (NumberFormatException e) {
                response.getWriter().print("{\"error\":\"Invalid number format.\"}");
                response.getWriter().flush();
                return;
            }
        } else if ("delete".equals(action)) {
            try {
                Product productToDelete = new Product();
                productToDelete.setId(Integer.valueOf(id));

                // In thông tin sản phẩm ra console trước khi xóa
                System.out.println("Attempting to delete product with ID: " + id);


                boolean deleted = productService.deleteProductById(productToDelete, ip, "admin/product");

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
