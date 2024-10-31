package vn.edu.hcmuaf.fit.controller.user_page;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.controller.user_page.APIService.VnpayConfig;
import vn.edu.hcmuaf.fit.model.*;
import vn.edu.hcmuaf.fit.service.impl.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet("/user/vnpay")
public class VNPayServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        try {
            HttpSession session = request.getSession(true);

            String tinhText = request.getParameter("tinhText");
            String quanText = request.getParameter("quanText");
            String phuongText = request.getParameter("phuongText");
            String homeNumber = request.getParameter("txt_inv_addr1");

            String address = tinhText + ", " + quanText + ", " + phuongText+ "," + homeNumber;
            session.setAttribute("address", address);
            session.setAttribute("txt_inv_customer", request.getParameter("txt_inv_customer"));
            session.setAttribute("txt_billing_mobile", request.getParameter("txt_billing_mobile"));


            String vnp_Version = "2.1.0";
            String vnp_Command = "pay";
            String vnp_OrderInfo = request.getParameter("vnp_OrderInfo");
            String orderType = request.getParameter("ordertype");
            String vnp_TxnRef = VnpayConfig.getRandomNumber(8);
            String vnp_IpAddr = VnpayConfig.getIpAddress(request);
            String vnp_TmnCode = VnpayConfig.vnp_TmnCode;

            double result = Double.parseDouble(request.getParameter("amount"));

            long amount = (long) (result * 100);
            Map<String, String> vnp_Params = new HashMap<>();
            vnp_Params.put("vnp_Version", vnp_Version);
            vnp_Params.put("vnp_Command", vnp_Command);
            vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
            vnp_Params.put("vnp_Amount", String.valueOf(amount));
            vnp_Params.put("vnp_CurrCode", "VND");
            String bank_code = request.getParameter("bankcode");
            if (bank_code != null && !bank_code.isEmpty()) {
                vnp_Params.put("vnp_BankCode", bank_code);
            }
            vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
            vnp_Params.put("vnp_OrderInfo", vnp_OrderInfo);
            vnp_Params.put("vnp_OrderType", orderType);

