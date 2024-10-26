package com.applestore.applestore.controller.admin;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.applestore.applestore.domain.User;
import com.applestore.applestore.service.UploadService;
import com.applestore.applestore.service.UserService;

@Controller
public class UserController {
    private final UserService userService;
    private final UploadService uploadService;

    public UserController(UserService userService, UploadService uploadService) {
        this.userService = userService;
        this.uploadService = uploadService;
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

    @PostMapping(value = "/admin/user/create")
    public String CreateSuccess(Model model, @ModelAttribute("newUser") User user,
            @RequestParam("file") MultipartFile file) {
        String avatar = this.uploadService.handleUploadFile(file, "avatar");
        user.setAvatar(avatar);
        user.setRole(this.userService.handleGetRoleByName(user.getRole().getRoleName()));
        this.userService.handleSaveUser(user);
        return "redirect:/admin/user";
    }
}
