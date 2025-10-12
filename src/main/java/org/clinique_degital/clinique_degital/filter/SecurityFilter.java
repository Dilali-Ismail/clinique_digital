package org.clinique_degital.clinique_degital.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.clinique_degital.clinique_degital.model.User;
import org.clinique_degital.clinique_degital.model.enums.Role;

import java.io.IOException;
import java.util.logging.LogRecord;

@WebFilter(urlPatterns = {"/admin/*", "/patient/*", "/doctor/*", "/staff/*"})
public class SecurityFilter implements Filter {


    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException{

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        if (session == null || session.getAttribute("user") == null){
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("user");
        String path = httpRequest.getRequestURI();

        if(path.startsWith("/admin/") && user.getRole() != Role.ADMIN){
            httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }
        if(path.startsWith("/patient/") && user.getRole() != Role.PATIENT){
            httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }
        if(path.startsWith("/doctor/") && user.getRole() != Role.DOCTOR){
            httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }
        if(path.startsWith("/staff/") && user.getRole() != Role.STAFF){
            httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        chain.doFilter(request, response);

    }

    public void init(FilterConfig filterConfig) throws ServletException {}


    public void destroy() {}

    public boolean isLoggable(LogRecord logRecord){
        return true;
    }

}
