package com.practice.book_store_spring;

import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class EditBookController {

    private final BookRepository bookrepo;

    public EditBookController(BookRepository bookrepo) {
        this.bookrepo = bookrepo;
    }

    @GetMapping("/book_store/edit_book/{id}")
    public String editBook(@PathVariable int id,@RequestParam(required = false) String error, Model model){
        return bookrepo.findById(id).map(book -> {
            model.addAttribute("book",book);
            model.addAttribute("error", error);
            model.addAttribute("activePage", "books");
            return "book_store/edit_book";
        }).orElse("redirect:/book_store/books");
    }

    @PostMapping("/edit_book/{id}")
    public String editBook(@Valid Book newBook, BindingResult result, @PathVariable int id){
        return bookrepo.findById(id).map( book -> {
            if(result.hasErrors()){
                return "redirect:/book_store/edit_book/"+id+"?error=missing";
            }
            book.setTitle(newBook.getTitle());
            book.setAuthor(newBook.getAuthor());
            book.setSubject(newBook.getSubject());
            book.setPrice(newBook.getPrice());
            bookrepo.save(book);
            return "redirect:/book_store/books";
        }).orElse("redirect:/book_store/books");
    }
}
