package com.library.controller;

import com.library.model.Search;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by vural on 10-Dec-16.
 */
@Controller
public class MyController {


   /* @RequestMapping(value = "/testController")
    public String testController(ModelMap model, @ModelAttribute(value = "content")Search search){
        model.put("fname","vural");
        model.addAttribute("lname","atici");

        model.addAttribute("attr1", "attr5");
        model.put("attr2", "attr7");
        //System.out.println("testController " + search.toString());
        return "test";
    }*/

    @RequestMapping(value = "/page1")
    public String page1(ModelMap model){
        return "page1";
    }
}
