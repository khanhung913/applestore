package com.applestore.applestore.controller.admin;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.applestore.applestore.domain.User;
import com.applestore.applestore.service.UserService;

@Controller
public class UserController {
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;

    }

    @RequestMapping("/admin/user")
    public String ListUserPage(Model model) {
        List<User> listUser = this.userService.handlePrintAllUser();
        model.addAttribute("users", listUser);
        return "admin/user/list-user";
    }

    @RequestMapping("admin/user-info/{id}")
    public String UserInfoPage(Model model, @PathVariable long id) {
        User user = this.userService.handleFindById(id);
        model.addAttribute("user", user);
        return "admin/user/userInfo";
    }

    @RequestMapping("admin/user-update/{id}")
    public String UserUpdatePage(Model model, @PathVariable long id) {
        User user = this.userService.handleFindById(id);
        model.addAttribute("newUser", user);
        return "admin/user/userUpdate";
    }

    @RequestMapping(value = "admin/user-update", method = RequestMethod.POST)
    public String UserUpdateSuccess(Model model, @ModelAttribute("newUser") User user) {
        User currentUser = this.userService.handleFindById(user.getId());
        if (currentUser != null) {
            currentUser.setPhone(user.getPhone());
            currentUser.setFirstName(user.getFirstName());
            currentUser.setAddress(user.getAddress());
            this.userService.handleSaveUser(currentUser);
        }
        return "redirect:/admin/user";
    }

    @RequestMapping("admin/user-delete/{id}")
    public String UserDelete(Model model, @PathVariable long id) {
        this.userService.handleRemoveUserById(id);
        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user/create")
    public String CreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String CreateSuccess(Model model, @ModelAttribute("newUser") User user) {
        this.userService.handleSaveUser(user);
        return "redirect:/admin/user";
    }
}
