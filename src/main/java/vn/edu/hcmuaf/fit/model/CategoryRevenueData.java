package vn.edu.hcmuaf.fit.model;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class CategoryRevenueData {
    private String categoryName;
    private double totalRevenue;
}
