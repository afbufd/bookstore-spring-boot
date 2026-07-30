@param String prefSubject
@param String activePage
@param String error

@template.layout(
title = "Preferred Subject Page",
activePage = activePage,
content=@`
    <section class="container-lg bg-light border rounded-5">
        <div class="mx-auto mt-4">
            @if("missing".equals(error))
                <div class="alert alert-danger my-3">All fields are required.</div>
            @endif
            <div class="mx-auto d-flex flex-column justify-content-center align-items-center" style="max-width: 350px">
                <h1 class="mb-1 mt-1">Preferred Subject</h1>
                <div class="heading-border"></div>
            </div>
            <form action="/book_store/subject" method="post" class="mt-3 mx-auto p-2"
                  style="max-width: 350px;">
                <div class="mb-4 row align-items-center">
                    <label for="preferredSubject" class="col-md-7 col-form-label">Preferred Subject:</label>
                    <div class="col-md-5">
                        <select class="form-select border border-secondary" id="preferredSubject" name="preferredSubject" required>
                            <option value="${prefSubject}" hidden="hidden" selected >${prefSubject}</option>
                            <option value="Math">Math</option>
                            <option value="CS">CS</option>
                            <option value="History">History</option>
                            <option value="English">English</option>
                        </select>
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
