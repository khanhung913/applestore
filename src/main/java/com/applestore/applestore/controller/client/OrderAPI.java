package com.applestore.applestore.controller.client;

import org.springframework.web.bind.annotation.RestController;

import com.applestore.applestore.domain.Order;
import com.applestore.applestore.service.ProductService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

class CancelOrderRequest {
    private long itemId;

    public long getItemId() {
        return itemId;
    }

    public void setItemId(long itemId) {
        this.itemId = itemId;
    }

}

@RestController
public class OrderAPI {

    private final ProductService productService;

    public OrderAPI(ProductService productService) {
        this.productService = productService;
    }

    @PostMapping("/api/cancel-order")
    public void addProductToCart(
            @RequestBody() CancelOrderRequest cancelOrderRequest
    // ,
    // HttpServletRequest request
    ) {

        // HttpSession session = request.getSession(false);
        // String email = (String) session.getAttribute("email");
        long id = cancelOrderRequest.getItemId();
        Order order = this.productService.handleFindOrderById(id);
        this.productService.handleSaveOrderBeforeCancel(order);

        // return ResponseEntity.ok().body("キャンセル");
    }

}
