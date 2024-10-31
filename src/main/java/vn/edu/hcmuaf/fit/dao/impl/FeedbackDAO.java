package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.IFeedbackDAO;
import vn.edu.hcmuaf.fit.model.Feedback;

import java.util.List;

public class FeedbackDAO extends AbsDAO<Feedback> implements IFeedbackDAO {
    private static IFeedbackDAO instance;

    public static IFeedbackDAO getInstance() {
        if (instance == null) {
            instance = new FeedbackDAO();
        }
        return instance;
    }

    /**
     * TESTED
     * Adds a new feedback to the database.
     */
    @Override
    public Feedback addFeedback(String email, String name, String content) {
        String sql = "INSERT INTO `feedbacks`(`email`, `name`, `content`) VALUES(?,?,?)";
        return insert(sql, Feedback.class, email, name, content);
    }

    /**
     * TESTED
     * Retrieves all feedbacks from the database.
     */
    @Override
    public List<Feedback> getAllFeedbacks() {
        String sql = "SELECT * FROM feedbacks";
        return query(sql, Feedback.class);
    }
}