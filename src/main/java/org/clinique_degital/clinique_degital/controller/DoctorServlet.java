package org.clinique_degital.clinique_degital.controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.clinique_degital.clinique_degital.dto.DoctorDTO;
import org.clinique_degital.clinique_degital.service.DoctorService;
import org.clinique_degital.clinique_degital.service.SpecialityService;

import java.io.IOException;
import java.util.UUID;

@WebServlet("/admin/doctors/*")
public class DoctorServlet extends HttpServlet {
    private final DoctorService doctorService = new DoctorService();
    private final SpecialityService specialtyService = new SpecialityService();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getPathInfo();
        if (action == null || action.equals("/")){
            req.setAttribute("doctors", doctorService.getAllDoctors());
            req.getRequestDispatcher("/WEB-INF/views/Admin/doctor-list.jsp").forward(req, resp);
        }
        else if (action.equals("/add") || action.equals("/edit")) {
            req.setAttribute("specialties", specialtyService.AllSpecialities());

            if(action.equals("/edit")){
                UUID id = UUID.fromString(req.getParameter("id"));
                doctorService.findBydId(id).ifPresent(d -> req.setAttribute("doctor",d ));
            }
            req.getRequestDispatcher("/WEB-INF/views/Admin/doctor-form.jsp").forward(req, resp);
        }else if(action.equals("/delete")){
            UUID id = UUID.fromString(req.getParameter("id"));
            doctorService.deletedoctore(id);
            resp.sendRedirect(req.getContextPath() + "/admin/doctors");
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        DoctorDTO dto = new DoctorDTO();
        String id =req.getParameter("id");
        if(id!= null && !id.isEmpty()){
            dto.setId(UUID.fromString(id));
        }
        dto.setNom(req.getParameter("nom"));
        dto.setEmail(req.getParameter("email"));
        dto.setTitre(req.getParameter("titre"));
        dto.setMatricule(req.getParameter("matricule"));
        dto.setPassword(req.getParameter("password"));
       String specialityId = req.getParameter("specialtyId");
        if(specialityId!= null && !specialityId.isEmpty()){
            dto.setSpecialtyId(UUID.fromString(specialityId));
        }
        dto.setSpecialtyName(req.getParameter("specialityName"));

        try{
            doctorService.saveOrUpdate(dto);
            resp.sendRedirect(req.getContextPath() + "/admin/doctors");
        }catch(Exception e ){
            req.setAttribute("errorMessage", e.getMessage());
            req.setAttribute("specialties", specialtyService.AllSpecialities());
            req.getRequestDispatcher("/WEB-INF/views/Admin/doctor-form.jsp").forward(req, resp);
        }



    }
}
