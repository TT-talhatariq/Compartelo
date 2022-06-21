package com.Compartelo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "change-password", value = "/change-password")
public class ChangePassword extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = (String) request.getSession(false).getAttribute("email");

        String oldPassword = request.getParameter("old");
        String newPassword = request.getParameter("new");

        boolean isCorrected = new PersonDAO().check_password(email, oldPassword);
        if(isCorrected) {
             new PersonDAO().change_password(email, newPassword);
            request.setAttribute("change", "true");
            request.getRequestDispatcher("change-password.jsp").forward(request,response);
        }
        else {
            request.setAttribute("change", "false");
            request.getRequestDispatcher("change-password.jsp").forward(request,response);
        }
    }
}
