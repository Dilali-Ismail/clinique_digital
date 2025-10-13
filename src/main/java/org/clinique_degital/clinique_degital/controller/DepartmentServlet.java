package org.clinique_degital.clinique_degital.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.clinique_degital.clinique_degital.dto.DepartmentDTO;
import org.clinique_degital.clinique_degital.model.Department;
import org.clinique_degital.clinique_degital.service.DepartmentService;

import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@WebServlet("/admin/departments/*")
public class DepartmentServlet extends HttpServlet {
    private final DepartmentService service = new DepartmentService();

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getPathInfo();
        if(action == null || action.equals("/")) {
            List<DepartmentDTO> departments = service.allDeparetments();
            req.setAttribute("departements", departments);
            req.getRequestDispatcher("/WEB-INF/views/Admin/department-list.jsp").forward(req, resp);
        }else if(action.equals("/add")){
            req.getRequestDispatcher("/WEB-INF/views/Admin/department-form.jsp").forward(req, resp);
        }
    }
    public void doPost(HttpServletRequest request , HttpServletResponse response) throws ServletException , IOException{
         DepartmentDTO dto = new DepartmentDTO();
         dto.setNom(request.getParameter("nom"));
         dto.setDescription(request.getParameter("description"));
         service.saveOrUpdate(dto);
         response.sendRedirect(request.getContextPath() + "/admin/departments");
    }

}

