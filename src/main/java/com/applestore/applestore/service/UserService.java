package com.applestore.applestore.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.applestore.applestore.domain.Role;
import com.applestore.applestore.domain.User;
import com.applestore.applestore.domain.DTO.RegisterDTO;
import com.applestore.applestore.repository.RoleRepository;
import com.applestore.applestore.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public void handleSaveUser(User user) {
        this.userRepository.save(user);
    }

    public List<User> handlePrintAllUser() {
        return this.userRepository.findAll();
    }

    public User handleFindByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public User handleFindById(long id) {
        return this.userRepository.findById(id);
    }

    public void handleRemoveUserById(long id) {
        this.userRepository.deleteById(id);
    }

    public Role handleGetRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    public User mapperUser(User user, RegisterDTO RegisterDTO) {
        user.setEmail(RegisterDTO.getEmail());
        user.setFirstName(RegisterDTO.getFirstName());
        user.setLastName(RegisterDTO.getLastName());
        user.setPassword(RegisterDTO.getPassword());
        return user;
    }

    public boolean checkExistByEmail(String email) {
        return this.userRepository.existsByEmail(email);
    }

    public User getUserByEmail(String mail) {
        return this.userRepository.findByEmail(mail);
    }
}
