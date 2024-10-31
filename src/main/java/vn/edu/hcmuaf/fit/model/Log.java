package vn.edu.hcmuaf.fit.model;

import lombok.*;
import lombok.experimental.FieldDefaults;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;
import java.sql.Timestamp;

@Table(name = "log")
@Data
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Log implements Serializable {
     Integer id;
     @Nested("level")
     Level level;
     String ip;
     String address;
     String preValue;
     String postValue;
     Timestamp createdAt;

    @Nested("level")
    public Level getLevel() {
        return level;
    }

    @Nested("level")
    public void setLevel(Level level) {
        this.level = level;
    }
}