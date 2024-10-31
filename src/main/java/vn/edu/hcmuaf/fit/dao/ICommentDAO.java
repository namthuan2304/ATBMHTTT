package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.Comment;

import java.util.List;

public interface ICommentDAO extends GenericDAO<Comment>{

    Comment addComment(Integer proId, Integer userId, String content);

    List<Comment> getAllComments();

    List<Comment> getCommentsByProduct(Integer id);
}