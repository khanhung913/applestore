package com.applestore.applestore.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.applestore.applestore.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    // List<User> findByEmail(String email);
    User findByEmail(String email);

    User findById(long id);

    boolean existsByEmail(String email);

    User findByToken(String token);
}
