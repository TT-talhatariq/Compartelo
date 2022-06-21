package com.Compartelo;

public class PersonInfo {
        private String email;
        private String password;
        private String date;
        private int img;
        public PersonInfo(String email, String psw, String date, int image){
            this.email  = email;
            this.password = psw;
            this.date = date;
            img = image;
        }
        String getEmail(){
            return email;
        }
        String getPassword(){
            return password;
        }
        public String getDate(){
            return date;
        }
        void setPassword(String pwd){
            this.password = pwd;
        }
}
