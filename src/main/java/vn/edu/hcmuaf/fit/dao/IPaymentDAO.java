package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.Payment;

import java.util.List;

public interface IPaymentDAO extends GenericDAO<Payment> {

    List<Payment> getAllPayments();

    List<Payment> getPaymentById(Integer id);

}