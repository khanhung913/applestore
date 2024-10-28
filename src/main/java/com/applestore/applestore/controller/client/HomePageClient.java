package com.applestore.applestore.controller.client;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.applestore.applestore.domain.Product;
import com.applestore.applestore.service.ProductService;

@Controller
public class HomePageClient {
    private final ProductService productService;

    public HomePageClient(ProductService productService) {
        this.productService = productService;
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

}
