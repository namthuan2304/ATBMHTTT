package vn.edu.hcmuaf.fit.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

public class RSHandler {

    public static String getString(ResultSet rs, String column) {
        try {
            return rs.getString(column);
        } catch (SQLException e) {
            throw new RuntimeException("Failed to get String from ResultSet", e);
        }
    }

    public static int getInt(ResultSet rs, String column) {
        try {
            return rs.getInt(column);
        } catch (SQLException e) {
            throw new RuntimeException("Failed to get Integer from ResultSet", e);
        }
    }
}