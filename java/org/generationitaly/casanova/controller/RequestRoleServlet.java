package org.generationitaly.casanova.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import org.generationitaly.casanova.enums.Role;
import org.generationitaly.casanova.persistence.entity.RoleApplication;
import org.generationitaly.casanova.persistence.entity.User;
import org.generationitaly.casanova.persistence.repository.RoleApplicationRepository;
import org.generationitaly.casanova.persistence.repository.UserRepository;
import org.generationitaly.casanova.persistence.repositoryImpl.RoleApplicationRepositoryImpl;
import org.generationitaly.casanova.persistence.repositoryImpl.UserRepositoryImpl;

/**
 * Servlet implementation class RequestRoleServlet
 */
@WebServlet("/requestrole")
public class RequestRoleServlet extends HttpServlet {
	 private UserRepository userRepo = UserRepositoryImpl.getInstance();	
       
   
    public RequestRoleServlet() {
        super();
       
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		if (request.getSession().getAttribute("user") == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		User usr = userRepo.findByUsername(request.getParameter("username"));
		RoleApplication roleapp = new RoleApplication();
		RoleApplicationRepository rp = RoleApplicationRepositoryImpl.getInstance();
		roleapp.setRequested_role(Role.valueOf(request.getParameter("roles").toUpperCase()));
		roleapp.setRequest_status(roleapp.getRequest_status().PENDING);
		roleapp.setMessage(request.getParameter("message"));
		roleapp.setUser(usr);
		System.out.println(roleapp.getRequested_role());
		rp.save(roleapp);
		response.sendRedirect("profile");
	}

}
