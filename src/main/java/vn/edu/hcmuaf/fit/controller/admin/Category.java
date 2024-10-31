package vn.edu.hcmuaf.fit.controller.admin;

import org.json.JSONArray;
import org.json.simple.JSONObject;
import vn.edu.hcmuaf.fit.model.ProductCategories;
import vn.edu.hcmuaf.fit.model.ProductGroups;
import vn.edu.hcmuaf.fit.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.service.impl.CategoryService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

@WebServlet("/admin/category")
public class Category extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        request.setAttribute("current_page", "category");
        HttpSession session = request.getSession();
        User admin = (User) session.getAttribute("admin");

//        if (admin == null) {
//            response.sendRedirect("./admin/signIn.jsp");
//        }
        ProductCategories cate = new ProductCategories();


        String type = request.getParameter("type");
        String id = request.getParameter("id");

        if (type != null && !type.isEmpty()) {
            request.setAttribute("type", type);
        }

        if ("edit".equals(type)) {
            cate = CategoryService.getInstance().getCategoryById(Integer.valueOf(id));
        }

        Map<ProductCategories, Integer> categories = CategoryService.getInstance().getQuantityCategories();
        List<ProductGroups> groups = CategoryService.getInstance().getCategoriesGroups();


        request.setAttribute("category", cate);
        request.setAttribute("groups", groups);
        request.setAttribute("categories", categories);

        request.getRequestDispatcher("/WEB-INF/admin/categories.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();


        request.setAttribute("current_page", "category");
        HttpSession session = request.getSession();
        User admin = (User) session.getAttribute("admin");

//        if (admin == null) {
//            response.sendRedirect("./admin/signIn.jsp");
//        }

        String action = request.getParameter("action");
        String category = request.getParameter("category");
        String group = request.getParameter("group");
        String id = request.getParameter("id");
        String isActive = request.getParameter("active");

        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null) ip = request.getRemoteAddr();


        if ("set-status".equals(action)) {
            ProductCategories cate = CategoryService.getInstance().getCategoryById(Integer.valueOf(id));
            CategoryService.getInstance().setCategoryStatus(cate, Boolean.parseBoolean(isActive), ip, "/admin/category");
        } else if ("edit".equals(action)) {
            ProductCategories cate = CategoryService.getInstance().getCategoryById(Integer.valueOf(id));
            if (!CategoryService.getInstance().checkExistCate(category) && !category.isEmpty()) {
                jsonResponse.put("status", "success");
                CategoryService.getInstance().editCategory(cate, category, ip, "/admin/category");
            } else {
                jsonResponse.put("error", "Danh mục đã tồn tại");
            }
        } else if ("add".equals(action)) {
            ProductGroups productGroup = CategoryService.getInstance().getCategoriesGroupById(Integer.valueOf(group));
            ProductCategories cate = new ProductCategories();
            cate.setCategoryName(category);
            cate.setGroup(productGroup);

            if (!CategoryService.getInstance().checkExistCate(cate.getCategoryName()) && !category.isEmpty()) {
                jsonResponse.put("status", "success");
                CategoryService.getInstance().addCategory(cate, ip, "/admin/category");
            } else {
                jsonResponse.put("error", "Danh mục đã tồn tại");
            }
        } else if ("listAll".equals(action)) {
            Map<ProductCategories, Integer> categories = CategoryService.getInstance().getQuantityCategories();
            List<Map.Entry<ProductCategories, Integer>> sortedEntries = new ArrayList<>(categories.entrySet());
            sortedEntries.sort(Comparator.comparingInt(entry -> entry.getKey().getId()));

            JSONArray categoryArray = new JSONArray();
            for (Map.Entry<ProductCategories, Integer> entry : sortedEntries) {
                ProductCategories cate = entry.getKey();
                int quantity = entry.getValue();

                JSONObject categoryJson = new JSONObject();
                categoryJson.put("id", cate.getId());
                categoryJson.put("categoryName", cate.getCategoryName());
                categoryJson.put("quantity", quantity);

                categoryArray.put(categoryJson);
            }
            jsonResponse.put("categories", categoryArray);
        }

        out.print(jsonResponse.toJSONString());
        out.flush();
        out.close();
    }
}
