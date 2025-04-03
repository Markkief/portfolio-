package org.generationitaly.casanova.controller;

import java.io.IOException;

import org.generationitaly.casanova.services.FavouritesService;
import org.generationitaly.casanova.persistence.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/*
 * Removes a listing from the user's favourites
 */
@WebServlet("/unlike")

public class RemoveFavouriteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        String likeId = request.getParameter("likeId");
        FavouritesService service = new FavouritesService();
        service.unfavourite(Integer.parseInt(likeId));
        response.sendRedirect("profile");
    }
}
