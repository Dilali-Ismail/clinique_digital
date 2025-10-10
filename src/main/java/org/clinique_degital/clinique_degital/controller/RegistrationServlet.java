package org.clinique_degital.clinique_degital.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.clinique_degital.clinique_degital.dto.UserRegistrationDTO;
import org.clinique_degital.clinique_degital.service.UserService;

import java.io.IOException;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
    UserService userService = new UserService();
    @Override
    public void doGet(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request,response);
    }

    public void doPost(HttpServletRequest request , HttpServletResponse response) throws ServletException , IOException{
        UserRegistrationDTO userRegistrationDTO = new UserRegistrationDTO();

        userRegistrationDTO.setNom(request.getParameter("nom"));
        userRegistrationDTO.setEmail(request.getParameter("password"));
        userRegistrationDTO.setEmail(request.getParameter("email"));
        try {
            userService.register(userRegistrationDTO);
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request , response);
        }catch(Exception e){
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
        }

    }
}
