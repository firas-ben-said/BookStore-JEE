<%@ page import="com.example.bookstore.model.Book" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: firas
  Date: 11/15/24
  Time: 9:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Confirm</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">

</head>
<body>
<section id="confirmation" class="container mx-auto p-6 mt-8">
  <h2 class="text-3xl font-semibold mb-6">Purchase Confirmation</h2>
  <div class="bg-white p-6 rounded-lg shadow-lg">
    <p class="text-lg font-semibold">Thank you, <%= request.getAttribute("name") %>!</p>
    <p class="text-lg">Your order has been successfully placed. A summary of your purchase is below:</p>

    <div class="mt-4">
      <h3 class="text-xl font-semibold mb-2">Shipping Information:</h3>
      <p><strong>Email:</strong> <%= request.getAttribute("email") %></p>
      <p><strong>Address:</strong> <%= request.getAttribute("address") %></p>
    </div>

    <div class="mt-4">
      <h3 class="text-xl font-semibold mb-2">Order Summary:</h3>
      <ul>
        <%
          List<Book> cartItems = (List<Book>) request.getAttribute("cartItems");
          double totalPrice = 0;
          for (Book book : cartItems) {
            totalPrice += book.getPrice();
        %>
        <li class="flex justify-between items-center mb-2">
          <span><%= book.getTitle() %> - $<%= book.getPrice() %></span>
        </li>
        <%
          }
        %>
      </ul>

      <div class="mt-4 flex justify-between items-center">
        <p class="font-semibold text-xl">Total:</p>
        <p class="font-semibold text-xl">$<%= totalPrice %></p>
      </div>
    </div>

    <div class="mt-6 flex justify-end">
      <button onclick="window.location.href='index.jsp'"
              class="bg-green-500 text-white py-2 px-4 rounded-full hover:bg-green-600">Confirm</button>
    </div>

  </div>
</section>

</body>
</html>
