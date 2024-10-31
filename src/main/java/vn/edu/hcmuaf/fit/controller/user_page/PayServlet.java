package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.model.Order;
import vn.edu.hcmuaf.fit.model.OrderItem;
import vn.edu.hcmuaf.fit.model.OrderStatus;
import vn.edu.hcmuaf.fit.service.impl.OrderService;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@WebServlet("/user/success")
public class PayServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null && action.equals("vnpay")) {
            String ip = request.getHeader("X-FORWARDED-FOR");
            if (ip == null) ip = request.getRemoteAddr();
            HttpSession session = request.getSession(true);
            session.removeAttribute("address");
            session.removeAttribute("txt_inv_customer");
            session.removeAttribute("txt_billing_mobile");
            Map<Order, List<OrderItem>> map = (Map<Order, List<OrderItem>>) session.getAttribute("orders");
            String responseCode = request.getParameter("vnp_ResponseCode");
            if (responseCode.equals("00")) {
                String dayPayment = request.getParameter("vnp_PayDate");
                SimpleDateFormat inputFormat = new SimpleDateFormat("yyyyMMddHHmmss");
                SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                try {
                    Date date = inputFormat.parse(dayPayment);
                    String formattedDate = outputFormat.format(date);
                    for (Order order : map.keySet()) {
                        boolean success = OrderService.getInstance().updateTimePayment(order, formattedDate, ip, "user/success");
                        if (success) {
                            OrderStatus status = new OrderStatus();
                            status.setId(2);
                            order.setStatus(status);
                            OrderService.getInstance().updateOrderStatus(order, ip, "user/success");
                            session.removeAttribute("orders");
                        }
                        break;
                    }
                } catch (ParseException e) {
                    response.getWriter().println("Error parsing" + e.getLocalizedMessage());
                }
            }
        }
        request.getRequestDispatcher("/WEB-INF/user/order_success.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}