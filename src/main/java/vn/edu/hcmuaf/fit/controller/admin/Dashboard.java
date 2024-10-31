package vn.edu.hcmuaf.fit.controller.admin;

import com.google.gson.Gson;
import vn.edu.hcmuaf.fit.dao.IStatisticDAO;
import vn.edu.hcmuaf.fit.dao.impl.StatisticDAO;
import vn.edu.hcmuaf.fit.model.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.service.impl.ProductService;
import vn.edu.hcmuaf.fit.service.impl.SupplierService;
import vn.edu.hcmuaf.fit.service.impl.UserService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(urlPatterns = "/admin/dashboard")
public class Dashboard extends HttpServlet {
    private IStatisticDAO statisticDAO;

    @Override
    public void init() throws ServletException {
        statisticDAO = new StatisticDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer c_user = UserService.getInstance().sumOfUsers();
        Integer c_product = ProductService.getInstance().getTotalProducts();
        Integer c_supplier = SupplierService.getInstance().getSuppliers().size();

        request.setAttribute("c_user", c_user);
        request.setAttribute("c_product", c_product);
        request.setAttribute("c_supplier", c_supplier);
        request.setAttribute("monthlySalesData", getMonthlySalesData());
        request.setAttribute("orderStatusCountsData", getOrderStatusCountsData());
        request.setAttribute("topSellingProductsData", getTopSellingProductsData());
        request.setAttribute("categoryRevenuesData", getCategoryRevenuesData());
        request.setAttribute("newUserRegistrationsData", getNewUserRegistrationsData());
        request.setAttribute("paymentMethodRevenuesData", getPaymentMethodRevenuesData());
        request.setAttribute("stockOverviewData", getStockOverviewData());

        // Forward the request to the JSP page
        request.getRequestDispatcher("/WEB-INF/admin/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");

        if ("getMonthlySales".equals(action)) {
            out.print(getMonthlySalesData());
        } else if ("getOrderStatusCounts".equals(action)) {
            out.print(getOrderStatusCountsData());
        } else if ("getTopSellingProducts".equals(action)) {
            out.print(getTopSellingProductsData());
        } else if ("getCategoryRevenues".equals(action)) {
            out.print(getCategoryRevenuesData());
        } else if ("getNewUserRegistrations".equals(action)) {
            out.print(getNewUserRegistrationsData());
        } else if ("getPaymentMethodRevenues".equals(action)) {
            out.print(getPaymentMethodRevenuesData());
        } else if ("getStockOverview".equals(action)) {
            out.print(getStockOverviewData());
        } else {
            out.print("{\"error\":\"Unknown action\"}");
        }
        out.flush();
    }


    private String getMonthlySalesData() {
        List<SalesData> salesDataList = statisticDAO.getMonthlySales();
        return new Gson().toJson(salesDataList);
    }

    private String getOrderStatusCountsData() {
        List<OrderStatusData> statusCountList = statisticDAO.getOrderStatusCounts();
        return new Gson().toJson(statusCountList);
    }

    private String getTopSellingProductsData() {
        List<ProductSalesData> productSalesList = statisticDAO.getTopSellingProducts();
        return new Gson().toJson(productSalesList);
    }

    private String getCategoryRevenuesData() {
        List<CategoryRevenueData> categoryRevenueList = statisticDAO.getCategoryRevenues();
        return new Gson().toJson(categoryRevenueList);
    }

    private String getNewUserRegistrationsData() {
        List<NewUserData> newUserList = statisticDAO.getNewUserRegistrations();
        return new Gson().toJson(newUserList);
    }

    private String getPaymentMethodRevenuesData() {
        List<PaymentRevenueData> paymentMethodRevenueList = statisticDAO.getPaymentMethodRevenues();
        return new Gson().toJson(paymentMethodRevenueList);
    }

    private String getStockOverviewData() {
        List<StockData> stockDataList = statisticDAO.getStockOverview();
        return new Gson().toJson(stockDataList);
    }
}