            String locate = request.getParameter("language");
            if (locate != null && !locate.isEmpty()) {
                vnp_Params.put("vnp_Locale", locate);
            } else {
                vnp_Params.put("vnp_Locale", "vn");
            }
            vnp_Params.put("vnp_ReturnUrl", VnpayConfig.vnp_Returnurl);
            vnp_Params.put("vnp_IpAddr", vnp_IpAddr);
            Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));

            SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
            String vnp_CreateDate = formatter.format(cld.getTime());

            vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
            cld.add(Calendar.MINUTE, 15);
            String vnp_ExpireDate = formatter.format(cld.getTime());
            //Add Params of 2.1.0 Version
            vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);
            //Billing
            vnp_Params.put("vnp_Bill_Mobile", request.getParameter("txt_billing_mobile"));
            vnp_Params.put("vnp_Bill_Email", request.getParameter("txt_billing_email"));
            String fullName = request.getParameter("txt_billing_fullname").trim();
            if (!fullName.isEmpty()) {
                int idx = fullName.indexOf(' ');
                String firstName = fullName.substring(0, idx);
                String lastName = fullName.substring(fullName.lastIndexOf(' ') + 1);
                vnp_Params.put("vnp_Bill_FirstName", firstName);
                vnp_Params.put("vnp_Bill_LastName", lastName);
            }
            vnp_Params.put("vnp_Bill_Address", request.getParameter("txt_inv_addr1"));
            vnp_Params.put("vnp_Bill_City", request.getParameter("txt_bill_city"));
            vnp_Params.put("vnp_Bill_Country", request.getParameter("txt_bill_country"));
            if (request.getParameter("txt_bill_state") != null && !request.getParameter("txt_bill_state").isEmpty()) {
                vnp_Params.put("vnp_Bill_State", request.getParameter("txt_bill_state"));
            }
            // Invoice
            vnp_Params.put("vnp_Inv_Phone", request.getParameter("txt_inv_mobile"));
            vnp_Params.put("vnp_Inv_Email", request.getParameter("txt_inv_email"));
            vnp_Params.put("vnp_Inv_Customer", request.getParameter("txt_inv_customer"));
            vnp_Params.put("vnp_Inv_Address", request.getParameter("txt_inv_addr1"));
            vnp_Params.put("vnp_Inv_Company", request.getParameter("txt_inv_company"));
            vnp_Params.put("vnp_Inv_Taxcode", request.getParameter("txt_inv_taxcode"));
            vnp_Params.put("vnp_Inv_Type", request.getParameter("cbo_inv_type"));

            //Build data to hash and querystring
            List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
            Collections.sort(fieldNames);
            StringBuilder hashData = new StringBuilder();
            StringBuilder query = new StringBuilder();
            Iterator<String> itr = fieldNames.iterator();
            while (itr.hasNext()) {
                String fieldName = itr.next();
                String fieldValue = vnp_Params.get(fieldName);
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    //Build hash data
                    hashData.append(fieldName);
                    hashData.append('=');
                    hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                    //Build query
                    query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                    query.append('=');
                    query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                    if (itr.hasNext()) {
                        query.append('&');
                        hashData.append('&');
                    }
                }
            }

            // Database saving to localhost
            String ip = request.getHeader("X-FORWARDED-FOR");
            if (ip == null) ip = request.getRemoteAddr();
            String phone = request.getParameter("txt_inv_mobile");
            String atHome = request.getParameter("atHome")==null? "" : request.getParameter("atHome");
            System.out.println("vo day khong: " + atHome);
            int id = request.getParameter("id")==null||request.getParameter("id").isEmpty()? 0 : Integer.parseInt(request.getParameter("id"));
            int quantity = request.getParameter("quantity")==null||request.getParameter("quantity").isEmpty() ? 0 : Integer.parseInt(request.getParameter("quantity"));

            Discount discount = (Discount) session.getAttribute("discount");
            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
            User user = (User) session.getAttribute("auth");

            DeliveryAddress dev = new DeliveryAddress(user, fullName, phone, tinhText, quanText, phuongText, homeNumber, atHome.equals("on"), true);
            DeliveryAddress delivery = DeliveryService.getInstance().addDeliveryAddress(dev, ip, "/user/checkout");
            Order order = new Order();
            order.setUser(user);
            order.setAddress(delivery);

            ShippingType shippingType = new ShippingType();
            shippingType.setId(1);
            order.setType(shippingType);
            if(discount!=null) order.setDiscount(discount);
            else order.setDiscount(new Discount());

            Payment payment = new Payment();
            payment.setId(3);
            order.setPayment(PaymentService.getInstance().getPaymentById(payment));
            order.setNote("");

            OrderStatus status = new OrderStatus();
            status.setId(1);
            order.setStatus(status);

            List<OrderItem> items = new ArrayList<>();
            if (id != 0) {
                Product product = null;
                Map<Product, List<String>> products = ProductService.getInstance().getProductByIdWithSupplierInfo(new Product(id), ip, "/user/checkout");
                for (Product p: products.keySet()) {
                    product = p;
                }
                if(quantity != 0) items.add(new OrderItem(order, product,  quantity, product.getPrice()));
                else items.add(new OrderItem(order, product, 1, product.getPrice()));
            } else {
                for(CartItem i : cart) {
                    Map<Product, List<String>> products = ProductService.getInstance().getProductByIdWithSupplierInfo(i.getProduct(), ip, "/user/checkout");
                    for (Product p: products.keySet()) {
                        items.add(new OrderItem(order, p, i.getQuantity(), p.getPrice()));
                    }
                }
            }
            Map<Order, List<OrderItem>> map = OrderService.getInstance().insertOrders(order, items, ip, "/user/checkout");

            if (map==null || map.isEmpty()) {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.write("{\"code\":\"99\",\"message\":\"Error: insert into database failed!\"}");
                out.flush();
                out.close();
                return;
            } else {
                if (discount != null) {
                    DiscountService.getInstance().setQuantity(discount, ip, "/user/checkout");
                }
                for (OrderItem item : items) {
                    ProductService.getInstance().setQuantity(item.getProduct(), ip, "/user/checkout");
                }
                if (id == 0) {
                    cart.clear();
                    session.setAttribute("cart", cart);
                    CartService.getInstance().removeCart(user);
                    session.setAttribute("total", 0);
                }
                session.removeAttribute("discount");
                session.removeAttribute("retain");
                session.removeAttribute("result");
                session.setAttribute("orders", map);
            }
            String queryUrl = query.toString();
            String vnp_SecureHash = VnpayConfig.hmacSHA512(VnpayConfig.vnp_HashSecret, hashData.toString());
            queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
            String paymentUrl = VnpayConfig.vnp_PayUrl + "?" + queryUrl;
            JsonObject job = new JsonObject();
            job.addProperty("code", "00");
            job.addProperty("message", "success");
            job.addProperty("data", paymentUrl);
            Gson gson = new Gson();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            out.write(gson.toJson(job));
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.write("{\"code\":\"99\",\"message\":\"Error: " + e.getMessage() + "\"}");
        } finally {
            out.flush();
            out.close();
        }
    }
}