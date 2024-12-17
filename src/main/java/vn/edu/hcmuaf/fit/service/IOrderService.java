package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.model.*;

import java.util.List;
import java.util.Map;

public interface IOrderService {

    Map<Order, List<OrderItem>> loadAllOrders();

    Map<Order, List<OrderItem>> loadOrdersByStatus(OrderStatus status);

    Integer getOrderPriceNotVoucher(Order order);

    Integer countSaleProducts(Product product);

    Integer getProfitOfProduct(Product product);

    Integer getOrderPriceHasVoucher(Order order);

    Map<Order, List<OrderItem>> loadOrderProductByOrder(Order order);

    Map<Order, List<OrderItem>> loadOrderProductByUser(User user);

    Map<Order, List<OrderItem>> insertOrders(Order order, List<OrderItem> item, String ip, String address);

    Map<Order, List<OrderItem>> loadOrderNear(Integer limit);

    Map<Order, List<OrderItem>> loadLatestOrderByUser(User user);

    boolean updateOrderStatus(Order order, String ip, String address);

    boolean deleteOrder(Order order, String ip, String address);

    boolean updateTimePayment(Order order, String date, String ip, String address);

    boolean updateOrdStatusByAdmin(Order order, String ip, String address);

    boolean updatePayment(Order order, String ip, String address);

    boolean updateDelivery(Order order, String ip, String address);

    Order getOrderStatus(Order od);

    Order hasDatePayment(Order order);

    boolean saveSignature(Order order, String signature, String ip, String address);
}