package vn.edu.hcmuaf.fit.model;

import lombok.*;
import lombok.experimental.FieldDefaults;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;

@Table(name = "product_categories")
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ProductCategories extends AbsModel implements Serializable {
     Integer id;
     String categoryName;
     @Nested("group")
     ProductGroups group;
     Boolean active;

    @Nested("group")
    public ProductGroups getGroup() {
        return group;
    }

    @Nested("group")
    public void setGroup(ProductGroups group) {
        this.group = group;
    }

    public ProductCategories(Integer id) {
        this.id = id;
    }
}