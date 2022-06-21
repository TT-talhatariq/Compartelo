package com.Compartelo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet(name = "file-download", value = "/file-download")
public class FileDownload extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //Getting Paramters
        String file_name = request.getParameter("filename");
        String category = request.getParameter("category");

        String extension = get_extension(category);         //Extension of File
        String f_name = file_name+extension;                //Downloaded File Name

        //Path of File on Server
        String filePath = request.getServletContext().getRealPath("/" + "files/" )+ f_name;

        try {
            download_file(filePath, f_name, response, request);

        } catch (Exception e) {
            e.printStackTrace();
        }
        new FileDAO().downloads_update(file_name);

        System.out.println("Done");
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
    void download_file(String filePath, String f_name, HttpServletResponse response, HttpServletRequest request) throws Exception {

        //Opening Streams for Downloading
        FileInputStream fileInputStream = null;
        OutputStream responseOutputStream = null;
        File file = new File(filePath);

        String mimeType = request.getServletContext().getMimeType(filePath);

        if (mimeType == null) {
            mimeType = "application/octet-stream";
        }

        response.setContentType(mimeType);
        response.addHeader("Content-Disposition", "attachment; filename=" + f_name);
        response.setContentLength((int) file.length());

        fileInputStream = new FileInputStream(file);
        responseOutputStream = response.getOutputStream();

        int bytes;
        while ((bytes = fileInputStream.read()) != -1) {
            responseOutputStream.write(bytes);
        }
        fileInputStream.close();
        responseOutputStream.close();
    }
}
