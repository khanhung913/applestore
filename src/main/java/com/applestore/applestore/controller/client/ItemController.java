package com.applestore.applestore.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.applestore.applestore.domain.Product;
import com.applestore.applestore.service.ProductService;


@Controller
public class ItemController {
    private final ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;
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

    @GetMapping("/product")
    public String allProduct(Model model) {
        List<Product> products= this.productService.handlePrintAllProducts();
        model.addAttribute("products", products);
        return "client/product/productlist";
    }
    

}
