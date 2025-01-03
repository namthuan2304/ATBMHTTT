package vn.edu.hcmuaf.fit.service.impl;

import vn.edu.hcmuaf.fit.dao.impl.*;
import vn.edu.hcmuaf.fit.model.*;
import vn.edu.hcmuaf.fit.service.IOrderService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class OrderService extends LogDAO<Order> implements IOrderService {
    private static IOrderService instance;

    public static IOrderService getInstance() {
        if (instance == null) {
            instance = new OrderService();
        }
        return instance;
    }

    @Override
    public Map<Order, List<OrderItem>> loadAllOrders() {
        try {
            return OrderDAO.getInstance().loadAllOrders();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Order getOrderStatus(Order od) {
        try {
            return OrderDAO.getInstance().getOrderStatus(od);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Map<Order, List<OrderItem>> loadOrdersByStatus(OrderStatus status) {
        try {
            return OrderDAO.getInstance().loadOrdersByStatus(status.getId());
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Integer getOrderPriceNotVoucher(Order order) {
        try {
            return OrderDAO.getInstance().getOrderPriceNotVoucher(order.getId());
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Integer countSaleProducts(Product product) {
        try {
            return OrderDAO.getInstance().countSaleProducts(product.getId());
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Integer getProfitOfProduct(Product product) {
        try {
            return OrderDAO.getInstance().getProfitOfProduct(product.getId());
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Integer getOrderPriceHasVoucher(Order order) {
        try {
            return OrderDAO.getInstance().getOrderPriceHasVoucher(order.getId());
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Map<Order, List<OrderItem>> loadOrderProductByOrder(Order order) {
        try {
            return OrderDAO.getInstance().loadOrderProductByOrder(order.getId());
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Map<Order, List<OrderItem>> loadOrderProductByUser(User user) {
        try {
            return OrderDAO.getInstance().loadOrderProductByUser(user.getId());
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Map<Order, List<OrderItem>> loadOrderNear(Integer limit) {
        try {
            return OrderDAO.getInstance().loadOrderNear(limit);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Order hasDatePayment(Order order) {
        try {
            return OrderDAO.getInstance().hasDatePayment(order.getId()).get(0);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public boolean saveSignature(Order order, String signature, String hash, String ip, String address) {
        try {
            // Lưu trạng thái trước khi thực hiện cập nhật
            order.setBeforeData("User with ID=" + order.getId() + " has no public key or existing key is being replaced.");

            // Thực hiện lưu chữ ký
            boolean success = OrderDAO.getInstance().saveSignature(order.getId(), signature, hash);

            // Ghi nhận trạng thái sau khi thực hiện
            if (success) {
                order.setAfterData("Signature saved successfully for order ID=" + order.getId());
            } else {
                order.setAfterData("Failed to save signature for order ID=" + order.getId());
            }

            // Ghi log hoạt động
            Level logLevel = success
                    ? LevelDAO.getInstance().getLevel(1).get(0) // Level success
                    : LevelDAO.getInstance().getLevel(2).get(0); // Level error
            super.insert(order, logLevel, ip, address);

            return success;
        } catch (Exception e) {
            // Xử lý ngoại lệ và ghi log lỗi
            order.setAfterData("Error saving signature for order ID=" + order.getId() + ": " + e.getMessage());
            super.insert(order, LevelDAO.getInstance().getLevel(2).get(0), ip, address);
            return false;
        }
    }

    @Override
    public Map<Order, List<OrderItem>> insertOrders(Order order, List<OrderItem> orderItems, String ip, String address) {
        Map<Order, List<OrderItem>> re = new HashMap<>();
        try {
            Level level;
            Order success = OrderDAO.getInstance().insertOrders(order.getUser().getId(), order.getAddress().getId(), order.getType().getId(), order.getDiscount().getId(), order.getPayment().getId(), order.getNote(), order.getStatus().getId());
            if(success != null) {
                order.setAfterData("Add successfully with ID=" + success.getId());
                level = LevelDAO.getInstance().getLevel(1).get(0);
                for (OrderItem item : orderItems) {
                    OrderItemDAO.getInstance().addOrderItem(success.getId(), item.getProduct().getId(), item.getQuantity(), item.getOrderPrice());
                }
                re.put(success, OrderItemDAO.getInstance().getOrderItems(success.getId()));
            } else {
                order.setAfterData("Add failed. New order isn't created in database");
                level = LevelDAO.getInstance().getLevel(3).get(0);
            }
            super.insert(order, level, ip, address);
            return re;
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Map<Order, List<OrderItem>> loadLatestOrderByUser(User user) {
        try {
            return OrderDAO.getInstance().loadLatestOrderByUser(user.getId());
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public boolean updateOrderStatus(Order order, String ip, String address) {
        try {
            Level level;
            boolean success = OrderDAO.getInstance().updateOrderStatus(order.getId(), order.getStatus().getId());
            if(success) {
                order.setAfterData("Update order status success with orderID=" + order.getId() + " by userID=" + order.getUser().getId());
                level = LevelDAO.getInstance().getLevel(1).get(0);
            } else {
                order.setAfterData("Update order status failed with orderID=" + order.getId() + " by userID=" + order.getUser().getId());
                level = LevelDAO.getInstance().getLevel(2).get(0);
            }
            super.insert(order, level, ip, address);
            return success;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public boolean deleteOrder(Order order, String ip, String address) {
        try {
            Level level;
            boolean success = OrderDAO.getInstance().deleteOrder(order.getId());
            if(success) {
                success = OrderItemDAO.getInstance().deleteOrderItem(order.getId());
                if(success) {
                    order.setAfterData("Delete orders & order_items success with orderID=" + order.getId());
                    level = LevelDAO.getInstance().getLevel(1).get(0);
                } else {
                    order.setAfterData("Delete order_items failed with orderID=" + order.getId());
                    level = LevelDAO.getInstance().getLevel(3).get(0);
                }
            } else {
                order.setAfterData("Delete orders success with orderID=" + order.getId());
                level = LevelDAO.getInstance().getLevel(3).get(0);
            }
            super.insert(order, level, ip, address);
            return success;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public boolean updateTimePayment(Order order, String date, String ip, String address) {
        try {
            Level level;
            boolean success = OrderDAO.getInstance().updateTimePayment(order.getId(), date);
            if(success) {
                order.setAfterData("Update time payment success with orderID=" + order.getId());
                level = LevelDAO.getInstance().getLevel(1).get(0);
            } else {
                order.setAfterData("Update time payment failed with orderID=" + order.getId());
                level = LevelDAO.getInstance().getLevel(2).get(0);
            }
            super.insert(order, level, ip, address);
            return success;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public boolean updateOrdStatusByAdmin(Order order, String ip, String address) {
        try {
            Level level;
            boolean success = OrderDAO.getInstance().updateOrdStatusByAdmin(order.getId(), order.getUser().getId(), order.getStatus().getId());
            if(success) {
                order.setAfterData("Update order status success with orderID=" + order.getId() +" by admin: " + order.getUser().getId());
                level = LevelDAO.getInstance().getLevel(1).get(0);
            } else {
                order.setAfterData("Update order status failed with orderID=" + order.getId() +" by admin: " + order.getUser().getId());
                level = LevelDAO.getInstance().getLevel(2).get(0);
            }
            super.insert(order, level, ip, address);
            return success;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public boolean updatePayment(Order order, String ip, String address) {
        try {
            Level level;
            boolean success = OrderDAO.getInstance().updatePayment(order.getId(), order.getPayment().getId());
            if(success) {
                order.setAfterData("Update payment success with ID=" + order.getId());
                level = LevelDAO.getInstance().getLevel(1).get(0);
            } else {
                order.setAfterData("Update payment failed with ID=" + order.getId());
                level = LevelDAO.getInstance().getLevel(2).get(0);
            }
            super.insert(order, level, ip, address);
            return success;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public boolean updateDelivery(Order order, String ip, String address) {
        try {
            Level level;
            boolean success = OrderDAO.getInstance().updateDelivery(order.getId(), order.getAddress().getId());
            if(success) {
                order.setAfterData("Update delivery address success with ID=" + order.getId());
                level = LevelDAO.getInstance().getLevel(1).get(0);
            } else {
                order.setAfterData("Update delivery address failed with ID=" + order.getId());
                level = LevelDAO.getInstance().getLevel(2).get(0);
            }
            super.insert(order, level, ip, address);
            return success;
        } catch (Exception e) {
            return false;
        }
    }

}