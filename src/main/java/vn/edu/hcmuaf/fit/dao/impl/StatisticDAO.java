package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.IOrderDAO;
import vn.edu.hcmuaf.fit.dao.IStatisticDAO;
import vn.edu.hcmuaf.fit.model.*;

import java.util.List;

public class StatisticDAO extends AbsDAO<String> implements IStatisticDAO {
    private static IStatisticDAO instance;

    public static IStatisticDAO getInstance() {
        if (instance == null) {
            instance = new StatisticDAO();
        }
        return instance;
    }
    @Override
    public List<SalesData> getMonthlySales() {
        String sql = "SELECT \n" +
                "    DATE_FORMAT(date_created, '%Y-%m') AS month, \n" +
                "    SUM(order_items.quantity * order_items.order_price) AS total_sales \n" +
                "FROM \n" +
                "    orders \n" +
                "JOIN \n" +
                "    order_items ON orders.id = order_items.order_id \n" +
                "GROUP BY \n" +
                "    month \n" +
                "ORDER BY \n" +
                "    month;";
        return query(sql, SalesData.class);
    }

    @Override
    public List<OrderStatusData> getOrderStatusCounts() {
        String sql = "SELECT \n" +
                "    order_status.status_name, \n" +
                "    COUNT(*) AS count \n" +
                "FROM \n" +
                "    orders \n" +
                "JOIN \n" +
                "    order_status ON orders.status_id = order_status.id \n" +
                "GROUP BY \n" +
                "    order_status.status_name;";
        return query(sql, OrderStatusData.class);
    }

    @Override
    public List<ProductSalesData> getTopSellingProducts() {
        String sql = "SELECT \n" +
                "    products.productName, \n" +
                "    SUM(order_items.quantity) AS total_sold \n" +
                "FROM \n" +
                "    order_items \n" +
                "JOIN \n" +
                "    products ON order_items.product_id = products.id \n" +
                "GROUP BY \n" +
                "    products.productName \n" +
                "ORDER BY \n" +
                "    total_sold DESC \n" +
                "LIMIT 10;";
        return query(sql, ProductSalesData.class);
    }

    @Override
    public List<CategoryRevenueData> getCategoryRevenues() {
        String sql = "SELECT \n" +
                "    product_categories.categoryName, \n" +
                "    SUM(order_items.quantity * order_items.order_price) AS total_revenue \n" +
                "FROM \n" +
                "    order_items \n" +
                "JOIN \n" +
                "    products ON order_items.product_id = products.id \n" +
                "JOIN \n" +
                "    product_categories ON products.cate_id = product_categories.id \n" +
                "GROUP BY \n" +
                "    product_categories.categoryName;";
        return query(sql, CategoryRevenueData.class);
    }

    @Override
    public List<NewUserData> getNewUserRegistrations() {
        String sql = "SELECT \n" +
                "    DATE_FORMAT(date_created, '%Y-%m') AS month, \n" +
                "    COUNT(*) AS new_users \n" +
                "FROM \n" +
                "    users \n" +
                "GROUP BY \n" +
                "    month \n" +
                "ORDER BY \n" +
                "    month;";
        return query(sql, NewUserData.class);
    }

    @Override
    public List<PaymentRevenueData> getPaymentMethodRevenues() {
        String sql = "SELECT \n" +
                "    payment.name AS payment_method, \n" +
                "    SUM(order_items.quantity * order_items.order_price) AS total_revenue \n" +
                "FROM \n" +
                "    orders \n" +
                "JOIN \n" +
                "    order_items ON orders.id = order_items.order_id \n" +
                "JOIN \n" +
                "    payment ON orders.payment_id = payment.id \n" +
                "GROUP BY \n" +
                "    payment_method;";
        return query(sql, PaymentRevenueData.class);
    }

    @Override
    public List<StockData> getStockOverview() {
        String sql = "SELECT \n" +
                "    products.productName, \n" +
                "    products.quantity AS stock_quantity \n" +
                "FROM \n" +
                "    products \n" +
                "ORDER BY \n" +
                "    stock_quantity ASC \n" +
                "LIMIT 10;";
        return query(sql, StockData.class);
    }
}
