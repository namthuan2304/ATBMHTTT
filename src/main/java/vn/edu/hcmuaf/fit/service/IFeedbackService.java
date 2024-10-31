package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.model.Feedback;

import java.util.List;

public interface IFeedbackService {

    Feedback addFeedback(Feedback feedback, String ip, String address);

    List<Feedback> getAllFeedbacks();
}
