<%--
  Created by IntelliJ IDEA.
  User: firas
  Date: 11/14/24
  Time: 3:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.bookstore.model.Book, com.example.bookstore.BookStorage" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.bookstore.model.Cart" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart - Online Bookstore</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">

<!-- Navbar -->
<nav class="bg-gray-800 p-4">
    <div class="flex justify-between items-center">
        <a href="index.jsp" class="text-white text-2xl font-semibold">Online Bookstore</a>
        <div class="flex space-x-4">
            <a href="index.jsp" class="text-white">Catalog</a>
            <a href="cart.jsp" class="text-white">Cart</a> <!-- Dynamic cart count -->
            <a href="checkout.jsp" class="text-white">Checkout</a>
            <% if (session.getAttribute("username") != null) { %>

            <a href="logout" class="text-white">Logout</a> <!-- Link to logout -->
            <% } else { %>

            <a href="login.jsp" class="text-white">Sign In</a> <!-- Link to sign-in page -->
            <a href="#signup" class="text-white">Sign Up</a> <!-- Link to sign-up page -->
            <% } %>
        </div>
    </div>
</nav>

<!-- Cart Section -->
<section id="cart" class="container mx-auto p-6 mt-8">
    <%
        Cart debugCart = (Cart) session.getAttribute("cart");
        if (debugCart != null) {
            System.out.println("Cart contents:");
            for (Book b : debugCart.getBooks()) {
                System.out.println("Book ID: " + b.getId() + ", Title: " + b.getTitle());
            }
        } else {
            System.out.println("Cart is null in session");
        }
    %>
    <h2 class="text-3xl font-semibold mb-6">Your Cart</h2>
    <div class="bg-white p-6 rounded-lg shadow-lg">
        <%
            // Retrieve the Cart from the session
            Cart cart = (Cart) session.getAttribute("cart");
            List<Book> books = (cart != null) ? cart.getBooks() : new ArrayList<>();

            if (books.isEmpty()) {
        %>
        <p>Your cart is empty.</p>
        <% } else {
            float totalPrice = 0;
            for (Book book : books) {
                String title = book.getTitle();
                double price = book.getPrice() * book.getQuantity();
                totalPrice += price;
        %>

        <!-- Cart item with quantity update and delete options -->
        <div class="flex justify-between items-center mb-4">
            <h3 class="text-xl font-semibold"><%= title %> (x<%= book.getQuantity() %>)
            </h3>
            <p class="text-gray-800">$<%= price %>
            </p>

            <form action="updateCartQuantity" method="post" class="flex items-center space-x-2">
                <input type="hidden" name="bookId" value="<%= book.getId() %>">
                <input type="number" name="quantity" value="<%= book.getQuantity() %>" min="1"
                       class="w-16 p-1 border border-gray-300 rounded">
                <button type="submit" class="bg-blue-500 text-white py-1 px-2 rounded hover:bg-blue-600">
                    Update
                </button>
            </form>
            <!-- Delete button -->
            <form action="deleteFromCart" method="post">
                <input type="hidden" name="bookId" value="<%= book.getId() %>">
                <button type="submit"
                        class="bg-red-500 text-white py-1 px-2 ml-2 rounded hover:bg-red-600"
                        onclick="console.log('Delete button clicked for book ID: <%= book.getId() %>');">
                    Delete
                </button>
            </form>
        </div>

        <% } %>

        <div class="flex justify-between items-center mt-4 border-t-2 pt-4">
            <p class="font-semibold text-xl">Total:</p>
            <p class="font-semibold text-xl">$<%= totalPrice %>
            </p>
        </div>

        <div class="flex justify-between items-center mt-4">
            <button onclick="window.location.href='index.jsp'"
                    class="bg-gray-300 text-gray-700 py-2 px-4 rounded-full hover:bg-gray-400">Continue Shopping
            </button>
            <button onclick="window.location.href='checkout.jsp'" class="bg-green-500 text-white py-2 px-4 rounded-full hover:bg-green-600">Proceed to Checkout
            </button>
        </div>

        <% } %>
    </div>
</section>

</body>
</html>
