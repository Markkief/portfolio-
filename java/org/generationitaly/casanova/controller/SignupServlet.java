package org.generationitaly.casanova.controller;

import java.io.IOException;

import org.generationitaly.casanova.enums.Role;
import org.generationitaly.casanova.persistence.entity.User;
import org.generationitaly.casanova.persistence.repository.UserRepository;
import org.generationitaly.casanova.persistence.repositoryImpl.UserRepositoryImpl;
import org.generationitaly.casanova.utils.PasswordEncryptionUtil;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * The servlet is used to sign up a new user. Must have a unique username.
 * GET requests get redirected, only POST requests are used to actually send data
 * 
 * @author Redi Levendi
 * @version 0.1 Initial Version
 */
@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
    private UserRepository userRepo = UserRepositoryImpl.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // TODO Check actual form name with the team
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("register.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            response.sendRedirect("profilo.jsp");
            return;
        }
        // TODO Correctly validate this and careful on the enum
        userRepo.save(new User(
            request.getParameter("username"),
            PasswordEncryptionUtil.encrypt(request.getParameter("pwd")),
            request.getParameter("email"),
            request.getParameter("first_name"),
            request.getParameter("last_name"),
            request.getParameter("phone"),
            Role.valueOf(request.getParameter("role"))
        ));
        response.sendRedirect("landing.jsp");
    }
}
