package vn.edu.hcmuaf.fit.model;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class StockData {
    private String productName;
    private int stockQuantity;
}
