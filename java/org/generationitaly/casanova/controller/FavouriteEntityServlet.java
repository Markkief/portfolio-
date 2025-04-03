package org.generationitaly.casanova.controller;

import java.io.IOException;

import org.generationitaly.casanova.services.FavouritesService;
import org.generationitaly.casanova.persistence.entity.User;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/*
 * Adds a listing to the user's favourites
 */
@WebServlet("/like")
public class FavouriteEntityServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
        HttpSession session = request.getSession();

        if (session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String listingId = request.getParameter("listingId");
        User currentUser = (User) session.getAttribute("user");
        FavouritesService service = new FavouritesService();
        service.favourite(Long.parseLong(listingId), currentUser.getUser_id());
        response.sendRedirect("get-listing?id=" + listingId);
    }

}