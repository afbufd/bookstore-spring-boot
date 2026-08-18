package com.practice.book_store_spring;

import jakarta.validation.Valid;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/books")
public class BookApiController {
    private final BookRepository bookRepository;

    public BookApiController(BookRepository bookRepository){
        this.bookRepository = bookRepository;
    }

    @GetMapping
    public Page<Book> getBooks(@RequestParam(defaultValue = "0") int page) {
        return bookRepository.findAll(PageRequest.of(page,15));
    }

    @GetMapping("/{id}")
    public ResponseEntity<Book> getBook(@PathVariable int id) {
        return ResponseEntity.of(bookRepository.findById(id));
    }

    @PostMapping
    public ResponseEntity<?> createBook(@Valid @RequestBody Book newBook, BindingResult result) {
        if(result.hasErrors()){
            Map<String, String> errors = new HashMap<>();
            for(FieldError e : result.getFieldErrors()) {
                errors.put(e.getField(), e.getDefaultMessage());
            }
            return ResponseEntity.status(400).body(errors);
        }
        Book savedBook = bookRepository.save(newBook);
        return ResponseEntity.status(201).body(savedBook);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteBook(@PathVariable int id){// pulls the 5 out of the URL
        bookRepository.deleteById(id);// Delete FROM books WHERE id = 5;
        // MySql executes the SQL and row is gone.
        return ResponseEntity.noContent().build();// Method returns 204 with empty body
    }
}
