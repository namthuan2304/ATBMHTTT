package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.ICommentDAO;
import vn.edu.hcmuaf.fit.model.Comment;

import java.util.List;

public class CommentDAO extends AbsDAO<Comment> implements ICommentDAO {
    private static ICommentDAO instance;

    public static ICommentDAO getInstance() {
        if (instance == null) {
            instance = new CommentDAO();
        }
        return instance;
    }

    @Override
    public Comment addComment(Integer proId, Integer userId, String content) {
        String sql = "INSERT INTO comment (product_id, user_id, content) VALUES (?, ?, ?)";
        return insert(sql, Comment.class, proId, userId, content);
    }

    @Override
    public List<Comment> getAllComments() {
        String sql = "SELECT * FROM comment";
        return query(sql, Comment.class);
    }

    @Override
    public List<Comment> getCommentsByProduct(Integer id) {
        String sql = "SELECT * FROM comment WHERE product_id = ?";
        return query(sql, Comment.class, id);
    }
}