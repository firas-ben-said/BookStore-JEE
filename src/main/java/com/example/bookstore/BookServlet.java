package com.example.bookstore;

import com.example.bookstore.model.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/books")
public class BookServlet extends HttpServlet {

    // Create an instance of BookStorage to hold books in memory
    private final BookStorage bookStorage = BookStorage.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the list of books from the BookStorage class
        ArrayList<Book> books = bookStorage.getBooks();

        // Pass the books list to the request attribute for the JSP page
        request.setAttribute("books", books);

        // Forward the request to the JSP page
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
