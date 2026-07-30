package com.practice.book_store_spring;

import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AddBookController {

    private final BookRepository bookrepo;

    public AddBookController(BookRepository bookrepo) {
        this.bookrepo = bookrepo;
    }

    @GetMapping("/book_store/add_book")
    public String addBook(@RequestParam(required = false) String error, Model model) {
        model.addAttribute("activePage", "books");
        model.addAttribute("error", error);

        return "book_store/add_book";
    }

    @PostMapping("/book_store/add_book_form")
    public String addBook(@Valid Book newBook, BindingResult result) {
        if(result.hasErrors()){
            return "redirect:/book_store/add_book?error=missing";
        }
        bookrepo.save(newBook);
        return "redirect:/book_store/books";
    }
}
























