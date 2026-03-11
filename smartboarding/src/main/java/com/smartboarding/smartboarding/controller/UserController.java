package com.smartboarding.smartboarding.controller;

import com.smartboarding.smartboarding.model.User;
import com.smartboarding.smartboarding.repository.UserRepository;

import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/users")
@CrossOrigin
public class UserController {

    private final UserRepository repository;

    public UserController(UserRepository repository) {
        this.repository = repository;
    }

    // CREATE USER
    @PostMapping
    public User createUser(@RequestBody User user) {
        return repository.save(user);
    }

    // GET ALL USERS
    @GetMapping
    public List<User> getAllUsers() {
        return repository.findAll();
    }

    // GET USER BY ID
    @GetMapping("/{id}")
    public Optional<User> getUserById(@PathVariable Long id) {
        return repository.findById(id);
    }

    // DELETE USER
    @DeleteMapping("/{id}")
    public void deleteUser(@PathVariable Long id) {
        repository.deleteById(id);
    }
}