package com.Compartelo;

public class FileInfo {
    private String uploader_email;
    private String file_name;
    private String description;
    private String subject;
    private String category;
    private int downloads;
    private String date;
    FileInfo(String email, String name, String des, String sub, String cat, int dow, String date){
        this.uploader_email = email;
        file_name = name;
        description = des;
        subject = sub;
        category = cat;
        downloads = dow;
        this.date = date;
    }
    public String getUploader_email() {
        return uploader_email;
    }

    public String getFile_name() {
        return file_name;
    }

    public String getDescription() {
        return description;
    }

    public String getSubject() {
        return subject;
    }

    public String getCategory() {
        return category;
    }

    public int getDownloads() {
        return downloads;
    }

    public String getDate() {
        return date;
    }


}
