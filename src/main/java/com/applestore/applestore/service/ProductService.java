package com.applestore.applestore.service;

import java.util.List;
import org.springframework.stereotype.Service;

import com.applestore.applestore.domain.Cart;
import com.applestore.applestore.domain.CartItem;
import com.applestore.applestore.domain.Product;
import com.applestore.applestore.domain.User;
import com.applestore.applestore.repository.CartItemRepository;
import com.applestore.applestore.repository.CartRepository;
import com.applestore.applestore.repository.ProductRepositoty;

@Service
public class ProductService {
    private final ProductRepositoty productRepositoty;
    private final CartRepository cartRepository;
    private final CartItemRepository cartItemRepository;
    private final UserService userService;

    public ProductService(ProductRepositoty productRepositoty, CartRepository cartRepository,
            CartItemRepository cartItemRepository, UserService userService) {
        this.productRepositoty = productRepositoty;
        this.cartItemRepository = cartItemRepository;
        this.cartRepository = cartRepository;
        this.userService = userService;
    }

    public void handleSaveProduct(Product product) {
        this.productRepositoty.save(product);
    }

    public List<Product> handlePrintAllProducts() {
        return this.productRepositoty.findAll();
    }

    public Product handleFindById(long id) {
        return this.productRepositoty.findById(id);
    }

    public List<Product> handlePrintByTarget(String target) {
        return this.productRepositoty.findByTarget(target);
    }

    public void handleAddItemToCart(String email, long productId) {
        User user = this.userService.handleFindByEmail(email);
        if (user != null) {
            Cart cart = this.cartRepository.findByUser(user);
            if (cart == null) {
                Cart newCart = new Cart();
                newCart.setUser(user);
                newCart.setSum(1);
                this.cartRepository.save(newCart);
            }
            Product product = this.productRepositoty.findById(productId);
            CartItem item = this.cartItemRepository.findByCartAndProduct(cart, product);
            cart = this.cartRepository.findByUser(user);
            if (item == null) {
                CartItem cartItem = new CartItem();
                cartItem.setCart(cart);
                cartItem.setProduct(product);
                cartItem.setQuantity(1);
                this.cartItemRepository.save(cartItem);
            } else {
                item.setQuantity(item.getQuantity() + 1);
                this.cartItemRepository.save(item);
            }
        }
    }
}
