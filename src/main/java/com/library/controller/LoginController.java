package com.library.controller;

import com.library.model.User;
import com.library.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

/**
 * Created by vural on 16-Dec-16.
 */

@Controller
public class LoginController {

    private static final String LOGIN = "login";
    private static final String INDEX = "index";
    private static final String SIGN_UP = "signup";
    private static final String RESULT = "result";
    private static final String USER_FORM = "userForm";

    @Autowired
    UserService userService;

    @RequestMapping(value = "/login")
    public String login(ModelMap model){
        return LOGIN;
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String verifyLogin(ModelMap model, @RequestParam String mail, @RequestParam String password, HttpSession session){

        User user = userService.loginUser(mail, password);
        if (user == null){
            model.addAttribute("loginError", "Error logging in. Please try again");
            return LOGIN;
        }

        User usermodel = user;

//        model.addAttribute("loggedInUserModel", usermodel);
        session.setAttribute("loggedInUser", user);
        return "redirect:/"+INDEX;
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.removeAttribute("loggedInUser");
        session.invalidate();
        return "redirect:/"+INDEX;
    }

    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public String register(ModelMap model) {
        model.addAttribute(USER_FORM, new User());
        return SIGN_UP;
    }

    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public String verifyRegister(@ModelAttribute(value = USER_FORM) @Valid final User user, BindingResult result, HttpSession session, ModelMap model) {
        if (result.hasErrors()){
            return SIGN_UP;
        }

        int resultJdbc = userService.save(user);

        if (resultJdbc == 2){
            model.addAttribute("error","operation failed. user registered.");
            return "/signup";
        }

        if (resultJdbc == 1){
            session.setAttribute("loggedInUser", user);
            return "redirect:/"+INDEX;
        }
        return "redirect:/"+INDEX;
    }
}
