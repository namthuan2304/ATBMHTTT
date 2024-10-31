package vn.edu.hcmuaf.fit.model;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.io.Serializable;

@Table(name = "social_media")
@Data
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class SocialMedia implements Serializable {
     Integer id;
     String facebook;
     String instagram;
     String twitter;
     String pinterest;
     String youtube;
     String linkedin;

}