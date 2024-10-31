package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.Discount;

import java.sql.Timestamp;
import java.util.List;

public interface IDiscountDAO extends GenericDAO<Discount> {

    List<Discount> getAllCoupons();

    List<Discount> getCouponById(Integer id);

    List<Discount> getCouponByName(String name);

    List<Discount> getCouponByCode(String code);

    Discount addCoupon(String name, String code, String des, Double percent, Integer quantity, Timestamp startTimestamp, Timestamp TimestampEnd);

    boolean delCoupon(Integer id);

    boolean delCouponByCode(String code);

    boolean editCoupon(Integer id, String code, String name, String des, Double percent, Integer quantity, Timestamp startTimestamp, Timestamp TimestampEnd);

    boolean editCouponByCode(String code, String name, String des, Double percent, Integer quantity, Timestamp startTimestamp, Timestamp TimestampEnd);

    boolean setQuantity(String code);

    Integer getQuantity(String code);

    List<Discount> isOutOfUse(String code);

}