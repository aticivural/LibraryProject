package com.library.controller;

import com.library.model.*;
import com.library.service.AuthorService;
import com.library.service.BookService;
import com.library.service.LoanService;
import com.library.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.annotation.Scope;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

/**
 * Created by vural on 17-Dec-16.
 */

@Controller
@RequestMapping("/secure")
public class UserProcessController {

    @Autowired
    UserService userService;

    @Autowired
    BookService bookService;

    @Autowired
    LoanService loanService;

    @Autowired
    AuthorService authorService;

    @RequestMapping(value = "/userdetails")
    public String userDetails(ModelMap model, HttpSession session){
        User user = (User)session.getAttribute("loggedInUser");
        if (user == null)
            return "redirect:/index";

        model.addAttribute("userForm", new User());
        return "secure/userdetails";
    }

    @RequestMapping(value = "/give")
    public String getProduct(HttpSession session){
        User user = (User)session.getAttribute("loggedInUser");
        if (user == null || user.getStatus() == 0)
            return "redirect:/index";

        return "secure/give";
    }

    @RequestMapping(value = "/take")
    public String takeProduct(HttpSession session){
        User user = (User)session.getAttribute("loggedInUser");
        if (user == null || user.getStatus() == 0)
            return "redirect:/index";

        return "secure/take";
    }

