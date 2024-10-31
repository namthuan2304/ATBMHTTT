package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.User;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

public interface IUserDAO extends GenericDAO<User> {

    User signUp(String username, String email, String password, Integer role);

    User loginByAPIS(String username, String email, String fullName, String avatar, Integer loginBy);

    List<User> chkUsrWithOtherLogin(String username, String email, Integer loginBy);

    List<User> checkExistUser(String username, String email);

    boolean setVerified(String email);

    boolean updateLoginFail(String email, Integer times);

    boolean updateUserInfo(String fullName, String birthday, String city, String district, String ward, String detailAddress, String phone, Integer id);

    boolean updatePassword(String newPass, Integer id);

    User addAdmin(String username, String email, String password, String phone);

    List<User> loadUsersWithRole(Integer roleId);

    List<User> loadUsersWithId(Integer id);

    Integer sumOfUsers();

    boolean updateUserInAdmin(Integer id, String  username, String email, String fullName, Date dateOfBirth,String city, String district, String ward,  String detail_address, String phone, String avatar, Boolean verified, Integer role_id , Timestamp dateCreated);

    boolean updateUserById(Integer id, String name, String phone, String email, String address);

    boolean deleteUserById(Integer userId);

    boolean resetLoginTimes(String email);

    boolean updateAvatar(Integer id, String avatar);
}