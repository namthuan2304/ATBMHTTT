package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.model.Discount;

import java.util.List;

public interface IDiscountService {

    List<Discount> getAllCoupons();

    Discount getCouponById(Integer id);

    Discount getCouponByName(String name);

    Discount addCoupon(Discount coupon, String ip, String address);

    boolean delCoupon(Discount coupon, String ip, String address);

    boolean editCoupon(Discount coupon, String ip, String address);

    boolean editCouponByCode(Discount coupon, String ip, String address);

    boolean delCouponByCode(Discount coupon, String ip, String address);

    Discount getCouponByCode(String code);

    boolean setQuantity(Discount coupon, String ip, String address);

    Integer getQuantity(String code);

    Discount isOutOfUse(String code);

}