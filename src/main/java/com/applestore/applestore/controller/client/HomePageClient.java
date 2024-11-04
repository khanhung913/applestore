package com.applestore.applestore.controller.client;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.applestore.applestore.domain.Cart;
import com.applestore.applestore.domain.CartItem;
import com.applestore.applestore.domain.DTO.RegisterDTO;
import com.applestore.applestore.domain.Product;
import com.applestore.applestore.domain.User;
import com.applestore.applestore.repository.CartRepository;
import com.applestore.applestore.repository.RoleRepository;
import com.applestore.applestore.service.ProductService;
import com.applestore.applestore.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class HomePageClient {
    private final PasswordEncoder passwordEncoder;
    private final ProductService productService;
    private final UserService userService;
    private final RoleRepository roleRepository;
    private final CartRepository cartRepository;

    public HomePageClient(ProductService productService, UserService userService, PasswordEncoder passwordEncoder,
            RoleRepository roleRepository,CartRepository cartRepository) {
        this.productService = productService;
        this.userService = userService;
        this.roleRepository = roleRepository;
        this.passwordEncoder = passwordEncoder;
        this.cartRepository = cartRepository;
    }

    @GetMapping("/")
    public String getMethodName(Model model) {
        List<Product> iphones = this.productService.handlePrintByTarget("iPhone");
        List<Product> macs = this.productService.handlePrintByTarget("Mac");
        List<Product> applewatchs = this.productService.handlePrintByTarget("Apple Watch");
        List<Product> airpods = this.productService.handlePrintByTarget("AirPods");
        model.addAttribute("iphones", iphones);
        model.addAttribute("macs", macs);
        model.addAttribute("applewatchs", applewatchs);
        model.addAttribute("airpods", airpods);
        return "client/homepage/show";
    }

    @GetMapping("/login")
    public String login() {
        return "client/auth/login";
    }

    @GetMapping("/signup")
    public String signup(Model model) {
        model.addAttribute("newRegisterDTO", new RegisterDTO());
        return "client/auth/signup";
    }

    @PostMapping("/signup")
    public String signupRegister(Model model, @ModelAttribute("newRegisterDTO") @Valid RegisterDTO RegisterDTO,
            BindingResult bindingResult) {
        User user = new User();
        this.userService.mapperUser(user, RegisterDTO);
        user.setPassword(this.passwordEncoder.encode(user.getPassword()));
        user.setRole(this.roleRepository.findByName("User"));
        if (bindingResult.hasErrors())
            return "client/auth/signup";
        this.userService.handleSaveUser(user);
        return "redirect:/login?success";
    }

    @GetMapping("/404-not-found")
    public String notFoundPage(Model model) {
        return "client/auth/error404";
    }

    @GetMapping("/contact")
    public String getContactPage(Model model) {
        return "client/homepage/contact";
    }

    @GetMapping("/cart")
    public String getCartPage(Model model,HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User user = this.userService.handleFindByEmail(email);
        Cart cart= this.productService.handleFindCartByUser(user);
        List<CartItem> items =this.productService.handleFindListItemByCart(cart);
        long totalPrice=0;
        for (CartItem cartItem : items) {
            totalPrice+= cartItem.getQuantity() * cartItem.getProduct().getPrice();
        }
        model.addAttribute("items", items);
        model.addAttribute("totalPrice", totalPrice);

   
        return "client/product/cart";
    }

}
