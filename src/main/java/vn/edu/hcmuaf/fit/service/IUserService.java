package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.model.Role;
import vn.edu.hcmuaf.fit.model.User;

import java.sql.Timestamp;
import java.util.List;

public interface IUserService {

    User chkUsrByNameOrEmail(String username, String email);

    User signIn(User user, String ip, String address);

    String signUp(User user, String rePassword, String ip, String address);

    String setVerified(User user, String code, String authCode, String ip, String address);

    boolean updatePassword(User user, String newPass, String ip, String address);

    boolean updateUserInfo(User user, String fullName, String birthday, String city, String district, String ward, String detail_address, String phone, String ip, String address);

    User addAdmin(User user, String ip, String address);

    List<User> loadUsersWithRole(Role role);

    User loadUsersWithId(User user, String ip, String address);

    Integer sumOfUsers();

    boolean updateUserInAdmin(User user, String ip, String address);

    boolean updateUserById(User user, String name, String phone, String email, String detail_address, String ip, String address);

    boolean deleteUserById(User user, String ip, String address);

    boolean updateLoginFail(User user, int times, String ip, String address);

    String resetLoginTimes(User user, String code, String authCode, String ip, String address);

    User loginByAPIS(User user, String ip, String address);

    boolean updateAvatar(User user, String ip, String address);
}