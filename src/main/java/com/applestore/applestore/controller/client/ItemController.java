package com.applestore.applestore.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.applestore.applestore.domain.Cart;
import com.applestore.applestore.domain.CartItem;
import com.applestore.applestore.domain.Product;
import com.applestore.applestore.domain.User;
import com.applestore.applestore.service.ProductService;
import com.applestore.applestore.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ItemController {
    private final ProductService productService;

    private final UserService userService;

    public ItemController(ProductService productService, UserService userService) {
        this.productService = productService;
        this.userService = userService;
    }

    @GetMapping("/product/{id}")
    public String detailPage(Model model, @PathVariable Long id) {
        Product product = this.productService.handleFindById(id);
        List<Product> iphone = this.productService.handlePrintByTarget("iPhone");
        List<Product> mac = this.productService.handlePrintByTarget("Mac");
        List<Product> applewatch = this.productService.handlePrintByTarget("Apple Watch");
        List<Product> airpods = this.productService.handlePrintByTarget("AirPods");
        model.addAttribute("product", product);
        model.addAttribute("iphone", iphone);
        model.addAttribute("mac", mac);
        model.addAttribute("applewatch", applewatch);
        model.addAttribute("airpods", airpods);
        return "client/product/detail";
    }

    @GetMapping("/product/target/{target}")
    public String targetProductPage(Model model, @PathVariable String target) {
        List<Product> products = this.productService.handlePrintByTarget(target);
        model.addAttribute("products", products);
        return "client/product/producttargetlist";
    }

    @GetMapping("/product")
    public String allProduct(Model model) {
        List<Product> products = this.productService.handlePrintAllProducts();
        model.addAttribute("products", products);
        return "client/product/productlist";
    }

    @PostMapping("/addItemToCartFromProductPage/{id}")
    public String addItemToCartFromProductPage(@PathVariable long id, Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long productId = id;
        long quantity = 1;
        String email = (String) session.getAttribute("email");
        this.productService.handleAddItemToCart(email, productId, session, quantity);
        return "redirect:/product";
    }

    @PostMapping("/addItemToCartFromHomePage/{id}")
    public String addItemToCartFromHomePage(@PathVariable long id, Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long productId = id;
        long quantity = 1;
        String email = (String) session.getAttribute("email");
        this.productService.handleAddItemToCart(email, productId, session, quantity);
        return "redirect:/";
    }

    @PostMapping("/addItemToCartFromDetailPage/{id}")
    public String addItemToCartFromDetailPage(@PathVariable("id") long id,
            @RequestParam("product-quantity") long quantity,
            Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long productId = id;
        long productQuantity = quantity;
        String email = (String) session.getAttribute("email");
        this.productService.handleAddItemToCart(email, productId, session, productQuantity);
        return "redirect:/product/{id}";
    }

    @PostMapping("/delete-item/{id}")
    public String postMethodName(@PathVariable("id") long id, HttpServletRequest request,
            @ModelAttribute("cart") Cart cart) {
        List<CartItem> items = cart.getCartItems();
        if (items != null) {
            this.productService.handleUpdateCartQuantity(items);
        }
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User user = this.userService.handleFindByEmail(email);
        Cart deleteCart = this.productService.handleFindCartByUser(user);
        this.productService.handleDeleteItem(id, deleteCart, session);
        return "redirect:/cart";
    }

}
