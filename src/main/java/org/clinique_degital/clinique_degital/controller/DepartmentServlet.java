package org.clinique_degital.clinique_degital.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.clinique_degital.clinique_degital.dto.DepartmentDTO;
import org.clinique_degital.clinique_degital.model.Department;
import org.clinique_degital.clinique_degital.service.DepartmentService;

import javax.swing.text.html.Option;
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
            req.setAttribute("departments", departments);
            req.getRequestDispatcher("/WEB-INF/views/Admin/department-list.jsp").forward(req, resp);
        }else if(action.equals("/add")){
            req.getRequestDispatcher("/WEB-INF/views/Admin/department-form.jsp").forward(req, resp);
        }else if(action.equals("/edit")){
            UUID uuid = UUID.fromString(req.getParameter("id")) ;
            Optional<DepartmentDTO> department = service.findBydId(uuid);
            department.ifPresent(DepartmentDTO -> req.setAttribute("department",DepartmentDTO));
            req.getRequestDispatcher("/WEB-INF/views/Admin/department-form.jsp").forward(req, resp);
        }else if (action.equals("/delete")) {
            UUID id = UUID.fromString(req.getParameter("id"));
            service.deleteDepartment(id);
            resp.sendRedirect(req.getContextPath() + "/admin/departments");
        }
    }
    public void doPost(HttpServletRequest request , HttpServletResponse response) throws ServletException , IOException{
         DepartmentDTO dto = new DepartmentDTO();
        String idStr = request.getParameter("id");

         dto.setNom(request.getParameter("nom"));
         dto.setDescription(request.getParameter("description"));
        if (idStr != null && !idStr.isEmpty()) {
            dto.setId(UUID.fromString(idStr));
        }
         service.saveOrUpdate(dto);
         response.sendRedirect(request.getContextPath() + "/admin/departments");
    }

}

