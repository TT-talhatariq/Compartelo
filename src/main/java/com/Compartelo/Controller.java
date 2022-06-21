package com.Compartelo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Controller", value = "/Controller")
public class Controller extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String operation = request.getParameter("action");
        System.out.println(operation);
        switch (operation){
            case "Sign Up":
                request.getRequestDispatcher("signup").forward(request,response);
                break;
            case "Login":
                request.getRequestDispatcher("login").forward(request,response);
                break;
            case "Upload":
                request.getRequestDispatcher("ImageUpload").forward(request,response);
                break;
            case "Delete":
                request.getRequestDispatcher("file-delete").forward(request,response);
                break;
            default:
                response.sendRedirect("login.jsp");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String operation = request.getParameter("action");
        System.out.println(operation);
        switch (operation){
            case "Delete":
                request.getRequestDispatcher("file-delete").forward(request,response);
                break;
            case "search":
                request.getRequestDispatcher("search.jsp").forward(request,response);
                break;
            default:
                response.sendRedirect("login.jsp");
        }
    }
}
