package com.Compartelo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet(name = "login", value = "/login")
public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

            String email = request.getParameter("email");
            String password = request.getParameter("password");

            if(!email.substring(email.indexOf("@")).equals("@pucit.edu.pk") || email.equals("")){
                request.setAttribute("error", "false");
                request.getRequestDispatcher("login.jsp").forward(request,response);
            }


            if(new PersonDAO().login(email, password)) {
                HttpSession session = request.getSession(true);
                session.setAttribute("email", email);
                session.setAttribute("upass", password);
                System.out.println(session.getAttribute("email"));

                response.sendRedirect("main.jsp");
                return;
            }
            else {
                request.setAttribute("error", "false");
                request.getRequestDispatcher("login.jsp").forward(request,response);
            }

        }
    //result
}
