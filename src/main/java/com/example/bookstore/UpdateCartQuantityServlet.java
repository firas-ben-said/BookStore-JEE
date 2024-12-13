package com.example.bookstore;

import com.example.bookstore.model.Book;
import com.example.bookstore.model.Cart;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateCartQuantityServlet", value = "/updateCartQuantity")
public class UpdateCartQuantityServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the book ID and new quantity from the form
        String bookIdStr = request.getParameter("bookId");
        String quantityStr = request.getParameter("quantity");

        // Validate input
        if (bookIdStr != null && quantityStr != null) {
            try {
                int bookId = Integer.parseInt(bookIdStr);
                int newQuantity = Integer.parseInt(quantityStr);

                // Get the cart from the session
                HttpSession session = request.getSession();
                Cart cart = (Cart) session.getAttribute("cart");

                if (cart != null && newQuantity > 0) {
                    // Update the quantity of the book in the cart
                    for (Book book : cart.getBooks()) {
                        if (book.getId() == bookId) {
                            book.setQuantity(newQuantity);
                            break;
                        }
                    }
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        // Redirect back to the cart page
        response.sendRedirect("cart.jsp");
    }
}
