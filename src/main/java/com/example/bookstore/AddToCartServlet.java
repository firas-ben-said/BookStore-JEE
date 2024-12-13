package com.example.bookstore;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import com.example.bookstore.model.Book;
import com.example.bookstore.model.Cart;

@WebServlet(name = "AddToCartServlet", value = "/addToCart")
public class AddToCartServlet extends HttpServlet {

    private BookStorage bookStorage = BookStorage.getInstance();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username != null) {
            // Get the user's cart from the session or create a new one if it doesn't exist
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }

            // Find the book by title and add it to the user's cart
            String title = request.getParameter("title");
            Book book = bookStorage.getBookByTitle(title);
            if (book != null) {
                cart.addBook(book);
            }

            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}
