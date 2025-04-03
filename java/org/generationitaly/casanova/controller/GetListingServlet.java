package org.generationitaly.casanova.controller;

import java.io.IOException;

import org.generationitaly.casanova.persistence.entity.Listing;
import org.generationitaly.casanova.services.GetService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/get-listing")
public class GetListingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        System.out.println("GetListingServlet");
        Long entityId = Long.parseLong(request.getParameter("id"));
        GetService service = new GetService();
        Listing listing = service.get(entityId);
        request.setAttribute("listing", listing);
        RequestDispatcher dispatcher = request.getRequestDispatcher("announcement-info.jsp");
        dispatcher.forward(request, response);
        
    }

}
