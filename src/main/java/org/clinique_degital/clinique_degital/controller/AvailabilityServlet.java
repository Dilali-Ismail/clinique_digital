package org.clinique_degital.clinique_degital.controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.clinique_degital.clinique_degital.dto.AvailabilityDTO;
import org.clinique_degital.clinique_degital.model.User;
import org.clinique_degital.clinique_degital.service.AvailabilityService;

import java.io.IOException;
import java.time.LocalDate;
import java.time.YearMonth;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

@WebServlet("/doctor/availability")
public class AvailabilityServlet extends HttpServlet {
    private final AvailabilityService service = new AvailabilityService();
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        User loggeduser = (User) req.getSession().getAttribute("user");
        YearMonth currentMonth;

        try {
            int year = Integer.parseInt(req.getParameter("year"));
            int month = Integer.parseInt(req.getParameter("month"));
            currentMonth = YearMonth.of(year, month);
        }catch (Exception e) {
            currentMonth = YearMonth.now();
        }

        LocalDate startDate = currentMonth.atDay(1);
        LocalDate endDate = currentMonth.atEndOfMonth();

        List<AvailabilityDTO> availabilities = service.getAvaillabilityForDoctor(loggeduser.getId(), startDate, endDate);

        Map<LocalDate, List<AvailabilityDTO>> availabilitiesByDay = availabilities.stream()
                .collect(Collectors.groupingBy(dto -> LocalDate.parse(dto.getJour())));

        Date firstDayAsDate = Date.from(startDate.atStartOfDay(ZoneId.systemDefault()).toInstant());

        req.setAttribute("currentMonth", currentMonth);
        req.setAttribute("availabilitiesByDay", availabilitiesByDay);
        req.setAttribute("daysInMonth", currentMonth.lengthOfMonth());
        req.setAttribute("firstDayOfWeek", startDate.getDayOfWeek().getValue());
        req.setAttribute("firstDayAsDate", firstDayAsDate);
        req.getRequestDispatcher("/WEB-INF/views/doctor/availability-calendar.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User loggedInUser = (User) req.getSession().getAttribute("user");
        String action = req.getParameter("action");
        try{
            if ("delete".equals(action)) {
                // Gérer la suppression
                UUID availabilityId = UUID.fromString(req.getParameter("id"));
                service.deleteAvailability(availabilityId, loggedInUser.getId());
            }else {
                // Gérer la création
                AvailabilityDTO dto = new AvailabilityDTO();
                dto.setDoctorId(loggedInUser.getId());
                dto.setJour(req.getParameter("jour"));
                dto.setHeureDebut(req.getParameter("heureDebut"));
                dto.setHeureFin(req.getParameter("heureFin"));
                dto.setStatut(req.getParameter("statut"));
                service.SaveAvailabilty(dto);
            }
        }catch (Exception e) {
            req.getSession().setAttribute("errorMessage", e.getMessage());
        }

        resp.sendRedirect(req.getContextPath() + "/doctor/availability");
    }

}
