@param String activePage
@param String error

@template.layout(
title = "Add Book Page",
activePage = activePage,
content=@`
    <section class="container-lg bg-light border rounded-5">
        <div class="mx-auto mt-4">
            @if("missing".equals(error))
                <div class="alert alert-danger my-3">All fields are required.</div>
            @endif
            <div class="mx-auto d-flex flex-column justify-content-center align-items-center" style="max-width: 500px">
                <h1 class="mb-1 mt-1">New Books</h1>
                <div class="heading-border"></div>
            </div>
            <form action="/book_store/add_book_form" method="post" class="mt-3 mx-auto p-2"
                  style="max-width: 500px;">
                <div class="mb-3 row align-items-center">
                    <label for="title" class="col-md-5 col-form-label">Title:</label>
                    <div class="col-md-7">
                        <input type="text" class="form-control border border-secondary" id="title" name="title" placeholder="Enter title" required>
                    </div>
                </div>
                <div class="mb-3 row align-items-center">
                    <label for="author" class="col-md-5 col-form-label">Author:</label>
                    <div class="col-md-7">
                        <input type="text" class="form-control border border-secondary" id="author" name="author" placeholder="Enter author" required>
                    </div>
                </div>
                <div class="mb-4 row align-items-center">
                    <label for="subject" class="col-md-5 col-form-label">Subject:</label>
                    <div class="col-md-7">
                        <select class="form-select border border-secondary" id="subject" name="subject" required>
                            <option value="" hidden="hidden" disabled selected >Select Subject Please</option>
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
                        <input type="number" class="form-control border border-secondary" step="0.01" min="0" id="price" name="price" placeholder="0.00" required>
                    </div>
                </div>
                <div class="mb-4 row align-items-center">
                    <label for="copiesInStock" class="col-md-5 col-form-label">Available Copies:</label>
                    <div class="col-md-7">
                        <input type="number" class="form-control border border-secondary" step="1" min="0" id="copiesInStock" name="copiesInStock" placeholder="0" required>
                    </div>
                </div>

                <div class="d-flex flex-column flex-md-row justify-content-center align-items-center gap-3 mb-4">
                    <button class="btn btn-success bg-gradient btn-lg px-3"><i class="fa-solid fa-plus d-md-none me-1"></i>Add Book</button>
                    <a href="/book_store/books" class="btn btn-light d-flex align-items-center fs-4"><i class="fa-solid fa-multiply fs-4 d-md-none"></i> Cancel</a>
                </div>
            </form>
        </div>
    </section>
`)
