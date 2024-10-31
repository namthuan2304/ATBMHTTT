<%@ page import="vn.edu.hcmuaf.fit.model.Utils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@include file="/WEB-INF/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="vi-VN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>${title}</title>
    <link href="/assets/admin/img/icon/icon-logo.png" rel="shortcut icon">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/assets/admin/plugins/bootstrap/css/bootstrap.min.css">
    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="/assets/admin/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="/assets/admin/plugins/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="/assets/admin/css/font-awesome.min.css">
    <!-- Animate CSS -->
    <link rel="stylesheet" href="/assets/admin/css/animate.min.css">
    <!-- Main CSS -->
    <link rel="stylesheet" href="/assets/admin/css/admin.css">
    <style>
        .btn-custom {
            background-color: #7fad39;
            border-color: #7fad39;
            color: white;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }
        .btn-custom:hover {
            background-color: #7fad39;
            color: #757575;
        }
        .btn-group {
            margin: 10px 0;
        }
        .btn-group .btn {
            margin: 5px;
        }
    </style>

</head>

<body>
<div class="main-wrapper">
    <%@include file="/WEB-INF/admin/include/menu.jsp" %>

    <div class="page-wrapper">
        <div class="content container-fluid">

            <!-- Page Header -->
            <div class="page-header">
                <div class="row">
                    <div class="col-12">
                        <h3 class="page-title">Dashboard</h3>
                    </div>
                </div>
            </div>
            <!-- /Page Header -->
            <div class="row">
                <div class="col-xl-3 col-sm-6 col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="dash-widget-header">
									<span class="dash-widget-icon bg-primary">
										<i class="far fa-user"></i>
									</span>
                                <div class="dash-widget-info">
                                    <h3>${c_user}</h3>
                                    <h6 class="text-muted">Người dùng</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="dash-widget-header">
									<span class="dash-widget-icon bg-primary">
										<i class="fas fa-qrcode"></i>
									</span>
                                <div class="dash-widget-info">
                                    <h3>${c_product}</h3>
                                    <h6 class="text-muted">Sản phẩm</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="dash-widget-header">
									<span class="dash-widget-icon bg-primary">
										<i class="fas fa-user-shield"></i>
									</span>
                                <div class="dash-widget-info">
                                    <h3>${c_supplier}</h3>
                                    <h6 class="text-muted">Nhà cung cấp</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mb-4">
                <div class="col-md-12 text-left">
                    <div class="btn-group" role="group" aria-label="Dashboard Buttons">
                        <button class="btn btn-custom mr-1" onclick="drawMonthlySalesChart()">Doanh thu theo tháng</button>
                        <button class="btn btn-custom mr-1" onclick="drawOrderStatusCountsChart()">Số Lượng Đơn Hàng</button>
                        <button class="btn btn-custom mr-1" onclick="drawTopSellingProductsChart()">Sản Phẩm Bán Chạy</button>
                        <button class="btn btn-custom mr-1" onclick="drawCategoryRevenuesChart()">Doanh Thu Theo Danh Mục</button>
                        <button class="btn btn-custom mr-1" onclick="drawNewUserRegistrationsChart()">Đăng Ký Người Dùng Mới</button>
                        <button class="btn btn-custom mr-1" onclick="drawPaymentMethodRevenuesChart()">Doanh Thu Theo Phương Thức Thanh Toán</button>
                        <button class="btn btn-custom mr-1" onclick="drawStockOverviewChart()">Tồn kho</button>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div id="chart-container" style="width: 100%; height: 500px;"></div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<!-- jQuery -->
<script src="/assets/admin/js/jquery-3.5.0.min.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>

