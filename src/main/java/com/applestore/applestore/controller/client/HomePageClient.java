package com.applestore.applestore.controller.client;

import java.util.ArrayList;
import java.util.List;

import org.springframework.boot.autoconfigure.jms.JmsProperties.Listener.Session;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.applestore.applestore.domain.Cart;
import com.applestore.applestore.domain.CartItem;
import com.applestore.applestore.domain.Order;
import com.applestore.applestore.domain.OrderDetail;
import com.applestore.applestore.domain.DTO.RegisterDTO;
import com.applestore.applestore.domain.Product;
import com.applestore.applestore.domain.User;
import com.applestore.applestore.repository.RoleRepository;
import com.applestore.applestore.service.ProductService;
import com.applestore.applestore.service.UploadService;
import com.applestore.applestore.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class HomePageClient {
    private final PasswordEncoder passwordEncoder;
    private final ProductService productService;
    private final UserService userService;
    private final RoleRepository roleRepository;
    private final UploadService uploadService;

    public HomePageClient(ProductService productService, UserService userService, PasswordEncoder passwordEncoder,
            RoleRepository roleRepository, UploadService uploadService) {
        this.productService = productService;
        this.userService = userService;
        this.roleRepository = roleRepository;
        this.passwordEncoder = passwordEncoder;
        this.uploadService = uploadService;
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
    public String getCartPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User user = this.userService.handleFindByEmail(email);
        Cart cart = this.productService.handleFindCartByUser(user);
        List<CartItem> cartItems = cart == null ? new ArrayList<CartItem>() : cart.getCartItems();
        long totalPrice = 0;
        for (CartItem cartItem : cartItems) {
            totalPrice += cartItem.getQuantity() * cartItem.getProduct().getPrice();
        }
        model.addAttribute("cart", cart);
        model.addAttribute("cartItems", cartItems);
        model.addAttribute("totalPrice", totalPrice);
        return "client/product/cart";
    }

    @PostMapping("/confirm-checkout")
    public String getConfirmCheckoutPage(Model model, HttpServletRequest request, @ModelAttribute("cart") Cart cart) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User user = this.userService.handleFindByEmail(email);
        model.addAttribute("user", user);
        List<CartItem> items = cart.getCartItems();
        this.productService.handleUpdateCartQuantity(items);
        List<CartItem> cartItems = this.productService
                .handleFindListItemByCart(this.productService.handleFindCartByUser(user));
        model.addAttribute("cartItems", cartItems);
        long totalPrice = 0;
        for (CartItem cartItem : cartItems) {
            totalPrice += cartItem.getQuantity() * cartItem.getProduct().getPrice();
        }
        model.addAttribute("totalPrice", totalPrice);
        return "client/product/confirm-checkout";
    }

    @PostMapping("/place-order")
    public String getPlaceOrderPage(Model model, @RequestParam("name") String name, @RequestParam("phone") String phone,
            @RequestParam("address") String address, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User user = this.userService.handleFindByEmail(email);

        this.productService.handlePlaceOrder(session, user, name, phone, address);

        return "redirect:/thank";
    }

    @GetMapping("/thank")
    public String getThankPage(Model model) {
        return "client/product/thanks";
    }

    @PostMapping("/order-history")
    public String getOrderHistoryPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User user = this.userService.handleFindByEmail(email);
        List<Order> orderList = this.productService.handleFindAllCartByUser(user);
        model.addAttribute("orderList", orderList);
        return "client/product/orderhistory";
    }

    @GetMapping("/order-detail/{id}")
    public String getMethodName(Model model, @PathVariable("id") long id) {
        Order order = this.productService.handleFindOrderById(id);
        List<OrderDetail> orderDetail = this.productService.handleFindAllOrderDetailByOrder(order);
        model.addAttribute("orderDetail", orderDetail);
        model.addAttribute("order", order);
        return "client/product/orderdetail";
    }

    @GetMapping("/profile")
    public String profilePage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User user = this.userService.handleFindByEmail(email);
        model.addAttribute("user", user);

        return "client/homepage/profile";
    }

    @GetMapping("/edit-profile")
    public String getEditProfilePage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User user = this.userService.handleFindByEmail(email);
        model.addAttribute("user", user);
        return "client/homepage/edit-profile";
    }

    @PostMapping("/edit")
    public String postEditProfilePage(Model model, @RequestParam("firstName") String firstName,
            @RequestParam("lastName") String lastName, @RequestParam("phone") String phone,
            @RequestParam("address") String address, @RequestParam("file") MultipartFile file,
            HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User user = this.userService.handleFindByEmail(email);
        String fName = firstName;
        String lName = lastName;
        String phoneNumber = phone;
        String newAddress = address;
        String avt = this.uploadService.handleUploadFile(file, "avatar");
        this.userService.handleSaveUserBeforeEditProfile(session,user, fName, lName, phoneNumber, newAddress, avt);
        return "redirect:/profile";
    }

}
