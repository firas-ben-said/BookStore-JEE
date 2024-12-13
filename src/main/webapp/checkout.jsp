<%--
  Created by IntelliJ IDEA.
  User: firas
  Date: 11/15/24
  Time: 9:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Checkout</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>
<section id="checkout" class="container mx-auto p-6 mt-8">
    <h2 class="text-3xl font-semibold mb-6">Checkout</h2>
    <div class="bg-white p-6 rounded-lg shadow-lg">
        <form action="processCheckout" method="post" onsubmit="return validateForm()">
            <div class="mb-4">
                <label for="name" class="block text-sm font-semibold">Full Name</label>
                <input type="text" id="name" name="name" class="w-full p-3 mt-2 border border-gray-300 rounded" required>
            </div>
            <div class="mb-4">
                <label for="email" class="block text-sm font-semibold">Email Address</label>
                <input type="email" id="email" name="email" class="w-full p-3 mt-2 border border-gray-300 rounded" required>
            </div>
            <div class="mb-4">
                <label for="address" class="block text-sm font-semibold">Shipping Address</label>
                <textarea id="address" name="address" class="w-full p-3 mt-2 border border-gray-300 rounded" required></textarea>
            </div>
            <div class="mb-4">
                <button type="submit" class="bg-blue-500 text-white py-2 px-4 rounded hover:bg-blue-600">
                    Complete Purchase
                </button>
            </div>
        </form>
    </div>
</section>

<script>
    function validateForm() {
        var name = document.getElementById('name').value;
        var email = document.getElementById('email').value;
        var address = document.getElementById('address').value;
        var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

        if (!name || !email || !address) {
            alert("All fields are required.");
            return false;
        }
        if (!emailPattern.test(email)) {
            alert("Please enter a valid email address.");
            return false;
        }
        return true;
    }
</script>

</body>
</html>
