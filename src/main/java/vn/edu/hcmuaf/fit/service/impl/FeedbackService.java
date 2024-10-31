package vn.edu.hcmuaf.fit.service.impl;

import vn.edu.hcmuaf.fit.dao.impl.FeedbackDAO;
import vn.edu.hcmuaf.fit.dao.impl.LevelDAO;
import vn.edu.hcmuaf.fit.dao.impl.LogDAO;
import vn.edu.hcmuaf.fit.dao.impl.SupplierDAO;
import vn.edu.hcmuaf.fit.model.Feedback;
import vn.edu.hcmuaf.fit.model.Level;
import vn.edu.hcmuaf.fit.model.Supplier;
import vn.edu.hcmuaf.fit.service.IFeedbackService;

import java.util.List;

public class FeedbackService extends LogDAO<Feedback>  implements IFeedbackService {
    private static IFeedbackService instance;

    public static IFeedbackService getInstance() {
        if (instance == null) {
            instance = new FeedbackService();
        }
        return instance;
    }

    @Override
    public Feedback addFeedback(Feedback feedback, String ip, String address) {
        try {
            Level level;
            Feedback success = FeedbackDAO.getInstance().addFeedback(feedback.getEmail(), feedback.getName(), feedback.getContent());
            if(success != null) {
                feedback.setAfterData("Add feedback success ID=" + success.getId());
                level = LevelDAO.getInstance().getLevel(1).get(0);
            } else {
                feedback.setAfterData("Add failed. New feedbacks isn't created!");
                level = LevelDAO.getInstance().getLevel(2).get(0);
            }
            super.insert(feedback, level, ip, address);
            return success;
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<Feedback> getAllFeedbacks() {
        return FeedbackDAO.getInstance().getAllFeedbacks();
    }
}