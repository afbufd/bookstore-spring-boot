
const tableBody = document.querySelector("#book-rows")
let currPage = 0;

function renderBooks(list) {
    tableBody.textContent = "";

    for(const book of list){
        const tr = document.createElement("tr");

        const titleCell = document.createElement("td");
        titleCell.textContent=book.title;
        tr.append(titleCell);

        const authorCell = document.createElement("td");
        authorCell.textContent=book.author;
        tr.append(authorCell);

        const subjectCell = document.createElement("td");
        subjectCell.textContent=book.subejct;
        tr.append(subjectCell);

        const priceCell = document.createElement("td");
        priceCell.textContent=`$${book.price.toFixed(2)}`;
        tr.append(priceCell);

        const copiesCell = document.createElement("td");
        const deleteBtn = document.createElement("button");
        deleteBtn.textContent="Delete";
        deleteBtn.addEventListener("click", () => deleteBook(book.id));
        copiesCell.textContent=book.copiesInStock;
        copiesCell.append(deleteBtn);
        tr.append(copiesCell);

        const readList = document.createElement("td");
        const addToReadList = document.createElement("button");
        addToReadList.textContent="ReadList";
        // addToReadList.addEventListener("click", () => addBookToReadList(book.id));
        readList.append(addToReadList);
        tr.append(readList)


        tableBody.append(tr);
    }
}

const prevBtn = document.querySelector("#prev-btn");
const nextBtn = document.querySelector("#next-btn");

async function deleteBook(id){
    try {
        const response = await fetch(`/api/books/${id}`, {method: "DELETE"});
        if(!response.ok) throw new Error(`HTTP ${response.status}`);
        loadBooks(currPage);
    } catch(err){
        console.error("Failed to delete book", err);
        tableBody.textContent="Could not delete book";
    }
}

async function loadBooks(page) {
    try{
        const response = await fetch(`/api/books?page=${page}`);
        if(!response.ok){
            throw new Error(`HTTP ${response.status}`);
        }
        const data = await response.json();
        renderBooks(data.content);

        currPage = data.number;
        prevBtn.disabled=data.first;
        nextBtn.disabled=data.last;
    }catch (e) {
        console.error("Failed to load books", e);
        tableBody.textContent = "Could not load books";
    }
}

prevBtn.addEventListener("click", () => loadBooks(currPage-1));
nextBtn.addEventListener("click", () => loadBooks(currPage+1));

loadBooks(0);