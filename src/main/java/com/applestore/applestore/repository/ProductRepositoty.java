package com.applestore.applestore.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.applestore.applestore.domain.Product;

@Repository
public interface ProductRepositoty extends JpaRepository<Product, Long> {
    List<Product> findByTarget(String target);

    Product findById(long id);
}
