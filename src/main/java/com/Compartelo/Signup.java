package com.Compartelo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet(name = "signup", value = "/signup")
public class Signup extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();


        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if(!email.substring(email.indexOf("@")).equals("@pucit.edu.pk") || email.equals("")){
            request.setAttribute("error", "false");
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }


        if(new PersonDAO().is_already_logged(email)){
            {
                request.setAttribute("login", "true");
                request.getRequestDispatcher("index.jsp").forward(request,response);
            }
        }
        PersonInfo personInfo = new PersonInfo(email, password, "", 0);
        new PersonDAO().signup(personInfo);

        request.setAttribute("logged", "done");

        request.getRequestDispatcher("login.jsp").forward(request,response);
        return;

        }

    }