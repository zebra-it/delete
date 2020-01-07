package com.example.demo.controller;

import com.example.demo.model.Post;
import com.example.demo.model.User;
import com.example.demo.repos.PostRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {
    @Autowired
    private PostRepo postRepo;

    @GetMapping("/")
    public String hello(Model model) {
        model.addAttribute("some", "some");
        return "hello";
    }

    @GetMapping("/main")
    public String main(Model model, @RequestParam(required = false, defaultValue = "") String filter) {
        Iterable<Post> posts;

        if (filter != null && !filter.isEmpty()) {
            posts = postRepo.findByTag(filter);
        } else {
            posts = postRepo.findAll();
        }
        model.addAttribute("posts", posts);
        model.addAttribute("filter", filter);
        return "main";
    }

    @PostMapping("/main")
    public String add(
            @AuthenticationPrincipal User user,
            Model model,
            @RequestParam String text, @RequestParam String tag) {

        Post post = new Post(text, tag, user);
        postRepo.save(post);
        Iterable<Post> posts = postRepo.findAll();
        model.addAttribute("posts", posts);
        return "main";
    }
    /*
        отправка письма с сыслкой на смену пароля после введения логина
        ссылка должна дейтсвовать только 24 часа
        так же как и ссылка на регистрацию
    */

    @PostMapping("resPas")
    public String resetPassword(Model model,
                                @RequestParam String username,
                                @RequestParam String password,
                                @RequestParam String newPassword) {
        model.addAttribute("pass", "work");
        return "redirect:/login";
    }

    @GetMapping("/resetPassword")
    public String resetPass() {
        return "resetPassword";
    }


}
