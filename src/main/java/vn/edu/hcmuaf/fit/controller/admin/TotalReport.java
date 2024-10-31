package vn.edu.hcmuaf.fit.controller.admin;

import org.json.JSONArray;
import org.json.simple.JSONObject;
import vn.edu.hcmuaf.fit.model.Order;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.model.OrderItem;
import vn.edu.hcmuaf.fit.model.OrderStatus;
import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.service.impl.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

//import static vn.edu.hcmuaf.fit.dao.OrderDAO.*;


@WebServlet(urlPatterns = "/admin/total-report")
public class TotalReport extends HttpServlet {
    UserService userSer = new UserService();
    DeliveryService addressSer = new DeliveryService();
    ShippingTypeService typeSer = new ShippingTypeService();
    DiscountService discountSer = new DiscountService();
    PaymentService paymentSer = new PaymentService();
    OrderStatusService statusSer = new OrderStatusService();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null) ip = request.getRemoteAddr();

        Map<Order, List<OrderItem>> orderList = OrderService.getInstance().loadAllOrders();
        Map<Integer, Double> totalPay = new HashMap<>();

        String type = request.getParameter("type");
        String id = request.getParameter("id");

        if (type != null && !type.isEmpty()) {
            request.setAttribute("type", type);
        }

        if ("edit".equals(type)) {
            Order od = new Order();
            od.setId(Integer.valueOf(id));
            orderList = OrderService.getInstance().loadOrderProductByOrder(od);
        }

        for (Map.Entry<Order, List<OrderItem>> entry : orderList.entrySet()) {
            Order order = entry.getKey();
            List<OrderItem> itemList = entry.getValue();

            load(order, userSer, addressSer, typeSer, discountSer, paymentSer, statusSer, ip, "/admin/total-report");

            double total = 0.0;
            for(OrderItem orderItem : itemList) {
                Map<Product, List<String>> productMap = ProductService.getInstance().getProductByIdWithSupplierInfo(orderItem.getProduct(), ip, "/admin/total-report");
                orderItem.setProduct(productMap.keySet().iterator().next());
                total += orderItem.getOrderPrice();
            }

            totalPay.put(order.getId(), total);
        }
        List<OrderStatus> listStatus = OrderStatusService.getInstance().getAllStatus();

        request.setAttribute("listStatus", listStatus);
        request.setAttribute("total_report", orderList);
        request.setAttribute("total_pay", totalPay);
        request.setAttribute("title", "Danh sách đặt hàng");

        request.getRequestDispatcher("/WEB-INF/admin/total-report.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();

        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null) ip = request.getRemoteAddr();

        String type = request.getParameter("type");
        String action = request.getParameter("action");
        String id = request.getParameter("id");
        String newStatus = request.getParameter("newStatus");
        String statusIdParam = request.getParameter("status_id");

        int statusId = 0;

        if (statusIdParam != null && !statusIdParam.isEmpty()) {
            try {
                statusId = Integer.parseInt(statusIdParam);
            } catch (NumberFormatException e) {
                jsonResponse.put("success", false);
                jsonResponse.put("message", "Invalid status ID.");
                out.print(jsonResponse.toString());
                out.flush();
                return;
            }
        }

        Map<Order, List<OrderItem>> orderList;
        if (statusId != 0) {
            orderList = OrderService.getInstance().loadOrdersByStatus(new OrderStatus(statusId, "", ""));
        } else {
            orderList = OrderService.getInstance().loadAllOrders();
        }

        JSONArray ordersArray = new JSONArray();

        if("show".equals(type)) {
            System.out.println(type);
            for (Map.Entry<Order, List<OrderItem>> entry : orderList.entrySet()) {
                JSONObject orderObj = new JSONObject();
                Order order = entry.getKey();
                List<OrderItem> itemList = entry.getValue();

                load(order, userSer, addressSer, typeSer, discountSer, paymentSer, statusSer, ip, "/admin/total-report");

                orderObj.put("orderId", order.getId());
                orderObj.put("orderDate", order.getDateCreated().toString());

                if (order.getUser() != null) {
                    orderObj.put("customerName", order.getUser().getUsername());
                } else {
                    orderObj.put("customerName", "Không xác định");
                }

                double totalAmount = calculateTotalAmount(itemList);
                orderObj.put("totalAmount", totalAmount);

                if (order.getStatus() != null) {
                    orderObj.put("statusName", order.getStatus().getId());
                } else {
                    orderObj.put("statusName", "Không xác định");
                }

                JSONArray itemsArray = new JSONArray();
                for (OrderItem item : itemList) {
                    JSONObject itemObj = new JSONObject();
                    itemObj.put("itemId", item.getOrder().getId());
                    itemObj.put("productName", item.getProduct().getProductName());
                    itemsArray.put(itemObj);
                }
                orderObj.put("items", itemsArray);

                ordersArray.put(orderObj);
            }
        } else if ("edit".equals(action)) {
            Order od = new Order();
            od.setId(Integer.valueOf(id));
            Integer desiredState = getStatusIdByName(newStatus);
            Order currentStatus = OrderService.getInstance().getOrderStatus(od);


            if (canChangeState(currentStatus.getStatus().getId(), desiredState)) {
                od.setStatus(new OrderStatus(desiredState, "", ""));
                OrderService.getInstance().updateOrderStatus(od, ip, "/admin/total-report");
                jsonResponse.put("success", true);
                jsonResponse.put("message", "Trạng thái đơn hàng đã thay đổi thành công.");
            } else {
                jsonResponse.put("success", false);
                jsonResponse.put("message", "Trạng thái đơn hàng không thể thay đổi.");
            }
        }

        jsonResponse.put("orders", ordersArray);
        out.print(jsonResponse.toString());
        out.flush();
        out.close();
    }

    private void load(Order order, UserService userSer, DeliveryService addressSer, ShippingTypeService typeSer, DiscountService discountSer, PaymentService paymentSer, OrderStatusService statusSer, String ip, String address) {
        order.setUser(userSer.loadUsersWithId(order.getUser(), ip, address));
        order.setAddress(addressSer.loadAddressById(order.getAddress()));
        order.setType(typeSer.getShippingTypeById(order.getType()));
        order.setDiscount(discountSer.getCouponById(order.getDiscount().getId()));
        order.setPayment(paymentSer.getPaymentById(order.getPayment()));
        order.setStatus(statusSer.getStatusById(order.getStatus()));
        order.setAdmin(userSer.loadUsersWithId(order.getAdmin(), ip, address));
    }

    private double calculateTotalAmount(List<OrderItem> itemList) {
        double total = 0.0;
        for (OrderItem item : itemList) {
            total += item.getOrderPrice();
        }
        return total;
    }

    private boolean canChangeState(Integer currentStateId, Integer desiredStateId) {
        switch (currentStateId) {
            case 5: // Đã huỷ
            case 6: // Trả hàng/ Hoàn tiền
            case 4: // Chờ đánh giá
                return false;
            case 1: // Chờ Thanh Toán
                return desiredStateId == 3 || desiredStateId == 5; // Chờ giao hàng hoặc Đã huỷ
            case 2: // Chờ vận chuyển
                return desiredStateId == 4 || desiredStateId == 6; // Chờ đánh giá hoặc Trả hàng/ Hoàn tiền
            case 3: // Chờ giao hàng
                return desiredStateId == 6 || desiredStateId == 5; // Trả hàng/ Hoàn tiền hoặc Đã huỷ
            default:
                return false;
        }
    }

    public int getStatusIdByName(String statusName) {
        List<OrderStatus> listStatus = OrderStatusService.getInstance().getAllStatus();
        for (OrderStatus status : listStatus) {
            if (status.getStatus_name().equals(statusName)) {
                return status.getId();
            }
        }
        return -1;
    }


}