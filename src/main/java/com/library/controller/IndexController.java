package com.library.controller;

import com.library.model.Author;
import com.library.model.Book;
import com.library.model.Search;
import com.library.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.*;

/**
 * Created by vural on 09-Dec-16.
 */
@Controller
public class IndexController {

    private static final String SEARCH_FORM = "searchForm";
    private static final String RESULT = "result";
    private static final String INDEX = "index";

    @Autowired
    private BookService bookService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String getForm(ModelMap model){
        model.addAttribute(SEARCH_FORM, new Search());
        return INDEX;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getFormSlash(ModelMap model){
        model.addAttribute(SEARCH_FORM, new Search());
        return INDEX;
    }


    @RequestMapping(value = "/index", method = RequestMethod.POST)
    public String processSubmit(final ModelMap model, @ModelAttribute(SEARCH_FORM) final Search search,
                                final BindingResult result, RedirectAttributes redirectAttributes, HttpSession session) throws IOException {
        if (result.hasErrors()) {
            return INDEX;
        }
        else
        {
            if(search.getword().equals(null) || search.getword().trim().length() == 0) {
                return INDEX;
            }
            else {
                HashSet<Book> bookSetObj =  processBookService(search);
                redirectAttributes.addFlashAttribute("bookSet", bookSetObj);
                session.setAttribute("bookSet",bookSetObj);
                return "redirect:/result";
            }
        }
    }

    private HashSet<Book> processBookService(Search search){
        return bookService.searchBook(search.getword());
    }

}
