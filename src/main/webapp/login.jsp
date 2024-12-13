<%--
  Created by IntelliJ IDEA.
  User: firas
  Date: 11/14/24
  Time: 10:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login page</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>


<div class="bg-gray-100 flex justify-center items-center min-h-screen">
    <div class="bg-white p-8 rounded-lg shadow-lg w-full max-w-md">
        <% if (session.getAttribute("loginFailed") != null) { %>
        <h1 class="text-2xl font-semibold text-red-600 mb-6 text-center">Authentication failed!</h1>
        <% } %>
        <h1 class="text-2xl font-semibold text-blue-600 mb-6 text-center">Login</h1>
        <form action="signIn" method="post" class="space-y-4">
            <!-- Username -->
            <div>
                <label for="username" class="block text-gray-700 font-medium mb-1">Username:</label>
                <input type="text"
                       id="username"
                       name="username"
                       placeholder="Enter your username"
                       class="w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
                       required>
            </div>

            <!-- Password -->
            <div>
                <label for="password" class="block text-gray-700 font-medium mb-1">Password:</label>
                <input type="password"
                       id="password"
                       name="password"
                       placeholder="Enter your password"
                       class="w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
                       required>
            </div>

            <!-- Submit Button -->
            <button type="submit"
                    class="w-full bg-blue-500 text-white py-2 rounded-md hover:bg-blue-600 transition duration-200">
                Login
            </button>
            <div class="text-center mt-4">
                <a href="forgotPassword.jsp" class="text-blue-500 hover:underline">Forgot Password?</a>
            </div>
        </form>
    </div>
</body>
</html>
