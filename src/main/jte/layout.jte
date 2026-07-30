@import gg.jte.Content
@param Content content
@param String title
@param String activePage
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
            integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
    />
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
            crossorigin="anonymous"
    />
    <link href="/css/styles.css" rel="stylesheet" />
    <title>${title}</title>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-md navbar-light pt-0 pb-0">
        <div class="@if("books".equals(activePage))container-lg@else container-md @endif bg-nav d-flex align-items-center py-2 py-md-0 px-0 px-md-0">
            <a href="/book_store/books" class="navbar-brand d-flex align-items-center d-md-none fs-3 ps-3">BookStore</a>
            <a href="/book_store/books" class="navbar-brand d-none d-md-flex fs-1 ps-3">BookStore</a>
            <button
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#navbarNav"
                    class="navbar-toggler me-3 fs-4 p-0">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse nav-links w-100" id="navbarNav">
                <ul class="navbar-nav ms-auto gap-0 gap-md-3 fs-5 text-center">
                    <li class="nav-item">
                        <a href="/book_store/books" class="nav-link d-inline-block d-md-none @if("books".equals(activePage))active@endif">
                            <i class="fa-solid fa-book"></i>
                        </a>
                        <a href="/book_store/books" class="nav-link d-none d-md-flex align-items-center @if("books".equals(activePage))active@endif">
                            <i class="fa-solid fa-book me-1"></i>
                            <span class="d-md-flex flex-column pe-3">Books</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
${content}
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
        crossorigin="anonymous"
></script>
</body>
</html>
