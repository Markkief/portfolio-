package org.generationitaly.casanova.controller;

import java.io.IOException;

import org.generationitaly.casanova.persistence.entity.Immobile;
import org.generationitaly.casanova.persistence.repository.ImmobileRepository;
import org.generationitaly.casanova.persistence.repositoryImpl.ImmobileRepositoryImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/detailimmobile")
public class DetailEntityServlet extends HttpServlet{

		private ImmobileRepository immobileRepository = ImmobileRepositoryImpl.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getSession().getAttribute("user") == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		
		Long idImmobile =  Long.parseLong(request.getParameter("idimmobile"));
		System.out.println("IMMOBILE" + idImmobile);
		
		 Immobile immobile = immobileRepository.findById(idImmobile);
		 
		 request.setAttribute("immobile", immobile);
		 request.getRequestDispatcher("announcement-info.jsp").forward(request, response);
		
	}
}
