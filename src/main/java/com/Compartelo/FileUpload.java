package com.Compartelo;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;

@WebServlet(name = "file-upload", value = "/file-upload")
@MultipartConfig
public class FileUpload extends HttpServlet {

    private static final int DEFAULT_BUFFER_SIZE =8192; ;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.print("Done");

        //File Name from Input
        String file_name = request.getParameter("file_name");

        //File
        Part filePart = request.getPart("file");

        //Extracting extension of Upload File
        String fileName = filePart.getSubmittedFileName();
        String extension = fileName.substring(fileName.lastIndexOf('.'));

        boolean is_rigth_file = is_upload(extension);
        if (is_rigth_file) {

            //File Data & Required Name
            InputStream data = filePart.getInputStream();
            String path = getServletContext().getRealPath("/" + "files" + File.separator + file_name + extension);
            System.out.println(path);
            //Calling File Upload
            try {
                upload_file(data, path);
            } catch (Exception e) {
                e.printStackTrace();
            }

            FileInfo fileInfo = getFileInfo(request);

            boolean is_upload = new FileDAO().upload_file(fileInfo);        //Inserting to DataBase
            response.sendRedirect("main.jsp");
        }
        else {
            response.getWriter().print("<script>" +
                    "alert(\"Files of Such " + extension + " extensions are not eligible to Post \")" +
                    "</script>;");
            response.sendRedirect("main.jsp");
        }
    }
    void upload_file(InputStream is, String path) throws Exception {
        byte [] bytes = new byte[is.available()];
        is.read(bytes);
        OutputStream fops = new FileOutputStream(path);
        fops.write(bytes);
        fops.flush();
        fops.close();
    }

    FileInfo getFileInfo(HttpServletRequest request){
        String file_name = request.getParameter("file_name");
        String desc = request.getParameter("description");
        String category = request.getParameter("category");
        String subject = request.getParameter("subject");
        String uploader_email = (String) request.getSession().getAttribute("email");
        int downloads = 0;
        String date = "";

        FileInfo obj = new FileInfo(uploader_email, file_name, desc, subject, category, downloads, date);
        return obj;
    }

    boolean  is_upload(String extension){
        if(extension.equals(".pdf") || extension.equals(".pptx") || extension.equals(".xlsx"))
            return true;
        else
            return false;
    }
    }


