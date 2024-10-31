//package vn.edu.hcmuaf.fit.controller.admin;
//
//import org.json.JSONArray;
//import org.json.simple.JSONObject;
//import vn.edu.hcmuaf.fit.dao.impl.DiscountDAO;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import vn.edu.hcmuaf.fit.model.Discount;
//import vn.edu.hcmuaf.fit.model.ProductCategories;
//import vn.edu.hcmuaf.fit.model.ProductGroups;
//import vn.edu.hcmuaf.fit.service.impl.CategoryService;
//import vn.edu.hcmuaf.fit.service.impl.DiscountService;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.Date;
//import java.time.LocalDate;
//import java.util.List;
//import java.util.Map;
//
//@WebServlet("/admin/coupon-code")
//public class CouponCode extends HttpServlet {
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setCharacterEncoding("UTF-8");
//        response.setContentType("application/json; charset=UTF-8");
//        response.setCharacterEncoding("UTF-8");
//
//        request.setAttribute("current_page", "coupon-code");
//        request.setAttribute("title", "Mã giảm giá");
//        String type = request.getParameter("type");
//        String id = request.getParameter("id");
//
//        Discount coupon = new Discount();
//        List<Discount> coupons = DiscountService.getInstance().getAllCoupons();
//
//        if (type != null && !type.isEmpty()) {
//            request.setAttribute("type", type);
//        }
//
//        if ("edit".equals(type)) {
//            coupon = DiscountService.getInstance().getCouponById(Integer.valueOf(id));
//        }
//
//
//        request.setAttribute("coupon", coupon);
//        request.setAttribute("coupons", coupons);
//        request.getRequestDispatcher("/WEB-INF/admin/coupon-code.jsp").forward(request, response);
//
//    }
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setCharacterEncoding("UTF-8");
//        response.setContentType("application/json; charset=UTF-8");
//        response.setCharacterEncoding("UTF-8");
//        PrintWriter out = response.getWriter();
//        JSONObject jsonResponse = new JSONObject();
//        LocalDate today = LocalDate.now();
//
//        request.setAttribute("current_page", "coupon-code");
//        request.setAttribute("title", "Mã giảm giá");
//        String action = request.getParameter("action");
//        String type = request.getParameter("type");
//        String id = request.getParameter("id");
//        String nameDiscount = request.getParameter("name");
//        String salePercent = request.getParameter("sale");
//        String quantity = request.getParameter("quantity");
//        String dateStart = request.getParameter("dateStart");
//        String dateEnd = request.getParameter("dateEnd");
//
//        String ip = request.getHeader("X-FORWARDED-FOR");
//        if (ip == null) ip = request.getRemoteAddr();
//
//        Discount coupon;
//
//        if ("edit".equals(action) || "add".equals(action)) {
//            coupon = new Discount(id == null ? null : Integer.valueOf(id), nameDiscount, "", Double.valueOf(salePercent), Integer.valueOf(quantity), Date.valueOf(dateStart), Date.valueOf(dateEnd));
//
//            boolean valid = coupon.getDiscountName() != null
//                    && coupon.getSalePercent() > 0
//                    && coupon.getSalePercent() < 100 && coupon.getQuantity() != null
//                    && coupon.getStartDate().toLocalDate().isAfter(today)
//                    && coupon.getExpirationDate().toLocalDate().isAfter(coupon.getStartDate().toLocalDate());
//
//            if (valid && "edit".equals(action)) {
//                DiscountService.getInstance().editCoupon(coupon, ip, "admin/coupon-code");
//                jsonResponse.put("status", "success");
//            } else if (valid && "add".equals(action)) {
//                if(DiscountService.getInstance().getCouponByName(coupon.getDiscountName()) == null ) {
//                    System.out.println("thoax maximum");
//                    DiscountService.getInstance().addCoupon(coupon, ip, "admin/coupon-code");
//                    jsonResponse.put("status", "success");
//                } else {
//                    jsonResponse.put("error", "Mã đã tồn tại!");
//                }
//            } else {
//                jsonResponse.put("error", "Thông tin phải tuân theo:\n" +
//                        "% Khuyến mãi > 0 và < 100\n" +
//                        "Ngày bắt đầu > hôm nay\n" +
//                        "Ngày hết hạn > ngày bắt đầu");
//            }
//        } else if ("delete".equals(action)) {
//            coupon = new Discount();
//            coupon.setId(Integer.valueOf(id));
//            DiscountService.getInstance().delCoupon(coupon, ip, "admin/coupon-code");
//        } else if ("listAll".equals(action)) {
//            List<Discount> coupons = DiscountService.getInstance().getAllCoupons();
//            JSONArray jsonArray = new JSONArray();
//            for (Discount cp : coupons) {
//                JSONObject couponJson = new JSONObject();
//                couponJson.put("id", cp.getId());
//                couponJson.put("name", cp.getDiscountName());
//                couponJson.put("salePercent", cp.getSalePercent());
//                couponJson.put("quantity", cp.getQuantity());
//                couponJson.put("startDate", cp.getStartDate());
//                couponJson.put("expirationDate", cp.getExpirationDate());
//                jsonArray.put(couponJson);
//            }
//            jsonResponse.put("coupons", jsonArray);
//        }
//
//        out.print(jsonResponse.toJSONString());
//        out.flush();
//        out.close();
//    }
//}
