@import com.practice.book_store_spring.Book
@import org.springframework.data.domain.Page

@param java.util.List<Book> books
@param String activePage
@param String prefSubject
@param String error
@param int booksAdded
@param Page<Book> bookPage

@template.layout(
title = "Books Page",
activePage = activePage,
content=@`
<section class="container-lg bg-light border rounded-3 flex-grow-1 flex-md-grow-0 position-relative">
    <ul id="book-list"></ul>
    <%--    @if("missing".equals(error))--%>
<%--        <div class="alert alert-danger my-3">All fields are required.</div>--%>
<%--    @endif--%>
<%--    @if("included_in_list".equals(error))--%>
<%--        <div class="alert alert-danger my-3">This book is already in your list</div>--%>
<%--    @endif--%>
<%--    <div class="px-2 mx-auto mt-3 d-flex justify-content-between align-items-center" style="max-width: 950px">--%>
<%--        <h1 class="mb-0">Book List</h1>--%>
<%--        <div class="d-flex justify-content-center align-items-center gap-3">--%>
<%--            <a href="/book_store/add_book" class="btn btn-secondary">--%>
<%--                <i class="fa-solid fa-plus me-1"></i>--%>
<%--                Add book--%>
<%--            </a>--%>
<%--            <div class="d-flex flex-column justify-content-center align-items-center px-0"><a href="/book_store/subject" class="btn me-1">Preferred Subject:</a><div> ${prefSubject}</div></div>--%>

<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="heading-border-books"></div>--%>
    <table class="table table-bordered table-rounded mx-auto mt-4 mb-4 fs-5" style="max-width: 1100px">
        <thead>
            <tr>
                <th style="width: 14rem;">Title (Click to edit)</th>
                <th class="text-center d-none d-md-table-cell" style="width: 11rem;">Author</th>
                <th class="text-center d-none d-md-table-cell" style="width: 7rem;">Subject</th>
                <th class="text-center" style="width: 8rem;">Price</th>
                <th class="text-center d-none d-md-table-cell" style="width: 12rem;">Available Copies</th>
                <th class="text-center d-none d-md-table-cell" style="width: 11rem;"><i class="fa-solid fa-plus me-1"></i>Reading List</th>
                <th class="text-center d-md-none" style="width: 5rem;"><i class="fa-solid fa-plus"></i></th>
            </tr>
        </thead>
        <tbody id="book-rows">
<%--            @for(Book b : books)--%>
<%--                    <tr>--%>
<%--                        <td class="">--%>
<%--                            <a href="/book_store/edit_book/${b.getId()}" class="btn btn-outline-dark">${b.getTitle()}</a>--%>
<%--                        </td>--%>
<%--                        <td class="text-center d-none d-md-table-cell">--%>
<%--                            ${b.getAuthor()}--%>
<%--                        </td>--%>
<%--                        <td class="text-center d-none d-md-table-cell">--%>
<%--                            ${b.getSubject()}--%>
<%--                        </td>--%>
<%--                        <td class="text-center">--%>
<%--                            ${b.getPrice()}--%>
<%--                            <div><form method="post" action="/delete_book/${b.getId()}" class="d-md-none"><button class="btn btn-danger btn-sm">Delete</button></form></div>--%>
<%--                        </td>--%>
<%--                        <td class="text-center d-none d-md-table-cell">--%>
<%--                            ${b.getCopiesInStock()}--%>
<%--                            <form method="post" action="/delete_book/${b.getId()}"><button class="btn btn-danger btn-sm">Delete</button></form>--%>
<%--                        </td>--%>
<%--                        <td class="text-center px-1">--%>
<%--                            <form method="post" action="/book_store/add_to_list/${b.getId()}" class="d-none d-md-inline-block mt-2 px-0"><button class="btn btn-dark btn-sm py-1"><i class="fa-solid fa-plus me-1"></i> reading list</button></form>--%>
<%--                            <form method="post" action="/book_store/add_to_list/${b.getId()}" class="d-inline-block d-md-none mt-3 px-0"><button class="btn btn-dark btn-sm py-1"><i class="fa-solid fa-plus"></i></button></form>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
<%--            @endfor--%>
        </tbody>
    </table>
    <div class="mb-3">
        <button id="prev-btn">Prev</button>
        <button id="next-btn">Next</button>
    </div>
<%--    <div class="d-flex justify-content-between align-items-center fs-4 mb-3">--%>
<%--        @if(bookPage.hasPrevious())--%>
<%--            <a href="/book_store/books?page=${bookPage.getNumber()-1}" class="btn btn-light btn-outline-dark btn-lg">Prev Page</a>--%>
<%--        @endif--%>
<%--        <div class="d-flex flex-column justify-content-center align-items-center">--%>
<%--            Page ${bookPage.getNumber() + 1}--%>
<%--        </div>--%>
<%--        @if(bookPage.hasNext())--%>
<%--            <a href="/book_store/books?page=${bookPage.getNumber()+1}" class="btn btn-light btn-outline-dark btn-lg">Next Page</a>--%>

<%--        @endif--%>
<%--    </div>--%>

<%--    <div class="d-flex flex-column justify-content-center align-items-center fs-3 mb-3">--%>
<%--        Books Added: ${booksAdded} <a href="/book_store/reading_list" class="btn btn-dark btn-lg mx-2">Reading List</a>--%>
<%--    </div>--%>
</section>
`)
