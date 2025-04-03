package org.generationitaly.casanova.controller;

import java.io.IOException;

import org.generationitaly.casanova.persistence.entity.User;
import org.generationitaly.casanova.persistence.repository.UserRepository;
import org.generationitaly.casanova.persistence.repositoryImpl.UserRepositoryImpl;
import org.generationitaly.casanova.utils.PasswordEncryptionUtil;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * The servlet handles the login. It expects username and password from the frontend and tries to authenticate
 * the user
 * 
 * @author Redi Levendi
 * @version 0.1 Initial Version
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserRepository userRepo = UserRepositoryImpl.getInstance();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User usr = userRepo.findByUsername(request.getParameter("username"));
        if (usr != null && PasswordEncryptionUtil.matches(request.getParameter("password"), usr.getPwd_hash())) {
            HttpSession session = request.getSession();
            session.setAttribute("username", usr.getUsername());
            session.setAttribute("user", usr);
            // TODO Handle redirect after successful login
            response.sendRedirect("profile");
        } else {
            response.sendRedirect("login.jsp?error=wrong credentials");
        }
    }
}
