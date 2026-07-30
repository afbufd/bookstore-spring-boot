@import com.practice.book_store_spring.Book
@param java.util.List<Book> books
@param String activePage

@template.layout(
title = "Reading List Page",
activePage = activePage,
content=@`
    <section class="container-lg bg-light border rounded-5">
        <div class="mx-auto mt-4">
            <div class="mx-auto d-flex flex-column justify-content-center align-items-center" style="max-width: 350px">
                <h1 class="mb-1 mt-1">Reading List</h1>
                <div class="heading-border"></div>
            </div>
            <table class="table table-bordered table-rounded mx-auto mt-4 mb-4" style="max-width: 950px">
                <thead>
                <tr>
                    <th style="width: 12rem;">Title</th>
                    <th class="d-none d-md-table-cell" style="width: 12rem;">Author</th>
                    <th class="text-center d-none d-md-table-cell" style="width: 7rem;">Subject</th>
                    <th class="text-center" style="width: 8rem;">Price</th>
                </tr>
                </thead>
                <tbody>
                @for(Book b : books)
                    <tr>
                        <td class="">
                            <a href="/book_store/edit_book/${b.getId()}" class="btn btn-outline-dark">${b.getTitle()}</a>
                        </td>
                        <td class="d-none d-md-table-cell">
                            ${b.getAuthor()}
                        </td>
                        <td class="text-center d-none d-md-table-cell">
                            ${b.getSubject()}
                        </td>
                        <td class="text-center">
                            ${b.getPrice()}
                        </td>
                    </tr>
                @endfor
                </tbody>
            </table>
                <div class="d-flex flex-column flex-md-row justify-content-center align-items-center gap-3 mb-4">
                    <a href="/book_store/books" class="btn btn-success bg-gradient d-flex align-items-center fs-4"><i class="fa-solid fa-multiply fs-4 d-md-none"></i>Book List</a>
                </div>
        </div>
    </section>
`)
