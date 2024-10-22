package com.applestore.applestore.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.applestore.applestore.domain.User;
import com.applestore.applestore.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public void handleSaveUser(User user) {
        if (!user.getEmail().isEmpty() && !user.getPassword().isEmpty() && !user.getFirstName().isEmpty()) {
            this.userRepository.save(user);
        }
    }

    public List<User> handlePrintAllUser() {
        return this.userRepository.findAll();
    }

    public List<User> handleFindByEmail() {
        return this.userRepository.findByEmail("khanhung913@gmail.com");
    }

    public User handleFindById(long id) {
        return this.userRepository.findById(id);
    }

    public void handleRemoveUserById(long id) {
        this.userRepository.deleteById(id);
    }
}
