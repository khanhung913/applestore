package com.applestore.applestore.service.Validator;

import org.springframework.stereotype.Service;

import com.applestore.applestore.domain.DTO.ResetPassDTO;
import com.applestore.applestore.service.UserService;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

@Service
public class ResetPassValidator implements ConstraintValidator<ResetPassChecked, ResetPassDTO> {

    private final UserService userService;

    public ResetPassValidator(UserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean isValid(ResetPassDTO user, ConstraintValidatorContext context) {
        boolean valid = true;

        if (!user.getPassword().equals(user.getConfirmPassword())) {
            context.buildConstraintViolationWithTemplate("パスワードと合っていません。")
                    .addPropertyNode("confirmPassword")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }
        return valid;
    }
}
