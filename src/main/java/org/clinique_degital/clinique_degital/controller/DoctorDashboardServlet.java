package org.clinique_degital.clinique_degital.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/doctor/dashboard")
public class DoctorDashboardServlet  extends HttpServlet {
    public void doGet(HttpServletRequest request , HttpServletResponse res) throws IOException, ServletException {
        request.getRequestDispatcher("/WEB-INF/views/doctor/dashboard.jsp").forward(request,res);
    }
}