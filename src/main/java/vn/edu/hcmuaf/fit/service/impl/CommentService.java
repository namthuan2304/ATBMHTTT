package vn.edu.hcmuaf.fit.service.impl;

import vn.edu.hcmuaf.fit.dao.impl.CommentDAO;
import vn.edu.hcmuaf.fit.dao.impl.LevelDAO;
import vn.edu.hcmuaf.fit.dao.impl.LogDAO;
import vn.edu.hcmuaf.fit.model.Comment;
import vn.edu.hcmuaf.fit.model.Level;
import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.service.ICommentService;

import java.util.List;

public class CommentService extends LogDAO<Comment> implements ICommentService {
    private static ICommentService instance;

    public static ICommentService getInstance() {
        if (instance == null) {
            instance = new CommentService();
        }
        return instance;
    }

    @Override
    public Comment addComment(Comment comment, String ip, String address) {
        try {
            Level level;
            Comment success = CommentDAO.getInstance().addComment(comment.getProduct().getId(), comment.getUser().getId(), comment.getContent());
            if(success != null) {
                comment.setAfterData("Add comment success ID=" + success.getId());
                level = LevelDAO.getInstance().getLevel(1).get(0);
            } else {
                comment.setAfterData("Add failed. New comment isn't created!");
                level = LevelDAO.getInstance().getLevel(2).get(0);
            }
            super.insert(comment, level, ip, address);
            return success;
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<Comment> getAllComments() {
        try {
            return CommentDAO.getInstance().getAllComments();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<Comment> getCommentsByProduct(Product product) {
        try {
            return CommentDAO.getInstance().getCommentsByProduct(product.getId());
        } catch (Exception e) {
            return null;
        }
    }
}