package com.Compartelo;

import java.sql.*;

public class PersonDAO {
    Connection con;
    public PersonDAO(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/compartelo";
            con= DriverManager.getConnection(url,"root","root");
        }
        catch(Exception e){
            System.out.println(e);
        }
    }

    void signup(PersonInfo personInfo){
        try{
            String query="insert into profile (email,password, date ,image) values(?,?,CURDATE(), ?)";
            PreparedStatement  st= con.prepareStatement(query);
            st.setString(1, personInfo.getEmail());
            st.setString(2, personInfo.getPassword());
            st.setInt(3, 0);


            int rs = st.executeUpdate();
            System.out.println(rs);
            if(rs > 0){
                System.out.println("Record inserted successfully.");
            }

            else{
                System.out.println("Record could not inserted.");
            }

        }
        catch(Exception e){
            System.out.println(e);
        }
    }

    boolean login(String email, String password) {
        try {
            String query= "SELECT * FROM PROFILE WHERE email =  ? AND PASSWORD =  ?";

            PreparedStatement st = con.prepareStatement(query);

            st.setString(1, email);
            st.setString(2, password);

            ResultSet rs = st.executeQuery();
            if (rs.next())
                return true;
        }
        catch (Exception e) {
            System.out.println(e);

        }
        return false;
    }
   public PersonInfo profile(String email){
        PersonInfo profile = null;
        try{
            String query= "SELECT * FROM PROFILE WHERE email =  ?";

            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, email);

            ResultSet rs = st.executeQuery();

            rs.next();
            profile = new PersonInfo(rs.getString(1), rs.getString(2), String.valueOf(rs.getDate(3)), rs.getInt(4));

        }
        catch (Exception e){
            System.out.println(e);
        }
    return profile;
    }
    void upload_image(){

    }
   public boolean is_already_logged(String email){
        try {
            String query = "SELECT * FROM PROFILE WHERE email =  ?";

            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, email);

            ResultSet rs = st.executeQuery();

            if(rs.next())
                return true;
            else
                return false;
            }
        catch (Exception e){
            System.out.println(e);
        }
    return false;
    }

    public boolean check_password(String email, String password){
        try {
            String query = "SELECT * FROM PROFILE WHERE email =  ? and password = ?";

            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();

            if(rs.next())
                return true;
            else
                return false;
        }
        catch (Exception e){
            System.out.println(e);
        }

        return true;
    }

    public void change_password(String email, String password) {
        try {
            String query = "UPDATE PROFILE SET PASSWORD = ? WHERE email = ?";

            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, password);
            st.setString(2, email);

            int rs = st.executeUpdate();

        }
        catch (Exception e){
            System.out.println(e);
        }

    }
}
