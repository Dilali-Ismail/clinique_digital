package org.clinique_degital.clinique_degital.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.clinique_degital.clinique_degital.dto.PatientRegistrationDTO;
import org.clinique_degital.clinique_degital.model.enums.Sang;
import org.clinique_degital.clinique_degital.service.UserService;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
    UserService userService = new UserService();
    @Override
    public void doGet(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/Auth/register.jsp").forward(request,response);
    }

    public void doPost(HttpServletRequest request , HttpServletResponse response) throws ServletException , IOException {
        PatientRegistrationDTO userRegistrationDTO = new PatientRegistrationDTO();

        userRegistrationDTO.setNom(request.getParameter("nom"));
        userRegistrationDTO.setEmail(request.getParameter("email"));
        userRegistrationDTO.setPassword(request.getParameter("password"));
        userRegistrationDTO.setCin(request.getParameter("CIN"));
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String dateNaissanceStr = request.getParameter("naissance");
        Date dateNaissance = null;
        if (dateNaissanceStr != null && !dateNaissanceStr.isEmpty()) {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            try {

                dateNaissance = formatter.parse(dateNaissanceStr);
            } catch (ParseException e) {
                System.err.println("Le format de la date de naissance est invalide : " + dateNaissanceStr);
            }

            userRegistrationDTO.setNaissance(dateNaissance);
            userRegistrationDTO.setAdresse(request.getParameter("Adresse"));
            userRegistrationDTO.setSexe(request.getParameter("sexe"));
            userRegistrationDTO.setTelephone(request.getParameter("Tel"));
            String sangStr = request.getParameter("sang");
            Sang  groupeSanguin = Sang.valueOf(sangStr);
            userRegistrationDTO.setSang(groupeSanguin);


            try {
                userService.register(userRegistrationDTO);
                response.sendRedirect(request.getContextPath() + "/login?success=true");
            } catch (Exception e) {
                request.setAttribute("errorMessage", e.getMessage());
                request.getRequestDispatcher("/WEB-INF/views/Auth/register.jsp").forward(request, response);
            }

        }
    }}
