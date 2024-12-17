package vn.edu.hcmuaf.fit.model;

import lombok.*;
import lombok.experimental.FieldDefaults;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

@Table(name = "users")
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class User extends AbsModel implements Serializable {

    Integer id;
    String username;
    String email;
    String password;
    String fullName;
    Date dateOfBirth;
    String city;
    String district;
    String ward;
    String detail_address;
    String phone;
    String avatar;
    Boolean verified;
    Integer loginBy;
    Integer loginTimes;

    // Thêm trường publicKey để lưu trữ khóa công khai
    String publicKey; // Thêm thuộc tính publicKey

    // Thêm trường để lưu ngày tạo khóa và ngày hết hạn khóa
    Timestamp keyCreatedDate;  // Ngày tạo khóa
    Timestamp keyEndDate;    // Ngày hết hạn khóa

    @Nested("role")
    Role role;

    Timestamp dateCreated;

    @Nested("role")
    public Role getRole() {
        return role;
    }

    @Nested("role")
    public void setRole(Role role) {
        this.role = role;
    }

}
