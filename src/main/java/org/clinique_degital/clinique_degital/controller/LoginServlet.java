package org.clinique_degital.clinique_degital.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.clinique_degital.clinique_degital.model.User;
import org.clinique_degital.clinique_degital.service.UserService;

import java.io.IOException;
import java.util.Optional;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private final UserService userService = new UserService();

    @Override
    public void doGet(HttpServletRequest request , HttpServletResponse res) throws ServletException , IOException {
        request.getRequestDispatcher("/WEB-INF/views/Auth/login.jsp").forward(request , res);
    }

    public void doPost(HttpServletRequest request , HttpServletResponse res) throws ServletException , IOException{
      String email = request.getParameter("email");
      String password = request.getParameter("password");

        Optional<User> useroptional = userService.login(email,password);

        if(useroptional.isPresent()){

            User user = useroptional.get();

            HttpSession session = request.getSession();
            session.setAttribute("user",user);
            String destinationPage = "/";

            switch (user.getRole()){
                case PATIENT ->{
                    destinationPage = "/patient/dashboard";
                    break;
                }
                case DOCTOR -> {
                    destinationPage = "/doctor/dashboard";
                    break;
                }
                case STAFF -> {
                    destinationPage = "/staff/dashboard";
                    break;
                }
                case ADMIN -> {
                    destinationPage = "/admin/dashboard";
                    break;
                }
            }

            res.sendRedirect(request.getContextPath() + destinationPage);
        }
        else{
            request.setAttribute("errorMessage", "Email ou mot de passe incorrect.");
            request.getRequestDispatcher("/WEB-INF/views/Auth/login.jsp").forward(request, res);
        }
    }

}
