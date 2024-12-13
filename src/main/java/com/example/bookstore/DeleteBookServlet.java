package com.example.bookstore;

import com.example.bookstore.model.Book;
import com.example.bookstore.model.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/deleteFromCart")  // Simplified mapping
public class DeleteBookServlet extends HttpServlet {
    private final BookStorage bookStorage = BookStorage.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("DeleteBookServlet doPost method called");

        // Print all parameters
        System.out.println("Parameters received:");
        req.getParameterMap().forEach((key, value) -> {
            System.out.println(key + ": " + String.join(", ", value));
        });

        Cart cart = (Cart) req.getSession().getAttribute("cart");
        System.out.println("Cart from session: " + (cart != null ? "found" : "null"));  // Debug print

        try {
            String bookIdStr = req.getParameter("bookId");
            System.out.println("BookId parameter: " + bookIdStr);  // Debug print

            if (bookIdStr != null && !bookIdStr.isEmpty()) {
                int id = Integer.parseInt(bookIdStr);
                Book book = bookStorage.getBookById(id);
                System.out.println("Book found: " + (book != null ? book.getTitle() : "null"));  // Debug print

                if (cart != null && book != null) {
                    cart.removeBook(book);
                    System.out.println("Book removed from cart");  // Debug print
                    req.getSession().setAttribute("cart", cart);  // Make sure to update the session
                }
            }
        } catch (Exception e) {
            System.out.println("Error in DeleteBookServlet: " + e.getMessage());
            e.printStackTrace();
        }

        System.out.println("Redirecting to cart.jsp");  // Debug print
        resp.sendRedirect("cart.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("DeleteBookServlet doGet method called - this should not happen");  // Debug print
        doPost(req, resp);  // Handle GET requests same as POST for debugging
    }
}