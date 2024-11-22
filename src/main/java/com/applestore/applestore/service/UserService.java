package com.applestore.applestore.service;

import java.util.List;
import java.util.Random;

import org.springframework.stereotype.Service;

import com.applestore.applestore.domain.Role;
import com.applestore.applestore.domain.User;
import com.applestore.applestore.domain.DTO.RegisterDTO;
import com.applestore.applestore.repository.RoleRepository;
import com.applestore.applestore.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

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

    public void handleSaveUserBeforeEditProfile(HttpSession session, User user, String fName, String lName,
            String phoneNumber,
            String newAddress, String avt) {
        User newUser = new User();
        newUser.setId(user.getId());
        newUser.setEmail(user.getEmail());
        newUser.setFirstName(fName);
        newUser.setLastName(lName);
        if (avt != null) {
            newUser.setAvatar(avt);
            session.setAttribute("avatar", avt);
        } else {
            newUser.setAvatar(user.getAvatar());
        }
        newUser.setPhone(phoneNumber);
        newUser.setPassword(user.getPassword());
        newUser.setRole(user.getRole());
        newUser.setAddress(newAddress);
        this.userRepository.save(newUser);
    }

    public String handleGenerateToken() {
        int leftLimit = 48;
        int rightLimit = 57;
        int targetStringLength = 6;
        Random random = new Random();
        String generatedToken = random.ints(leftLimit, rightLimit + 1)
                .limit(targetStringLength)
                .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
                .toString();
        return generatedToken;
    }

    public User handleFindUserByToken(String token) {
        return this.userRepository.findByToken(token);
    }
}
