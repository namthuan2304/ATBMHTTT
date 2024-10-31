package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.*;

import java.util.List;

public interface IStatisticDAO  extends GenericDAO<String>{
    List<SalesData> getMonthlySales();
    List<OrderStatusData> getOrderStatusCounts();
    List<ProductSalesData> getTopSellingProducts();
    List<CategoryRevenueData> getCategoryRevenues();
    List<NewUserData> getNewUserRegistrations();
    List<PaymentRevenueData> getPaymentMethodRevenues();
    List<StockData> getStockOverview();
}
