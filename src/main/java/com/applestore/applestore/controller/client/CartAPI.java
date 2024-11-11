package com.applestore.applestore.controller.client;

import org.springframework.web.bind.annotation.RestController;

import com.applestore.applestore.service.ProductService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

class CartRequest {
    private long quantity;
    private long productId;

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }

    public long getProductId() {
        return productId;
    }

    public void setProductId(long productId) {
        this.productId = productId;
    }
}

@RestController
public class CartAPI {

    private final ProductService productService;

    public CartAPI(ProductService productService) {
        this.productService = productService;
    }

    @PostMapping("/api/add-product-to-cart")
    public ResponseEntity<Long> addProductToCart(
            @RequestBody() CartRequest cartRequest,
            HttpServletRequest request) {

        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        this.productService.handleAddItemToCart(email, cartRequest.getProductId(), session,
                cartRequest.getQuantity());

        long sum = (long) session.getAttribute("sum");

        return ResponseEntity.ok().body(sum);
    }

    @PostMapping("/api/change-quantity")
    public void changeQuantity(
            @RequestBody() CartRequest cartRequest) {
        this.productService.handleChangeQuantity(cartRequest.getProductId(), cartRequest.getQuantity());

    }

}
