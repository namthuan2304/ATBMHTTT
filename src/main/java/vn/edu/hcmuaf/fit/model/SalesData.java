package vn.edu.hcmuaf.fit.model;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class SalesData {
    private String month;
    private double totalSales;
}
