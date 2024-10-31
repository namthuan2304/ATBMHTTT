package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.IPaymentDAO;
import vn.edu.hcmuaf.fit.model.Payment;

import java.util.List;

public class PaymentDAO extends AbsDAO<Payment> implements IPaymentDAO {
    private static IPaymentDAO instance;

    public static IPaymentDAO getInstance() {
        if (instance == null) {
            instance = new PaymentDAO();
        }
        return instance;
    }

    @Override
    public List<Payment> getAllPayments() {
        String sql = "SELECT * FROM payment";
        return query(sql, Payment.class);
    }

    @Override
    public List<Payment> getPaymentById(Integer id) {
        String sql = "SELECT * FROM payment WHERE id =?";
        return query(sql, Payment.class, id);
    }
}