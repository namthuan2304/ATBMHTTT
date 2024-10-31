package vn.edu.hcmuaf.fit.model;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class OrderStatusData {
    private String statusName;
    private int count;
}
