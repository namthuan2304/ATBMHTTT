package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.model.Comment;
import vn.edu.hcmuaf.fit.model.Product;

import java.util.List;

public interface ICommentService {

    Comment addComment(Comment comment, String ip, String address);

    List<Comment> getAllComments();

    List<Comment> getCommentsByProduct(Product product);
}
