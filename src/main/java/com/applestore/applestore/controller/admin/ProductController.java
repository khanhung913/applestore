package com.applestore.applestore.controller.admin;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.applestore.applestore.domain.Product;
import com.applestore.applestore.service.ProductService;
import com.applestore.applestore.service.UploadService;

@Controller
public class ProductController {
    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    @GetMapping("/admin/product")
    public String getProductPage(Model model) {
        List<Product> productList = this.productService.handlePrintAllProducts();
        model.addAttribute("products", productList);
        return "admin/product/show";
    }

    @GetMapping("/admin/product-info/{id}")
    public String getProductInfoPage(Model model, @PathVariable long id) {
        Product product = this.productService.handleFindById(id);
        model.addAttribute("product", product);
        return "admin/product/info";
    }

    @GetMapping("/admin/product/create")
    public String productCreatePage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String postMethodName(Model model, @ModelAttribute("newProduct") Product product,
            @RequestParam("file") MultipartFile file) {
        String productPicture = this.uploadService.handleUploadProductFile(file, "ProductImage");
        product.setImage(productPicture);
        this.productService.handleSaveProduct(product);
        return "redirect:/admin/product";
    }

}
