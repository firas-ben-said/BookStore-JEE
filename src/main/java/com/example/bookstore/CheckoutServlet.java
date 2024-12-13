package com.example.bookstore;

import com.example.bookstore.model.Book;
import com.example.bookstore.model.Cart;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.util.List;

@WebServlet(name = "ProcessCheckoutServlet", value = "/processCheckout")
public class CheckoutServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        // Get the user's cart from session
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        List<Book> books = cart.getBooks();  // Assume Cart has a method to get books

        // Process checkout (you can store order details in a database if necessary)
        // For now, we'll just pass the details to the confirmation page.

        request.setAttribute("name", name);
        request.setAttribute("email", email);
        request.setAttribute("address", address);
        request.setAttribute("cartItems", books);

        // Redirect to the confirmation page
        RequestDispatcher dispatcher = request.getRequestDispatcher("confirmation.jsp");
        dispatcher.forward(request, response);
    }
}
