package com.Compartelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class FileDAO {
    Connection con;

    public FileDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/compartelo";
            con = DriverManager.getConnection(url, "root", "root");
        } catch (Exception e) {
            System.out.println(e);
        }
    }

  public ArrayList<FileInfo> getFiles() {
        ArrayList<FileInfo> files = new ArrayList<>();
        try {
            String query = "SELECT * FROM  uploads";
            PreparedStatement st = con.prepareStatement(query);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String email = rs.getString(1);
                String name = rs.getString(2);
                String des = rs.getString(3);
                String subject = rs.getString(4);
                String category = rs.getString(5);
                int dow = rs.getInt(6);
                String date = String.valueOf(rs.getDate(7));
                files.add(new FileInfo(email, name, des, subject, category, dow, date));

            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return files;
    }
    public ArrayList<FileInfo> user_uploaded(String user_email){

        ArrayList<FileInfo> files = new ArrayList<>();
        try {
            String query = "SELECT * FROM  uploads where  uploader_email = ?";
            PreparedStatement st = con.prepareStatement(query);

            st.setString(1, user_email);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String email = rs.getString(1);
                String name = rs.getString(2);
                String des = rs.getString(3);
                String subject = rs.getString(4);
                String category = rs.getString(5);
                int dow = rs.getInt(6);
                String date = String.valueOf(rs.getDate(7));
                files.add(new FileInfo(email, name, des, subject, category, dow, date));

            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return files;

    }

    boolean upload_file(FileInfo fileInfo) {

        try {
            String query = "insert into uploads (uploader_email, file_name, description, subject, category," +
                    " downloads, uploaded_time) values(?,?,?,?,?,?, CURDATE())";
            PreparedStatement st = con.prepareStatement(query);

            st.setString(1, fileInfo.getUploader_email());
            st.setString(2, fileInfo.getFile_name());
            st.setString(3, fileInfo.getDescription());
            st.setString(4, fileInfo.getSubject());
            st.setString(5, fileInfo.getCategory());
            st.setInt(6, fileInfo.getDownloads());

            int rs = st.executeUpdate();
            if(rs > 0)
                return true;
            else
                return false;


        }
        catch(Exception e){
            System.out.println(e);
        }

        return false;
    }
    void downloads_update(String file_name) {
        try {

            String query = "SELECT * FROM uploads WHERE file_name = ?";

            PreparedStatement st = con.prepareStatement(query);

            st.setString(1, file_name);

            ResultSet rs = st.executeQuery();
            rs.next();
            int download = rs.getInt(6)+1;

            String update_query = "UPDATE uploads SET downloads = ?  WHERE file_name = ?";

            st = con.prepareStatement(update_query);
            st.setInt(1, download);
            st.setString(2, file_name);

            int upload = st.executeUpdate();
            if(upload>0){
                System.out.println("Updated");}
           }
        catch (Exception e){
            e.printStackTrace();
        }
    }
    void delete_file(String file_name){
        try {
            String query = "DELETE FROM uploads WHERE file_name = ?";

            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, file_name);

            st.executeUpdate();
            }
        catch (Exception e){
            e.printStackTrace();
        }
    }
   public ArrayList<FileInfo> search(String sname){
        ArrayList<FileInfo> files = new ArrayList<>();
        try {
            String query = "SELECT * FROM  uploads where LOWER(file_name) like ?";

            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, "%" + sname.toLowerCase() + "%");
            ResultSet rs = st.executeQuery();
            System.out.println(sname);
            while (rs.next()) {
                String name = rs.getString(2);
                String email = rs.getString(1);
                String des = rs.getString(3);
                String subject = rs.getString(4);
                String category = rs.getString(5);
                int dow = rs.getInt(6);

                String date = String.valueOf(rs.getDate(7));
                files.add(new FileInfo(email, name, des, subject, category, dow, date));

            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return files;
    }

    }

