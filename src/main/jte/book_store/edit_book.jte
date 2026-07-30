@import com.practice.book_store_spring.Book
@param Book book
@param String activePage
@param String error

@template.layout(
title = "Edit Book Page",
activePage = activePage,
content=@`
    <section class="container-lg bg-light border rounded-5">
        <div class="mx-auto mt-4">
            @if("missing".equals(error))
                <div class="alert alert-danger my-3">All fields are required.</div>
            @endif
            <div class="mx-auto d-flex flex-column justify-content-center align-items-center" style="max-width: 500px">
                <h1 class="mb-1 mt-1">Edit Book</h1>
                <div class="heading-border"></div>
            </div>
            <form action="/edit_book/${book.getId()}" method="post" class="mt-3 mx-auto p-2"
                  style="max-width: 500px;">
                <div class="mb-3 row align-items-center">
                    <label for="title" class="col-md-5 col-form-label">Title:</label>
                    <div class="col-md-7">
                        <input type="text" class="form-control border border-secondary" id="title" name="title" value="${book.getTitle()}" required>
                    </div>
                </div>
                <div class="mb-3 row align-items-center">
                    <label for="author" class="col-md-5 col-form-label">Author:</label>
                    <div class="col-md-7">
                        <input type="text" class="form-control border border-secondary" id="author" name="author" value="${book.getAuthor()}" required>
                    </div>
                </div>
                <div class="mb-4 row align-items-center">
                    <label for="subject" class="col-md-5 col-form-label">Subject:</label>
                    <div class="col-md-7">
                        <select class="form-select border border-secondary" id="subject" name="subject" required>
                            <option value="${book.getSubject()}" hidden="hidden" selected >${book.getSubject()}</option>
                            <option value="Math">Math</option>
                            <option value="CS">CS</option>
                            <option value="History">History</option>
                            <option value="English">English</option>
                        </select>
                    </div>
                </div>
                <div class="mb-4 row align-items-center">
                    <label for="price" class="col-md-5 col-form-label">Price:</label>
                    <div class="col-md-7">
                        <input type="number" class="form-control border border-secondary" step="0.01" min="0" id="price" name="price" value="${book.getPrice()}" required>
                    </div>
                </div>

                <div class="d-flex flex-column flex-md-row justify-content-center align-items-center gap-3 mb-4">
                    <button class="btn btn-success bg-gradient btn-lg px-3"><i class="fa-solid fa-plus d-md-none me-1"></i>Submit</button>
                    <a href="/book_store/books" class="btn btn-light d-flex align-items-center fs-4"><i class="fa-solid fa-multiply fs-4 d-md-none"></i> Cancel</a>
                </div>
            </form>
        </div>
    </section>
`)
