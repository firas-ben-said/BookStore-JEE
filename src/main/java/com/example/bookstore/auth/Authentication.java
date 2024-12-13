package com.example.bookstore.auth;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONArray;
import org.json.*;

@WebServlet(name = "authentication", value = "/signIn")
public class Authentication extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username == null || password == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing required information");
            return;
        }
        // Read the json file
        String credentilsPath = getServletContext().getRealPath("/WEB-INF/credentials.json");
        String credentials = new String(Files.readAllBytes(Paths.get(credentilsPath)));


        JSONObject jsonObject = new JSONObject(credentials);
        JSONArray userArray = jsonObject.getJSONArray("users");

        // check if the credentials are correct
        boolean validUser = false;
        for (int i = 0; i < userArray.length(); i++) {
            JSONObject user = userArray.getJSONObject(i);
            if (user.getString("username").equals(username) && user.getString("password").equals(password)) {
                validUser = true;
                break;
            }
        }

        HttpSession session = request.getSession();
        if (validUser) {
            session.setAttribute("username", username);
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}