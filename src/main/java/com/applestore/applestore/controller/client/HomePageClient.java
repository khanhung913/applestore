package com.applestore.applestore.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class HomePageClient {
    @GetMapping("/")
    public String getMethodName() {
        return "client/homepage/show";
    }
    
}
