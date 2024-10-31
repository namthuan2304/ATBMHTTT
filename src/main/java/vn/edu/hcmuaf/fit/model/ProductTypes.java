package vn.edu.hcmuaf.fit.model;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.io.Serializable;

@Table(name = "product_types")
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ProductTypes extends AbsModel implements Serializable {
     Integer id;
     String typeName;
     Boolean active;

     public ProductTypes(Integer id) {
          this.id = id;
     }
}