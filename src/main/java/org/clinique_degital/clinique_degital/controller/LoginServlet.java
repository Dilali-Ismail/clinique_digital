package org.clinique_degital.clinique_degital.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request , HttpServletResponse res) throws ServletException , IOException {
        request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request , res);
    }

}
