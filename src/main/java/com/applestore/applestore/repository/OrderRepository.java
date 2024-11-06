package com.applestore.applestore.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.applestore.applestore.domain.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

}
