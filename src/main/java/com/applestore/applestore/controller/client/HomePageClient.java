package com.applestore.applestore.controller.client;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.applestore.applestore.domain.Product;
import com.applestore.applestore.domain.User;
import com.applestore.applestore.domain.DTO.RegisterDTO;
import com.applestore.applestore.repository.RoleRepository;
import com.applestore.applestore.service.ProductService;
import com.applestore.applestore.service.UserService;

import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomePageClient {
    private final PasswordEncoder passwordEncoder;
    private final ProductService productService;
    private final UserService userService;
    private final RoleRepository roleRepository;

    public HomePageClient(ProductService productService, UserService userService, PasswordEncoder passwordEncoder,
            RoleRepository roleRepository) {
        this.productService = productService;
        this.userService = userService;
        this.roleRepository = roleRepository;
        this.passwordEncoder = passwordEncoder;
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

}