<script>
    google.charts.load('current', {packages: ['corechart', 'bar']});
    google.charts.setOnLoadCallback(drawCharts);

    function drawCharts() {
        drawMonthlySalesChart();
    }

    function drawMonthlySalesChart() {
        const data = new google.visualization.DataTable();
        data.addColumn('string', 'Tháng');
        data.addColumn('number', 'Doanh thu');

        const salesData = JSON.parse('${monthlySalesData}');
        console.log(salesData);
        salesData.forEach(item => {
            data.addRow([item.month, item.totalSales]);
        });

        const options = {
            title: 'Doanh thu hàng tháng',
            hAxis: {title: 'Tháng'},
            vAxis: {title: 'Doanh thu'}
        };

        const chart = new google.visualization.ColumnChart(document.getElementById('chart-container'));
        chart.draw(data, options);
    }

    function drawOrderStatusCountsChart() {
        const data = new google.visualization.DataTable();
        data.addColumn('string', 'Trạng Thái');
        data.addColumn('number', 'Số Lượng');

        const statusData = JSON.parse('${orderStatusCountsData}');
        statusData.forEach(item => {
            data.addRow([item.statusName, item.count]);
        });

        const options = {
            title: 'Số Lượng Theo Trạng Thái Đơn Hàng',
            pieHole: 0.4
        };

        const chart = new google.visualization.PieChart(document.getElementById('chart-container'));
        chart.draw(data, options);
    }

    function drawTopSellingProductsChart() {
        const data = new google.visualization.DataTable();
        data.addColumn('string', 'Sản Phẩm');
        data.addColumn('number', 'Doanh Thu');

        const productsData = JSON.parse('${topSellingProductsData}');
        productsData.forEach(item => {
            data.addRow([item.productName, item.totalSold]);
        });

        const options = {
            title: 'Các Sản Phẩm Bán Chạy Nhất',
            hAxis: {title: 'Sản Phẩm'},
            vAxis: {title: 'Doanh Thu'}
        };

        const chart = new google.visualization.BarChart(document.getElementById('chart-container'));
        chart.draw(data, options);
    }

    function drawCategoryRevenuesChart() {
        const data = new google.visualization.DataTable();
        data.addColumn('string', 'Danh Mục');
        data.addColumn('number', 'Doanh Thu');

        const categoryData = JSON.parse('${categoryRevenuesData}');
        categoryData.forEach(item => {
            data.addRow([item.categoryName, item.totalRevenue]);
        });

        const options = {
            title: 'Doanh Thu Theo Danh Mục',
            hAxis: {title: 'Danh Mục'},
            vAxis: {title: 'Doanh Thu'}
        };

        const chart = new google.visualization.BarChart(document.getElementById('chart-container'));
        chart.draw(data, options);
    }

    function drawNewUserRegistrationsChart() {
        const data = new google.visualization.DataTable();
        data.addColumn('string', 'Ngày');
        data.addColumn('number', 'Đăng Ký');

        const userData = JSON.parse('${newUserRegistrationsData}');
        userData.forEach(item => {
            data.addRow([item.month, item.newUsers]);
        });

        const options = {
            title: 'Số Lượng Đăng Ký Người Dùng Mới',
            hAxis: {title: 'Ngày'},
            vAxis: {title: 'Số Lượng Đăng Ký'}
        };

        const chart = new google.visualization.LineChart(document.getElementById('chart-container'));
        chart.draw(data, options);
    }

    function drawPaymentMethodRevenuesChart() {
        const data = new google.visualization.DataTable();
        data.addColumn('string', 'Phương Thức Thanh Toán');
        data.addColumn('number', 'Doanh Thu');

        const paymentData = JSON.parse('${paymentMethodRevenuesData}');
        paymentData.forEach(item => {
            data.addRow([item.paymentMethod, item.totalRevenue]);
        });

        const options = {
            title: 'Doanh Thu Theo Phương Thức Thanh Toán',
            pieHole: 0.4
        };

        const chart = new google.visualization.PieChart(document.getElementById('chart-container'));
        chart.draw(data, options);
    }

    function drawStockOverviewChart() {
        const data = new google.visualization.DataTable();
        data.addColumn('string', 'Sản Phẩm');
        data.addColumn('number', 'Kho');

        const stockData = JSON.parse('${stockOverviewData}');
        stockData.forEach(item => {
            data.addRow([item.productName, item.stockQuantity]);
        });

        const options = {
            title: 'Stock Overview',
            hAxis: {title: 'Sản Phẩm'},
            vAxis: {title: 'Số Lượng Kho'}
        };

        const chart = new google.visualization.BarChart(document.getElementById('chart-container'));
        chart.draw(data, options);
    }
</script>

<!-- Bootstrap Core JS -->
<script src="/assets/admin/js/popper.min.js"></script>
<script src="/assets/admin/plugins/bootstrap/js/bootstrap.min.js"></script>

<!-- Custom JS -->
<script src="/assets/admin/js/admin.js"></script>

</body>

</html>