package com.applestore.applestore.service;

import java.util.List;
import org.springframework.stereotype.Service;

import com.applestore.applestore.domain.Product;
import com.applestore.applestore.repository.ProductRepositoty;

@Service
public class ProductService {
    private final ProductRepositoty productRepositoty;

    public ProductService(ProductRepositoty productRepositoty) {
        this.productRepositoty = productRepositoty;
    }

    public void handleSaveProduct(Product product) {
        this.productRepositoty.save(product);
    }

    public List<Product> handlePrintAllProducts() {
        return this.productRepositoty.findAll();
    }

    public Product handleFindById(long id) {
        return this.productRepositoty.findById(id);
    }

    public List<Product> handlePrintByTarget(String target) {
        return this.productRepositoty.findByTarget(target);
    }
}
