package com.library.controller;

import com.library.model.Book;
import com.library.model.Search;
import com.library.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by vural on 11-Dec-16.
 */
@Controller
@Scope(value = "session")
public class ResultController {

    private static final String SEARCH_FORM = "searchForm";
    private static final String RESULT = "result";
    private static final String INDEX = "index";

    @Autowired
    private BookService bookService;

    @RequestMapping(value = "/result" , method = RequestMethod.GET)
    public String result(ModelMap model, @ModelAttribute("bookSet")HashSet<Book> bookSet, HttpSession session){
        model.addAttribute(SEARCH_FORM, new Search());
        model.addAttribute("books", bookSet);
        session.setAttribute("books", bookSet);
        return RESULT;
    }

    @RequestMapping(value = "/getDetails", method = RequestMethod.GET)
    public String getDetails(ModelMap model, @ModelAttribute("bookid") String bookid, HttpSession session){

        HashSet<Book> bookSet = (HashSet<Book>) session.getAttribute("bookSet");
        model.addAttribute(SEARCH_FORM, new Search());
        model.addAttribute("books", bookSet);
        Book book = getBookDetailsByBookId(new Integer(bookid));
        model.addAttribute(book);
        return RESULT;
    }

    private Book getBookDetailsByIsbn(BigDecimal isbn){
       return bookService.getBookDetailsByIsbn(isbn);
    }

    private Book getBookDetailsByBookId(Integer bookId){
        return bookService.getBookDetailsByBookId(bookId);
    }
}
