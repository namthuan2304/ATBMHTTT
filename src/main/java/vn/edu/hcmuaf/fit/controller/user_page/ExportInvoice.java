package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.model.GeneratePdf;
import vn.edu.hcmuaf.fit.model.Order;
import vn.edu.hcmuaf.fit.model.OrderItem;
import vn.edu.hcmuaf.fit.service.impl.OrderService;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/user/download")
public class ExportInvoice extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=invoice.pdf");
        String id = request.getParameter("id");
        String address = "/user/download";
        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null) ip = request.getRemoteAddr();
        if (id != null || !id.isEmpty()) {
            int orderId = Integer.parseInt(id);
            Order order = new Order();
            order.setId(orderId);
            Map<Order, List<OrderItem>> map = OrderService.getInstance().loadOrderProductByOrder(order);
            for(Map.Entry<Order, List<OrderItem>> entry : map.entrySet()) {
                GeneratePdf.generateInvoice(entry.getKey(), entry.getValue(), ip, address, response.getOutputStream());
            }
        }
    }
}