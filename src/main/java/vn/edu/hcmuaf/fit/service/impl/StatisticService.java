package vn.edu.hcmuaf.fit.service.impl;

import vn.edu.hcmuaf.fit.dao.impl.StatisticDAO;
import vn.edu.hcmuaf.fit.model.*;
import vn.edu.hcmuaf.fit.service.IProductService;
import vn.edu.hcmuaf.fit.service.IStatisticService;

import java.util.List;

public class StatisticService implements IStatisticService {
    private static IStatisticService instance;

    public static IStatisticService getInstance() {
        if (instance == null) instance = new StatisticService();
        return instance;
    }

    @Override
    public List<SalesData> getMonthlySales() {
        return StatisticDAO.getInstance().getMonthlySales();
    }

    @Override
    public List<OrderStatusData> getOrderStatusCounts() {
        return StatisticDAO.getInstance().getOrderStatusCounts();
    }

    @Override
    public List<ProductSalesData> getTopSellingProducts() {
        return StatisticDAO.getInstance().getTopSellingProducts();
    }

    @Override
    public List<CategoryRevenueData> getCategoryRevenues() {
        return StatisticDAO.getInstance().getCategoryRevenues();
    }

    @Override
    public List<NewUserData> getNewUserRegistrations() {
        return StatisticDAO.getInstance().getNewUserRegistrations();
    }

    @Override
    public List<PaymentRevenueData> getPaymentMethodRevenues() {
        return StatisticDAO.getInstance().getPaymentMethodRevenues();
    }

    @Override
    public List<StockData> getStockOverview() {
        return StatisticDAO.getInstance().getStockOverview();
    }
}
