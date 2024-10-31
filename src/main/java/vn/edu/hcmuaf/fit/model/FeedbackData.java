package vn.edu.hcmuaf.fit.model;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class FeedbackData {
    private String month;
    private int feedbackCount;
}
