package vn.edu.hcmuaf.fit.service.impl;

import vn.edu.hcmuaf.fit.dao.impl.PaymentDAO;
import vn.edu.hcmuaf.fit.model.Payment;
import vn.edu.hcmuaf.fit.service.IPaymentService;

import java.util.List;

public class PaymentService implements IPaymentService {
    private static IPaymentService instance;

    public static IPaymentService getInstance() {
        if (instance == null) {
            instance = new PaymentService();
        }
        return instance;
    }

    @Override
    public List<Payment> getAllPayments() {
        try {
            return PaymentDAO.getInstance().getAllPayments();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Payment getPaymentById(Payment payment) {
        try {
            return PaymentDAO.getInstance().getPaymentById(payment.getId()).get(0);
        } catch (Exception e) {
            return null;
        }
    }
}