package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.Order;
import vn.edu.hcmuaf.fit.model.OrderItem;

import java.util.List;
import java.util.Map;

public interface IOrderDAO extends GenericDAO<Order> {

    Map<Order, List<OrderItem>> loadAllOrders();

    Map<Order, List<OrderItem>> loadOrdersByStatus(Integer status);

    Integer getOrderPriceNotVoucher(Integer orderId);

    Integer countSaleProducts(Integer productId);

    Integer getProfitOfProduct(Integer productId);

    Integer getOrderPriceHasVoucher(Integer orderId);

    Map<Order, List<OrderItem>> loadOrderProductByOrder(Integer orderId);

    Map<Order, List<OrderItem>> loadOrderProductByUser(Integer userId);

    Order insertOrders(Integer userId, Integer addressId, Integer shipType, Integer discountId,
                                             Integer paymentId, String note, Integer statusId);

    Map<Order, List<OrderItem>> loadOrderNear(Integer limit);

    boolean updateOrderStatus(Integer orderId, Integer statusId);

    boolean deleteOrder(Integer orderId);

    boolean updateTimePayment(Integer orderId, String date);

    boolean updateOrdStatusByAdmin(Integer orderId, Integer adminId, Integer statusId);

    boolean updatePayment(Integer orderId, Integer payment);

    boolean updateDelivery(Integer orderId, Integer delivery);

    Order getOrderStatus(Order od);

    List<Order> hasDatePayment(Integer orderId);
}