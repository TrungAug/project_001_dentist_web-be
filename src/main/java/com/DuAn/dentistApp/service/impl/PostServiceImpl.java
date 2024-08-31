package com.DuAn.dentistApp.service.impl;

import com.DuAn.dentistApp.entities.Post;
import com.DuAn.dentistApp.model.request.PostRequest;
import com.DuAn.dentistApp.model.response.MessageResponse;
import com.DuAn.dentistApp.repositories.DentalStaffRepository;
import com.DuAn.dentistApp.repositories.PostRepository;
import com.DuAn.dentistApp.service.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class PostServiceImpl implements PostService {
    @Autowired
    PostRepository postRepository;

    @Autowired
    DentalStaffRepository dentalStaffRepository ;

    @Override
    public Post findPostById(int postId) {
        return postRepository.findById(postId).orElseThrow(null);
    }

    @Override
    public List<Post> findAllPost() {
        return postRepository.findAll() ;
    }

    @Override
    public List<Post> findAllPostExceptDeleted() {
        return postRepository.findAll().stream()
                .filter(post -> !post.isDeleted())
                .collect(Collectors.toList());
    }


    @Override
    public Post savePost(PostRequest postRequest) {
        var post = Post.builder()
                        .image(postRequest.getImage())
                        .title(postRequest.getTitle())
                        .body(postRequest.getBody())
                        .createDate(new Date())
                        .createBy(dentalStaffRepository.findById(postRequest.getCreateById()).orElseThrow(null))
                        .build() ;
        postRepository.save(post);
        return post;
    }

    @Override
    public Post updatePost(int postId, PostRequest postRequest) {
        var post = Post.builder()
                .postId(postId)
                .image(postRequest.getImage())
                .title(postRequest.getTitle())
                .body(postRequest.getBody())
                .createDate(postRequest.getCreateDate())
                .createBy(dentalStaffRepository.findById(postRequest.getCreateById()).orElse(null))
                .build() ;
        postRepository.save(post);
        return post;
    }

    @Override
    public MessageResponse deletePost(int postId) {
        try {
            postRepository.deleteById(postId);
            return new MessageResponse("successfully");
        }catch (Exception e){
            e.printStackTrace();
            return new MessageResponse("fail");
        }
    }

    @Override
    public MessageResponse softDeletePost(int postId) {
        try {
            Post post = postRepository.findById(postId)
                                              .orElseThrow(() -> new RuntimeException("Post not found"));
            post.setDeleted(true);
            postRepository.save(post);
            return new MessageResponse("successfully");
        }catch (Exception e){
            e.printStackTrace();
            return new MessageResponse("fail");
        }
    }
}
