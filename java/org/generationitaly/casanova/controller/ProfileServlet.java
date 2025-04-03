package org.generationitaly.casanova.controller;

import java.io.IOException;
import java.util.List;

import org.generationitaly.casanova.enums.Role;
import org.generationitaly.casanova.persistence.dto.UserProfileDTO;
import org.generationitaly.casanova.persistence.entity.Listing;
import org.generationitaly.casanova.persistence.entity.User;
import org.generationitaly.casanova.services.AdminProfileService;
import org.generationitaly.casanova.services.RevisorProfileService;
import org.generationitaly.casanova.services.UserProfileService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * This servlet gathers the data needed in order to renderize the user profile.jsp.
 * It gathers the data and forwards the request to the profile.jsp view.
 * The servlet load different data based on the user's role, but expects
 * the profile.jsp to load only the correct one, dynamically
 * 
 * @author Redi Levendi
 * @version 0.1 Initial Version
 */
@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
        User user =(User) request.getSession().getAttribute("user");
        
        
        if (user == null) {
            response.sendRedirect("login.jsp?error=not authenticated");
            return;
        }

        if (user.getRole() == Role.ADMIN) {
            // Admin
            AdminProfileService profile = new AdminProfileService();
            request.setAttribute("profile", profile.getProfile());
            //RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard-admin.jsp");
            //dispatcher.forward(request, response);
            request.getSession().setAttribute("profile", profile.getProfile());
            response.sendRedirect("dashboard-admin.jsp");
            return;
        } else if (user.getRole() == Role.REVISOR) {
            // Revisor
        	
            RevisorProfileService profile = new RevisorProfileService();
            request.getSession().setAttribute("profile", profile.getProfile());
            //request.setAttribute("profile", profile.getProfile());
            //RequestDispatcher x = request.getRequestDispatcher("dashboard-revisor.jsp");
            response.sendRedirect("dashboard-revisor.jsp");
           // x.forward(request, response)
            return;
        } else if (user.getRole() == Role.STANDARD) {
            UserProfileService profile = new UserProfileService(user.getUsername(), user.getUser_id());
            request.getSession().setAttribute("profile", profile.getProfile());
            response.sendRedirect("profilo.jsp");
            return;            
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("profilo.jsp");
        dispatcher.forward(request, response);

    }

}
