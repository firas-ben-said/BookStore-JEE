<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.bookstore.model.Book, com.example.bookstore.BookStorage" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Objects" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Bookstore</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">

<!-- Navbar -->
<nav class="bg-gray-800 p-4">
    <div class="flex justify-between items-center">
        <a href="index.jsp" class="text-white text-2xl font-semibold">Online Bookstore</a>
        <div class="flex space-x-4">
            <a href="index.jsp" class="text-white">Catalog</a>
            <a href="cart.jsp" class="text-white">Cart</a> <!-- Link to the cart page -->
            <a href="checkout.jsp" class="text-white">Checkout</a> <!-- Link to the checkout page -->
            <% if (session.getAttribute("username") != null) { %>

            <a href="logout" class="text-white">Logout</a> <!-- Link to logout -->
            <% } else { %>

            <a href="login.jsp" class="text-white">Sign In</a> <!-- Link to sign-in page -->
            <a href="signup.jsp" class="text-white">Sign Up</a> <!-- Link to sign-up page -->
            <% } %>
        </div>
    </div>
</nav>

<!-- Book Catalog Section -->
<section id="catalog" class="container mx-auto p-6 mt-8">
    <h2 class="text-3xl font-semibold mb-6">Book Catalog</h2>

    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
        <%
            // Retrieve books from the request attribute
            ArrayList<Book> books = BookStorage.getInstance().getBooks();
            if (books != null) {
                for (Book book : books) {
                    String title = book.getTitle();
                    String author = book.getAuthor();
                    double price = book.getPrice();
                    String imageUrl = book.getImageUrl();
        %>

        <div class="bg-white p-4 rounded-lg shadow-lg">
            <img src="<%= imageUrl %>" alt="<%= title %>" class="h-56 object-fit rounded-t-lg mb-4 mx-auto">
            <h3 class="text-xl font-semibold"><%= title %></h3>
            <p class="text-gray-600"><%= author %></p>
            <p class="text-gray-800 font-bold mt-2">$<%= price %></p>
            <form action="addToCart" method="POST" class="inline-block">
                <input type="hidden" name="title" value="<%= title %>">
                <button type="submit" class="mt-4 bg-blue-500 text-white py-2 px-4 rounded-full hover:bg-blue-600">Add to Cart</button>
            </form>
        </div>

        <% }} else { %>
        <p class="text-gray-800">No books available</p>
        <% } %>
    </div>
</section>

</body>
</html>
