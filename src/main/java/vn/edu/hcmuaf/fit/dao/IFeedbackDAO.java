package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.Feedback;

import java.util.List;

public interface IFeedbackDAO extends GenericDAO<Feedback>{

    Feedback addFeedback(String email, String name, String content);

    List<Feedback> getAllFeedbacks();
}
