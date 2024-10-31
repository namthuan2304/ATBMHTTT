package vn.edu.hcmuaf.fit.dao.impl;

import org.mindrot.jbcrypt.BCrypt;
import vn.edu.hcmuaf.fit.dao.IUserDAO;
import vn.edu.hcmuaf.fit.model.Role;
import vn.edu.hcmuaf.fit.model.User;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

public class UserDAO extends AbsDAO<User> implements IUserDAO {
    private static IUserDAO instance;

    public static IUserDAO getInstance() {
        if (instance == null) {
            instance = new UserDAO();
        }
        return instance;
    }

    /**
     * TESTED
     * Signs up a new user in the database
     *
     */
    @Override
    public User signUp(String username, String email, String password, Integer role) {
        String sql = "INSERT INTO users(username, email, password, role_id) VALUES (?, ?, ?, ?)";
        return insert(sql, User.class, username, email, BCrypt.hashpw(password, BCrypt.gensalt()), role);
    }

    @Override
    public User loginByAPIS(String username, String email, String fullName, String avatar, Integer loginBy) {
        String sql = "INSERT INTO users(username, email, fullName, avatar, verified, login_by) VALUES (?, ?, ?, ?, ?, ?)";
        return insert(sql, User.class, username, email, fullName, avatar, 1, loginBy);
    }

    @Override
    public List<User> chkUsrWithOtherLogin(String username, String email, Integer loginBy) {
        String sql = "SELECT * FROM users WHERE (username = ? OR email = ?) AND login_by = ?";
        return query(sql, User.class, username, email, loginBy);
    }

    /**
     * TESTED
     * Updates the verified status of a user in the database.
     */
    @Override
    public boolean setVerified(String email) {
        String sql = "UPDATE users SET verified = 1 WHERE email = ? AND verified <> 1 AND login_by = 0";
        return update(sql, email);
    }

    @Override
    public boolean updateLoginFail(String email, Integer times) {
        String sql = "UPDATE users SET login_times =?, verified =? WHERE email =? AND login_by = 0";
        if (times < 5) return update(sql, times, 1, email);
        else return update(sql, 5, 0, email);
    }

    @Override
    public boolean resetLoginTimes(String email) {
        String sql = "UPDATE users SET login_times = 0 WHERE email =? AND login_by = 0";
        return update(sql, email);
    }

    @Override
    public boolean updateAvatar(Integer id, String avatar) {
        String sql = "UPDATE users SET avatar =? WHERE id =?";
        return update(sql, avatar, id);
    }

    /**
     * TESTED
     * Updates the user's information in the database.
     */
    @Override
    public boolean updateUserInfo(String fullName, String birthday, String city, String district, String ward, String detailAddress, String phone, Integer id) {
        String sql = "UPDATE users SET fullName = ?, dateOfBirth = ?, city = ?, district = ?, ward = ?, detail_address = ?, phone = ? WHERE id = ?";
        return update(sql, fullName, birthday, city, district, ward, detailAddress, phone, id);
    }

    /**
     * #TESTED
     * Checks if a user with the given username or email already exists in the database.
     */
    @Override
    public List<User> checkExistUser(String username, String email) {
        String sql = "SELECT * FROM users WHERE (username = ? OR email = ?) AND login_by = 0";
        return query(sql, User.class, username, email);
    }

    /**
     * TESTED
     * Updates the user's password in the database.
     */
    @Override
    public boolean updatePassword(String newPass, Integer id) {
        String sql = "UPDATE users SET password =? WHERE id =?";
        return update(sql, BCrypt.hashpw(newPass, BCrypt.gensalt()), id);
    }

    /**
     * TESTED
     * Adds a new admin user to the database.
     */
    @Override
    public User addAdmin(String username, String email, String password, String phone) {
        String sql = "INSERT INTO users(username, email, password, phone, verified, role_id) VALUES (?, ?, ?, ?, ?, ?)";
        return insert(sql, User.class, username, email, BCrypt.hashpw(password, BCrypt.gensalt()), phone, 1, 2);
    }

    /**
     * TESTED
     * Loads a list of users with the specified role id from the database.
     */
    @Override
    public List<User> loadUsersWithRole(Integer roleId) {
        String sql = "SELECT * FROM users WHERE role_id =?";
        return query(sql, User.class, roleId);
    }

    /**
     * TESTED
     * Loads a user with the given id from the database.
     */
    @Override
    public List<User> loadUsersWithId(Integer id) {
        String sql = "SELECT * FROM users WHERE id =?";
        return query(sql, User.class, id);
    }

    /**
     * TESTED
     * Counts the total number of users in the database.
     */
    @Override
    public Integer sumOfUsers() {
        String sql = "SELECT COUNT(*) FROM users";
        return count(sql);
    }



    /**
     * TESTED
     * Updates a user's information in the database for admin panel.
     */


    @Override
    public boolean updateUserInAdmin(Integer id, String username, String email, String fullName, Date dateOfBirth, String city, String district, String ward, String detail_address, String phone, String avatar, Boolean verified, Integer role_id, Timestamp date_Created) {
        String sql = "UPDATE users SET username = ?, email = ?, fullName = ?, dateOfBirth = ?, city = ?, district = ?, ward = ?, detail_address = ?, phone = ?, avatar = ?, verified = ?, role_id = ?, date_created = ? WHERE id = ?";
        int verifiedInt = (verified != null && verified) ? 1 : 0;
        return update(sql, username, email, fullName, dateOfBirth, city, district, ward, detail_address, phone, avatar, verifiedInt, role_id, date_Created, id);
    }



    /**
     * TESTED
     * Updates the user's information in the database.
     */
    @Override
    public boolean updateUserById(Integer id, String name, String phone, String email, String address) {
        String sql = "UPDATE users SET fullName = ?, phone = ?, email = ?, detail_address = ? WHERE id = ?";
        return update(sql, name, phone, email, address, id);
    }

    /**
     * TESTED
     * Deletes a user from the database by their id.
     */
    @Override
    public boolean deleteUserById(Integer userId) {
        String sql = "DELETE FROM users WHERE id =?";
        return update(sql, userId);
    }





}