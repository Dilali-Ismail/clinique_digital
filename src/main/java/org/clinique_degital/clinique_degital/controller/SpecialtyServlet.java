package org.clinique_degital.clinique_degital.controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.clinique_degital.clinique_degital.dto.DepartmentDTO;
import org.clinique_degital.clinique_degital.dto.SpecialtyDTO;
import org.clinique_degital.clinique_degital.model.Department;
import org.clinique_degital.clinique_degital.service.DepartmentService;
import org.clinique_degital.clinique_degital.service.SpecialityService;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

@WebServlet("/admin/specialities/*")
public class SpecialtyServlet extends HttpServlet {
    SpecialityService serviceSp = new SpecialityService();
    DepartmentService departmentService = new DepartmentService();

    public void doGet(HttpServletRequest request , HttpServletResponse response) throws IOException , ServletException {

        String action = request.getPathInfo();
        if(action == null || action.equals("/")){
            request.setAttribute("specialitiesList",serviceSp.AllSpecialities());
            request.getRequestDispatcher("/WEB-INF/views/Admin/speciality-list.jsp").forward(request,response);
        }else if(action.equals("/add") || action.equals("/edit")){

            List<DepartmentDTO> departments = departmentService.allDeparetments();
            request.setAttribute("departments",departments);

            if(action.equals("/edit")){
                UUID id = UUID.fromString(request.getParameter("id"));
                serviceSp.findBydId(id).ifPresent(s -> request.setAttribute("specialty", s));
            }
            request.getRequestDispatcher("/WEB-INF/views/Admin/specialty-form.jsp").forward(request, response);
        }else if(action.equals("/delete")){
            UUID id = UUID.fromString(request.getParameter("id"));
            serviceSp.deleteSpeciality(id);
            response.sendRedirect(request.getContextPath() + "/admin/specialities");;
        }
    }

    public void doPost(HttpServletRequest request , HttpServletResponse response) throws IOException , ServletException{
        SpecialtyDTO specialtyDTO = new SpecialtyDTO();
        String id = request.getParameter("id");
        if(id!= null && !id.isEmpty()){
            specialtyDTO.setId(UUID.fromString(id));
        }
        specialtyDTO.setNom(request.getParameter("nom"));
        specialtyDTO.setDescription(request.getParameter("description"));
        specialtyDTO.setDepartmentId(UUID.fromString(request.getParameter("departmentId")));
        serviceSp.SaveOrUpdate(specialtyDTO);
        response.sendRedirect(request.getContextPath() + "/admin/specialities");

    }
}
