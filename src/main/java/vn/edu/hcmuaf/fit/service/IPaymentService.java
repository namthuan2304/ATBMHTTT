package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.model.Payment;

import java.util.List;

public interface IPaymentService {

    List<Payment> getAllPayments();

    Payment getPaymentById(Payment payment);
}
