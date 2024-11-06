package com.applestore.applestore.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.applestore.applestore.domain.Order;
import com.applestore.applestore.service.ProductService;

@Controller
public class OrderController {
    private final ProductService productService;

    public OrderController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/admin/order")
    public String getOrderPage(Model model) {
        List<Order> order = this.productService.handlePrintAllOrder();
        model.addAttribute("orders", order);
        return "admin/order/show";
    }

}
