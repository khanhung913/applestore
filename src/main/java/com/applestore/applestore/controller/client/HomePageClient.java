package com.applestore.applestore.controller.client;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.applestore.applestore.domain.Product;
import com.applestore.applestore.domain.User;
import com.applestore.applestore.domain.UserDTO;
import com.applestore.applestore.service.ProductService;

import jakarta.validation.Valid;

@Controller
public class HomePageClient {
    private final ProductService productService;
    private final UserDTO userDTO;

    public HomePageClient(ProductService productService,UserDTO userDTO) {
        this.productService = productService;
        this.userDTO =userDTO;
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
        return "client/login/login";
    }

    @GetMapping("/signup")
    public String signup(Model model) {
        model.addAttribute("newUser", new User());
        return "client/login/signup";
    }

    @PostMapping("/signup")
    public String signupRegister(Model model, @ModelAttribute("newUserDTO") @Valid UserDTO userDTO,
            BindingResult bindingResult) {

        return "redirect:/client/login";
    }

}
