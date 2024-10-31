package vn.edu.hcmuaf.fit.model;

import lombok.*;
import lombok.experimental.FieldDefaults;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;

@Table(name = "products")
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Product extends AbsModel implements Serializable {
     Integer id;
     String productName;
     Double salePercent;
     Integer price;
     Integer quantity;
     String purpose;
     String contraindications;
     String ingredients;
     String dosage;
     String instructions;
     String warrantyPeriod;
     String storageCondition;
     @Nested("cate")
     ProductCategories cate;
     @Nested("type")
     ProductTypes type;
     @Nested("supplier")
     Supplier supplier;
     Boolean active;

    public Product(Integer id) {
        this.id = id;
    }

    @Nested("cate")
    public ProductCategories getCate() {
        return cate;
    }

    @Nested("cate")
    public void setCate(ProductCategories cate) {
        this.cate = cate;
    }

    @Nested("type")
    public ProductTypes getType() {
        return type;
    }

    @Nested("type")
    public void setType(ProductTypes type) {
        this.type = type;
    }

    @Nested("supplier")
    public Supplier getSupplier() {
        return supplier;
    }

    @Nested("supplier")
    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }
}