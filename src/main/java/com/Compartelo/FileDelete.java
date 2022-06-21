package com.Compartelo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;

@WebServlet(name = "file-delete", value = "/file-delete")
public class FileDelete extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //Getting Paramters
        String file_name = request.getParameter("filename");
        String category = request.getParameter("category");

        String extension = get_extension(category);         //Extension of File
        String f_name = file_name + extension;                //Downloaded File Name

        //Path of File on Server
        String filePath = request.getServletContext().getRealPath("/" + "files/") + f_name;

        File file = new File(filePath);
        file.delete();
        new FileDAO().delete_file(file_name);

        response.sendRedirect("profile.jsp");
    }
    String get_extension(String category){
        switch (category){
            case "Book":
                return ".pdf";
            case "Slides":
                return".pptx";
            case "Notes":
                return".pdf";
            case "Excel File":
                return".xlsx";
            default:
                return".pdf";
        }
    }
}
