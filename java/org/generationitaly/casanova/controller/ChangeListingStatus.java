package org.generationitaly.casanova.controller;

import java.io.IOException;
import org.generationitaly.casanova.enums.ListingStatus;
import org.generationitaly.casanova.services.StatusChangeService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/status")
public class ChangeListingStatus extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        long id = Long.parseLong(request.getParameter("id"));
        ListingStatus status = ListingStatus.valueOf(request.getParameter("newStatus"));
        StatusChangeService service = new StatusChangeService();
        service.update(status, id);
        response.sendRedirect("profile");
    }
}
