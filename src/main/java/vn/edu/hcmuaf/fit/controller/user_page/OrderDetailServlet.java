package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.model.*;
import vn.edu.hcmuaf.fit.service.impl.DeliveryService;
import vn.edu.hcmuaf.fit.service.impl.OrderService;
import vn.edu.hcmuaf.fit.service.impl.OrderStatusService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet("/user/order_detail")
public class OrderDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("auth");
        if (user == null) request.getRequestDispatcher("/WEB-INF/user/signIn.jsp").forward(request, response);
        else {
            String orderIdParam = request.getParameter("id");
            double re = 0.0;
            if (orderIdParam != null && !orderIdParam.isEmpty()) {
                try {
                    int order_id = Integer.parseInt(orderIdParam);
                    Order o = new Order();
                    o.setId(order_id);
                    DeliveryAddress address = DeliveryService.getInstance().loadAddressByOrder(o);
                    Map<Order, List<OrderItem>> map = OrderService.getInstance().loadOrderProductByOrder(o);
                    for (List<OrderItem> item : map.values()) {
                        for (OrderItem oi : item) {
                            re += oi.getOrderPrice()*oi.getQuantity();
                        }
                    }
                    List<OrderItem> item = new ArrayList<>();
                    for (Map.Entry<Order, List<OrderItem>> order : map.entrySet()) {
                        o = order.getKey();
                        item = order.getValue();
                    }
                    request.setAttribute("address", address);
                    request.setAttribute("order", o);
                    request.setAttribute("item", item);

                    Integer sum = OrderService.getInstance().getOrderPriceHasVoucher(o);
                    if (sum == null) sum = OrderService.getInstance().getOrderPriceNotVoucher(o);

                    double ship = 20000.0;

                    request.setAttribute("sum", re);
                    request.setAttribute("retain", re - sum);
                    request.setAttribute("ship", ship);
                    request.setAttribute("total_money", sum + ship);

                    request.getRequestDispatcher(request.getServletContext().getContextPath() + "/WEB-INF/user/order_detail.jsp").forward(request, response);
                } catch (NumberFormatException e) {
                    response.getWriter().println("Invalid order ID format.");
                }
            } else {
                response.getWriter().println("Order ID is missing or empty.");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null) ip = request.getRemoteAddr();

        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("auth");
        if (user == null) {
            out.write("{\"status\": \"failed\"}");
            out.close();
            return;
        }
        String id = request.getParameter("id");
        String action = request.getParameter("action");
        switch (action) {
            case "cancel":
                if (id != null && !id.isEmpty()) {
                    Order order = new Order();
                    order.setId(Integer.parseInt(id));
                    OrderStatus status = new OrderStatus();
                    status.setId(5);
                    order.setStatus(status);
                    OrderService.getInstance().updateOrderStatus(order, ip, "/user/order_detail");
                    out.write("{\"status\": \"success\"}");
                } else {
                    out.write("{ \"status\": \"empty\", \"error\": \"Order ID is missing.\"}");
                }
            break;
            case "rollback":
                if (id != null && !id.isEmpty()) {
                    String payment = request.getParameter("payment");
                    Order order = new Order();
                    order.setId(Integer.parseInt(id));
                    OrderStatus status = new OrderStatus();
                    Order o = OrderService.getInstance().hasDatePayment(order);
                    if (payment != null && !payment.isEmpty()) {
                        if (payment.equals("1")) {
                            status.setId(7);
                        } else {
                            if (o != null) status.setId(2);
                            else status.setId(1);
                        }
                    }
                    order.setStatus(status);
                    OrderService.getInstance().updateOrderStatus(order, ip, "/user/order_detail");
                    OrderStatus s = OrderStatusService.getInstance().getStatusById(status);
                    out.write("{\"status\": \"success\", \"message\": \""+s.getStatus_name()+"\"}");
                } else {
                    out.write("{ \"status\": \"empty\", \"error\": \"Order ID is missing.\"}");
                }
                break;
        }
        out.flush();
        out.close();
    }
}
