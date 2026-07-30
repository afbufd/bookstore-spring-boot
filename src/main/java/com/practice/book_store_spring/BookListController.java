package com.practice.book_store_spring;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class BookListController {

    private final BookRepository bookrepo;

    private final HttpSession session;

    public BookListController(BookRepository bookrepo, HttpSession session) {
        this.bookrepo = bookrepo;
        this.session = session;
    }

    @GetMapping("/book_store/books")
    public String listBooks(@RequestParam(required = false) String error,
                            Model model,
                            @CookieValue(value = "prefSubject", required = false) String preferredSubject,
                            @RequestParam(defaultValue = "0") int page){
        Integer count = (Integer) session.getAttribute("bookCount");
        int books = (count == null)? 0 : count;

        model.addAttribute("activePage", "books");
        model.addAttribute("prefSubject", preferredSubject);
        model.addAttribute("booksAdded", books);
        model.addAttribute("error", error);
        Page<Book> bookPage = (preferredSubject != null) ?  bookrepo.findBySubject(preferredSubject, PageRequest.of(page,15))
                                                         :  bookrepo.findAll(PageRequest.of(page,15));
        model.addAttribute("books", bookPage.getContent());
        model.addAttribute("bookPage", bookPage);
        return "book_store/books";
    }

    @PostMapping("/delete_book/{id}")
    public String deleteBook(@PathVariable int id){
        bookrepo.deleteById(id);
        return "redirect:/book_store/books";
    }

    @GetMapping("/book_store/subject")
    public String setSubject(Model model,
                             @CookieValue(value = "prefSubject", required = false) String preferredSubject) {
        model.addAttribute("activePage", "books");
        model.addAttribute("prefSubject", preferredSubject);
        return "book_store/subject";
    }

    @PostMapping("/book_store/subject")
    public String setSubject(@RequestParam String preferredSubject, HttpServletResponse response){
        if(preferredSubject.isBlank()){
            return "redirect:/book_store/subject?error=missing";
        }

        Cookie prefSubject = new Cookie("prefSubject", preferredSubject);
        prefSubject.setMaxAge(60 * 60 * 24 * 30);
        prefSubject.setPath("/");
        response.addCookie(prefSubject);

        return "redirect:/book_store/books";
    }

    @PostMapping("/book_store/add_to_list/{id}")
    public String addBookToList(@PathVariable int id) {

        @SuppressWarnings("unchecked")
        List<Integer> readingList = (List<Integer>) session.getAttribute("readingList");
        if (readingList == null) {
            readingList = new ArrayList<>();
            session.setAttribute("readingList", readingList);
        }
        if(readingList.contains(id)){
            return "redirect:/book_store/books?error=included_in_list";
        }
        readingList.add(id);

        Integer count = (Integer) session.getAttribute("bookCount");
        if(count == null) {
            count = 0;
        }
        session.setAttribute("bookCount", count + 1);

        return "redirect:/book_store/books";
    }

    @GetMapping("/book_store/reading_list")
    public String readingList(Model model){
        @SuppressWarnings("unchecked")
        List<Integer> readingList = (List<Integer>) session.getAttribute("readingList");
        if(readingList == null) {
            readingList = new ArrayList<>();
        }
        model.addAttribute("books", bookrepo.findAllById(readingList));
        model.addAttribute("activePage", "readingList");
        return "book_store/reading_list";
    }

}