    @RequestMapping(value = "/save")
    public String save(HttpSession session, ModelMap model){
        User user = (User)session.getAttribute("loggedInUser");
        if (user == null || user.getStatus() != 2)
            return "redirect:/index";

        model.addAttribute("bookForm", new Book());
        //model.addAttribute("authorForm", new Author());
        return "secure/save";
    }

//    for publishDate
    @InitBinder
    public void dataBinding(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, "publishDate", new CustomDateEditor(dateFormat, true));
    }

    @RequestMapping(value = "/saveoperation", method = RequestMethod.POST)
    public String saveProduct(HttpSession session, @Valid @ModelAttribute("bookForm") Book book, BindingResult result, ModelMap model){

        User loggedInUser = (User)session.getAttribute("loggedInUser");
        if (loggedInUser == null || loggedInUser.getStatus() != 2)
            return "redirect:/index";

        if (result.hasErrors()){
            return "/secure/save";
        }
        int bookResult  = bookService.create(book);

        if (bookResult == 1){
            List<Author> authorList = book.getAuthors();
            if (authorList != null){
                for (Author author : authorList){
                    if (author != null){
                        if (author.getISBN() != null || author.getFirstname().length() > 0 || author.getLastname().length() > 0)
                            authorService.create(author);
                    }
                }
            }
            model.addAttribute("message", "book was saved");
            return "/secure/save";
        }
        model.addAttribute("message", "operation failed");
        return "/secure/save";
    }

    @RequestMapping(value = "/update")
    public String updateProduct(HttpSession session){
        User user = (User)session.getAttribute("loggedInUser");
        if (user == null || user.getStatus() != 2)
            return "redirect:/index";

        return "secure/update";
    }

    @RequestMapping(value = "/updateoperation")
    public String updateOperation(HttpServletRequest request, ModelMap model, HttpSession session){
        User user = (User)session.getAttribute("loggedInUser");
        if (user == null || user.getStatus() != 2)
            return "redirect:/index";

        String bookId = (String)request.getParameter("bookId");
        String approval = (String)request.getParameter("approval");

        Book book = null;

        if (bookId != null){
            if (bookId.trim().length() >0){
                book = bookService.getBookDetailsByBookId(new Integer(bookId));
                if (book == null) {
                    model.addAttribute("message", "book not found");
                    return "/secure/update";
                }
            }
        }
        model.addAttribute("book",book);

        if (approval != null && bookId != null && book != null) {
            String newisbn = request.getParameter("newisbn");
            String newname = request.getParameter("newname");
            String newedition = request.getParameter("newedition");
            String newkind = request.getParameter("newkind");
            String newlanguage = request.getParameter("newlanguage");
            String newpublisher = request.getParameter("newpublisher");
            String newpublishdate = request.getParameter("newpublishdate");
            String newtopictitle = request.getParameter("newtopictitle");
            String newdepartment = request.getParameter("newdepartment");
            String newstoragelocation = request.getParameter("newstoragelocation");

            String newauthorfirstname0 = request.getParameter("newauthorfirstname0");
            String newauthorlastname0 = request.getParameter("newauthorlastname0");

            String newauthorfirstname1 = request.getParameter("newauthorfirstname1");
            String newauthorlastname1 = request.getParameter("newauthorlastname1");

            String newauthorfirstname2 = request.getParameter("newauthorfirstname2");
            String newauthorlastname2 = request.getParameter("newauthorlastname2");

            if (newisbn != null && newisbn.trim().length() >0){
                book.setISBN(new BigDecimal(newisbn));
            }

            if (newname != null && newisbn.trim().length() >0)
                book.setName(newname);

            if (newedition != null && newedition.trim().length() >0)
                book.setEdition(new Integer(newedition));

            if (newkind != null && newkind.trim().length() >0)
                book.setKind(newkind);

            if (newlanguage != null && newlanguage.trim().length() >0)
                book.setLanguage(newlanguage);

            if (newpublisher != null && newpublisher.trim().length() >0)
                book.setPublisher(newpublisher);

            if (newpublishdate != null && newpublishdate.trim().length() >0){
                try {
                    book.setPublishDate(new SimpleDateFormat("yyyy/MM/dd").parse(newpublishdate));
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            }

            if (newtopictitle != null && newtopictitle.trim().length() >0)
                book.setTopicTitle(newtopictitle);

            if (newdepartment != null && newdepartment.trim().length() >0)
                book.setDepartment(newdepartment);

            if (newstoragelocation != null && newstoragelocation.trim().length() >0)
                book.setStorageLocation(newstoragelocation);


            if (newauthorfirstname0 != null && newauthorfirstname0.trim().length() > 0) {
                book.getAuthors().get(0).setFirstname(newauthorfirstname0);
                authorService.update(book.getISBN(),book.getAuthors().get(0));
            }

            if (newauthorlastname0 != null && newauthorlastname0.trim().length() > 0) {
                book.getAuthors().get(0).setLastname(newauthorlastname0);
                authorService.update(book.getISBN(),book.getAuthors().get(0));
            }

            if (newauthorfirstname1 != null && newauthorfirstname1.trim().length() > 0) {
                book.getAuthors().get(1).setFirstname(newauthorfirstname1);
                authorService.update(book.getISBN(),book.getAuthors().get(1));
            }

            if (newauthorlastname1 != null && newauthorlastname1.trim().length() > 0) {
                book.getAuthors().get(1).setLastname(newauthorlastname1);
                authorService.update(book.getISBN(),book.getAuthors().get(1));
            }

            if (newauthorfirstname2 != null && newauthorfirstname2.trim().length() > 0) {
                book.getAuthors().get(2).setFirstname(newauthorfirstname2);
                authorService.update(book.getISBN(),book.getAuthors().get(2));
            }

            if (newauthorlastname2 != null && newauthorlastname2.trim().length() > 0) {
                book.getAuthors().get(2).setLastname(newauthorlastname2);
                authorService.update(book.getISBN(),book.getAuthors().get(2));
            }

            bookService.update(Integer.valueOf(bookId), book);
            model.addAttribute("book", bookService.getBookDetailsByBookId(Integer.valueOf(bookId)));
        }

        return "/secure/update";
    }

    @RequestMapping(value = "/delete")
    public String deleteProduct(HttpSession session){
        User user = (User)session.getAttribute("loggedInUser");
        if (user == null || user.getStatus() != 2)
            return "redirect:/index";

        return "secure/delete";
    }

    @RequestMapping(value = "/deleteoperation")
    public String deleteOperation(HttpServletRequest request, ModelMap model, HttpSession session){

        User loggedInUser = (User)session.getAttribute("loggedInUser");
        if (loggedInUser == null || loggedInUser.getStatus() != 2)
            return "redirect:/index";

        String bookId = request.getParameter("bookId");
        String approval = request.getParameter("approval");

        Book book = null;

        if (bookId != null){
            if (bookId.trim().length() >0){
                book = bookService.getBookDetailsByBookId(new Integer(bookId));
                if (book == null) {
                    model.addAttribute("message", "book not found");
                    return "/secure/delete";
                }
            }
        }

        model.addAttribute("book",book);

        if(approval != null && bookId != null ){
            if(approval.equals("1")){
                if (book.getLoanStatus() == 1){
                    model.addAttribute("message", "book not available for delete operation");
                    return "/secure/delete";
                }
                boolean result = processDeleteProduct(book);
                if (result == true){
                    model.remove("book");
                    model.addAttribute("message", "book was delete successfully");
                }
                else
                    model.addAttribute("message", "operation failed ");
            }
        }

        return "/secure/delete";
    }

    private boolean processDeleteProduct(Book book){
        if(book.getLoanStatus() == 0){
            if(bookService.delete(book.getBookId()) == 1 )
                return true;
        }
        return false;
    }

    @RequestMapping(value = "/loan")
    public String loanProduct(HttpSession session, ModelMap model){
        User user = (User)session.getAttribute("loggedInUser");
        if (user == null || user.getStatus() != 0)
            return "redirect:/index";

        HashSet<History> loanHistories =  bookService.getLoanHistory(user.getUserId());
        if (loanHistories != null)
            model.addAttribute("loanHistories", loanHistories);

        return "secure/loan";
    }

    @RequestMapping(value = "/loanextension")
    public String loanProductExtension(HttpSession session, ModelMap model, HttpServletRequest request){
        User user = (User)session.getAttribute("loggedInUser");
        if (user == null || user.getStatus() != 0)
            return "redirect:/index";

        String bookId = request.getParameter("bookId");

        processTimeExtension(user.getUserId(), new Integer(bookId));

        HashSet<History> loanHistories =  bookService.getLoanHistory(user.getUserId());
        if (loanHistories != null)
            model.addAttribute("loanHistories", loanHistories);

        return "secure/loan";
    }

    @RequestMapping(value = "/history")
    public String historyProduct(HttpSession session, ModelMap model){
        User user = (User)session.getAttribute("loggedInUser");
        if (user == null || user.getStatus() != 0)
            return "redirect:/index";


        HashSet<History> histories =  bookService.getHistory(user.getUserId());
        if (histories != null)
            model.addAttribute("histories", histories);

        return "secure/history";
    }


    @RequestMapping(value = "/updateInformation")
    public String updateInformation(HttpServletRequest request, HttpSession session){
        User user = (User)session.getAttribute("loggedInUser");
        String mail =(String)request.getParameter("mail");
        String firstname =(String)request.getParameter("firstname");
        String lastname =(String)request.getParameter("lastname");
        String password =(String)request.getParameter("password");

        if (mail.trim().length() > 0)
            user.setMail(mail);

        if (firstname.trim().length() > 0)
            user.setFirstname(firstname);

        if (lastname.trim().length() > 0)
            user.setLastname(lastname);

        if (password.trim().length() > 0)
            user.setPassword(password);

        userService.update(user);

        return "/secure/userdetails";
    }

    @RequestMapping(value = "/giveoperation")
    public String giveOperation(HttpServletRequest request, ModelMap model, HttpSession session){
        User loggedInUser = (User)session.getAttribute("loggedInUser");
        if (loggedInUser == null || loggedInUser.getStatus() == 0)
            return "redirect:/index";

        String mail = (String)request.getParameter("mail");
//        String isbn = (String)request.getParameter("isbn");
        String bookId = (String)request.getParameter("bookId");
        String approval = (String)request.getParameter("approval");

        User user = null;
        Book book = null;

        if (mail != null){
            if (mail.trim().length() > 0){
                user = userService.display(mail);
            }
        }

        if (bookId != null){
            if (bookId.trim().length() >0){
//                book = bookService.getBookDetailsByIsbn(new BigDecimal(isbn));
                book = bookService.getBookDetailsByBookId(new Integer(bookId));
            }
        }

        model.addAttribute("user",user);
        model.addAttribute("book",book);

        if(approval != null && bookId != null && user != null && book != null ){
            if(approval.equals("1")){
                boolean result = processGiveProduct(user.getUserId(), bookId, book);
                if (result == true){
                    model.addAttribute("book",bookService.getBookDetailsByBookId(new Integer(bookId)));
                    model.addAttribute("message", "book was gave successfully");
                }
                else
                    model.addAttribute("message", "operation failed ");
            }
        }



        return "secure/give";
    }

    private boolean processGiveProduct(int userId, String bookId, Book bookk){
        Book book = bookService.getBookDetailsByBookId(new Integer(bookId));
        if(book.getLoanStatus() == 0){
            loanService.create(userId, bookId, bookk);
            book.setLoanStatus(1);
//            bookService.changeBookStatus(isbn);
            bookService.update(new Integer(bookId), book);
            return true;
        }
        else
            return false;
    }

    @RequestMapping(value = "/takeoperation")
    public String takeOperation(HttpServletRequest request, ModelMap model, HttpSession session){
        User loggedInUser = (User)session.getAttribute("loggedInUser");
        if (loggedInUser == null || loggedInUser.getStatus() == 0)
            return "redirect:/index";

//        String isbn = (String)request.getParameter("isbn");
        String bookId = (String)request.getParameter("bookId");
        String approval = (String)request.getParameter("approval");

        User user = null;
        Book book = null;
        Loan loan = null;

        if (bookId != null){
            if (bookId.trim().length() >0){
                book = bookService.getBookDetailsByBookId(new Integer(bookId));
                if (book == null) {
                    model.addAttribute("message", "book not found");
                    return "secure/take";
                }
                loan = loanService.get(bookId);
                if (loan != null)
                    user = userService.getUserById(loan.getUserId());
            }
        }

        model.addAttribute("user",user);
        model.addAttribute("book",book);

        if(approval != null && bookId != null && user != null ){
            if(approval.equals("1")){
                boolean result = processTakeProduct(book, loan, user);
                if (result == true){
                    model.addAttribute("book",bookService.getBookDetailsByBookId(new Integer(bookId)));
                    model.remove("user");
                    model.addAttribute("message", "book was taken successfully");
                }
                else
                    model.addAttribute("message", "operation failed ");
            }
        }

        return "secure/take";
    }

    private boolean processTakeProduct(Book book, Loan loan, User user){
        if(book.getLoanStatus() == 1){
            if( loanService.setDeliveryDate(loan.getBookId().toString(), user.getUserId()) == 1 ){
                bookService.changeBookStatus(Integer.valueOf(book.getBookId()).toString());
                return true;
            }
            else
                return false;
        }
        else
            return false;
    }

    private boolean processTimeExtension(int userId, Integer bookId){
        return (bookService.timeExtension(userId, bookId) == 1);
    }


    @RequestMapping(value = "/authorise")
    public String authorise(HttpSession session){
        User loggedInUser = (User)session.getAttribute("loggedInUser");
        if (loggedInUser == null || loggedInUser.getStatus() != 2)
            return "redirect:/index";

        /*if (user != null && message != null){
            model.addAttribute("user",user);
            model.addAttribute("message", message);
        }*/

        return "/secure/authorise";
    }


    @RequestMapping(value = "/authoriseoperation", method = RequestMethod.POST)
    public String authoriseOperation(HttpServletRequest request, ModelMap model, HttpSession session){
        User loggedInUser = (User)session.getAttribute("loggedInUser");
        if (loggedInUser == null || loggedInUser.getStatus() != 2)
            return "redirect:/index";


        String mail = (String)request.getParameter("mail");
        String accessLevel = (String)request.getParameter("accesslevel");
        String approval = (String)request.getParameter("approval");

        User user = null;

        if (mail == null){
            model.addAttribute("message", "user not found, operation failed");
            return "/secure/authorise";
        }
        else if (mail != null){
            if (mail.trim().length() > 0){
                user = userService.display(mail);
                model.addAttribute("user",user);
            }
        }


        if(approval != null && user != null ){
            if(approval.equals("1")){
                user.setStatus(Integer.valueOf(accessLevel).intValue());
                userService.update(user);

                model.addAttribute("user",userService.getUserById(user.getUserId()));
                model.addAttribute("message", "operation success");
               /* redirectAttributes.addAttribute("user",userService.getUserById(user.getUserId()));
                redirectAttributes.addAttribute("message", "operation success");*/

            }
        }

        return "/secure/authorise";
    }



}

