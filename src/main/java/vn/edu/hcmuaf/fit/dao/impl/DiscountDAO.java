package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.IDiscountDAO;
import vn.edu.hcmuaf.fit.model.Discount;

import java.sql.Timestamp;
import java.util.List;

public class DiscountDAO extends AbsDAO<Discount> implements IDiscountDAO {
    private static IDiscountDAO instance;

    public static IDiscountDAO getInstance() {
        if (instance == null) {
            instance = new DiscountDAO();
        }
        return instance;
    }
    /**
     * TESTED
     * Retrieves all the coupons from the database.
     */
    @Override
    public List<Discount> getAllCoupons() {
        String sql = "SELECT * FROM discounts";
        return query(sql, Discount.class);
    }

    /**
     * TESTED
     * Retrieves a coupon from the database by its id.
     */
    @Override
    public List<Discount> getCouponById(Integer id) {
        String sql = "SELECT * FROM discounts WHERE id =?";
        return query(sql, Discount.class, id);
    }

    /**
     * TESTED
     * Retrieves a coupon from the database by its name.
     */
    @Override
    public List<Discount> getCouponByName(String name) {
        String sql = "SELECT * FROM discounts WHERE discountName =?";
        return query(sql, Discount.class, name);
    }

    @Override
    public List<Discount> getCouponByCode(String code) {
        String sql = "SELECT * FROM discounts WHERE code =?";
        return query(sql, Discount.class, code);
    }

    public static void main(String[] args) {
        System.out.println(DiscountDAO.getInstance().getCouponByCode("HEELO"));
    }

    /**
     * TESTED
     * Adds a new coupon to the database.
     */
    @Override
    public Discount addCoupon(String name, String code, String des, Double percent, Integer quantity, Timestamp startTimestamp, Timestamp TimestampEnd) {
        String sql = "INSERT INTO `discounts`(`code`, `discountName`, `description`, `sale_percent`, `quantity`, `startTimestamp`, `expirationTimestamp`) VALUES(?,?,?,?,?,?,?)";
        return insert(sql, Discount.class, code, name, des, percent, quantity, startTimestamp, TimestampEnd);
    }

    /**
     * TESTED
     * Deletes a coupon from the database by its id.
     */
    @Override
    public boolean delCoupon(Integer id) {
        String sql = "DELETE FROM discounts WHERE id=?";
        return update(sql, id);
    }

    @Override
    public boolean delCouponByCode(String code) {
        String sql = "DELETE FROM discounts WHERE id=?";
        return update(sql, code);
    }

    /**
     * TESTED
     * Edits a coupon in the database by its id.
     */
    @Override
    public boolean editCoupon(Integer id, String code, String name, String des, Double percent, Integer quantity, Timestamp startTimestamp, Timestamp TimestampEnd) {
        String sql = "UPTimestamp `discounts` SET `code`=?, `discountName`=?, `description`=?, `sale_percent`=?, `quantity`=?, `startTimestamp`=?, `expirationTimestamp`=? WHERE id =?";
        return update(sql, code, name, des, percent, quantity, startTimestamp, TimestampEnd, id);
    }

    @Override
    public boolean editCouponByCode(String code, String name, String des, Double percent, Integer quantity, Timestamp startTimestamp, Timestamp TimestampEnd) {
        String sql = "UPTimestamp `discounts` SET `discountName`=?, `description`=?, `sale_percent`=?, `quantity`=?, `startTimestamp`=?, `expirationTimestamp`=? WHERE code=?";
        return update(sql, name, des, percent, quantity, startTimestamp, TimestampEnd, code);
    }

    @Override
    public boolean setQuantity(String code) {
        String sql = "UPDATE discounts SET quantity = quantity - 1 WHERE code =? AND quantity > ?";
        return update(sql, code, 0);
    }

    @Override
    public Integer getQuantity(String code) {
        String sql = "SELECT quantity FROM discounts WHERE code = ?";
        return count(sql, code);
    }

    @Override
    public List<Discount> isOutOfUse(String code) {
        String sql = "SELECT * FROM discounts WHERE code = ? AND quantity = ?";
        return query(sql, Discount.class, code, 0);
    }
}