package com.DuAn.dentistApp.service.service;

import com.DuAn.dentistApp.entities.Post;
import com.DuAn.dentistApp.model.request.PostRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;

import java.util.List;

public interface PostService {

    Post findPostById(int postId);

    List<Post> findAllPost();

    List<Post> findAllPostExceptDeleted();

    Post savePost(PostRequest postRequest);

    Post updatePost(int postId, PostRequest postRequest);

    MessageResponse deletePost(int postId);

    MessageResponse softDeletePost(int postId);
}
