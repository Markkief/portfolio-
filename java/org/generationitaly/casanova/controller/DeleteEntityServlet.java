package org.generationitaly.casanova.controller;

import java.io.IOException;

import org.generationitaly.casanova.persistence.entity.Immobile;
import org.generationitaly.casanova.persistence.repository.JpaRepository;
import org.generationitaly.casanova.persistence.repositoryImpl.ImmobileRepositoryImpl;
import org.generationitaly.casanova.services.DeleteService;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/*
 * This servlet allows to delete a single listing given it's ID.
 * It expects the ID from the front end in this format:
 * 
 * /api/v0.1/delete/{id}
 * 
 * It has to be an authed request (not implemented yet) 
 * 
 * @author Redi Levendi
 * @version 0.1 Initial Version
 */
@WebServlet("/delete")
public class DeleteEntityServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
        HttpSession session = request.getSession();

        if (session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }


        String entityId = request.getParameter("id");
        DeleteService service = new DeleteService();
        service.delete(entityId);

    }

}
