package com.applestore.applestore.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;



@Controller
public class ItemController {
    @GetMapping("/product/{id}")
    public String detailPage(Model model) {
        return "client/product/detail";
    }
    
}
