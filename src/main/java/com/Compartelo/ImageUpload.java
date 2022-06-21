package com.Compartelo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;

@WebServlet(name = "ImageUpload", value = "/ImageUpload")
@MultipartConfig
public class ImageUpload extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        //File Name from Input
        String file_name = (String) request.getSession().getAttribute("email");
        file_name = file_name.substring(0, file_name.lastIndexOf( "@"));

        //File
        Part filePart = request.getPart("file");

        //Extracting extension of Upload File
        String fileName = filePart.getSubmittedFileName();
        String extension = fileName.substring(fileName.lastIndexOf('.'));

        String f_name = file_name+extension;                //Downloaded File Name

        //Path of File on Server
        String filePath = getServletContext().getRealPath("/" + "images" + File.separator + file_name + extension);


        //File Data & Required Name
        InputStream data = filePart.getInputStream();
        if(extension.equals(".jpg")){
            try {
                upload_file(data, filePath);
                System.out.println(filePath);
                response.sendRedirect("profile.jsp");
            } catch (Exception e) {
                response.sendRedirect("profile.jsp");
                System.out.println("Okay");
            }
        }
        else {
            response.sendRedirect("profile.jsp");
        }

    }
    void upload_file(InputStream is, String path) throws Exception {
        File file = new File(path);
        if(file.exists())
            file.delete();

        byte [] bytes = new byte[is.available()];
        is.read(bytes);
        OutputStream fops = new FileOutputStream(path);
        fops.write(bytes);
        fops.flush();
        fops.close();
    }

}
