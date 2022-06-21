<%@ page import="com.Compartelo.FileInfo" %>
<%@ page import="com.Compartelo.FileDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.Compartelo.PersonDAO" %>
<%@ page import="com.Compartelo.PersonInfo" %>
<%@ page import="java.io.File" %>
<%@ page session="false" errorPage="login.jsp" %>
<%--
  Created by IntelliJ IDEA.
  User: talha
  Date: 1/11/2022
  Time: 11:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <link rel="stylesheet" href="css/profile.css">
    <script
    src="https://kit.fontawesome.com/42abd7998b.js"
    crossorigin="anonymous"
  ></script>
</head>
<body>
<%
    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>
<%
    if(request.getSession(false) == null) {
        response.sendRedirect("login.jsp");
    }
%>
    <header>
        <div class="title">
            <i class="fas fa-share-alt fa-4x"></i>
            <a href="main.jsp" class="main-page"><p>Compartelo</p></a>
        </div>
        <nav>
            <ul>
                <li><a href="main.jsp">Home</a></li>
                <li><a href="contact-us.jsp">Contact Us</a></li>
                <li><a href="about-us.jsp">About Us</a></li>
                <li><a href="Logout" class="highlight">Logout</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <div class="info">
          <div class="name">
            <h1><%
                System.out.println((String) request.getSession().getAttribute("email"));
                String user_email = (String) request.getSession().getAttribute("email");
                out.print(user_email.substring(0,user_email.indexOf('@')).toUpperCase());
            %></h1>
            <p>Date Joined:<strong>
                <%
                    PersonInfo info = new PersonDAO().profile(user_email);
                    out.print(info.getDate());
                %>
            </strong>
            </p>
              <h1><a href="change-password.jsp">Change Password</a></h1>
        </div>
        <div class="image">
        <button  id = "upload">
            <%//Getting Paramters
        String email = (String) request.getSession().getAttribute("email");
        String img_name = email.substring(0,email.lastIndexOf('@'));

        String f_name = img_name + ".jpg";                //Image Name

        //Path of File on Server
        String filePath = request.getServletContext().getRealPath("/" + "images/" )+ f_name;

        File file = new File(filePath);
        if (file.exists()){
         out.print("<img src = \"images\\"+f_name+ "\" alt = \"OK\">");
        }
        else{
            %>
            <img src = "images/user.jpg">
            <%
                }
            %>
        </button>
            <p>Click image to change it</p>
        </div>
            </form>
    </div>
    <div class="container">
        <h2>My Posts</h2>

        <div class="files">
            <%
                ArrayList<FileInfo> files = new FileDAO().user_uploaded((String) request.getSession().getAttribute("email") );
               if(files.size() == 0){
                   out.print("<p style='margin: 2rem;'>Not a single Post yet.</p>");
               }
                for(int i=0; i<files.size(); i++){

            %>

            <!-- File Item -->
          <div class="file-item">
            <div class="file-name">
                <%
                    String category = files.get(i).getCategory();
                    switch (category){
                        case "Book":
                            out.print("<i style=\"color: rgb(255, 51, 51)\" class=\"fas fa-file-pdf fa-3x\"></i>");
                            break;
                        case "Slides":
                            out.print("<i style=\"color: rgb(221, 89, 60)\" class=\"fas fa-file-powerpoint fa-3x\"></i>");
                            break;
                        case "Notes":
                            out.print("<i class=\"fas fa-file-alt fa-3x\"></i>");
                            break;
                        case "Excel File":
                            out.print("<i style=\"color : rgb(47, 182, 110)\" class=\"fas fa-file-excel fa-3x\"></i>");
                            break;
                        default:
                            out.print(" <i class=\"fas fa-file-alt fa-3x\"></i>");
                    }
                %>
              <div class="name">
                <p>  <%
                    out.print(files.get(i).getFile_name());
                %></p>
                <hr>
              </div>
            </div>
    
            <p><strong>Subject: </strong> <%
                out.print(files.get(i).getSubject());
            %></p>
            <p><strong>Date Uploaded: </strong><%
                out.print(files.get(i).getDate());
            %></p>

            <div class="category">
                <p><strong>category: </strong><%
                    out.print(files.get(i).getCategory());
                %></p>
                <form action="Controller" method="post">
                    <button type="submit" value="Delete" name="action"><i class="far fa-trash-alt fa-1x"></i></button>
                    <input type="hidden" name="filename" value="<%
                        out.print(files.get(i).getFile_name());
                        %>">
                    <input type="hidden" name="category" value="<%
                        out.print(files.get(i).getCategory());
                        %>">
                </form>

                </div>

            </div>
            <%
                }%>
          </div>
        <div id="upload_file">
            <form method="post" action="ImageUpload" enctype="multipart/form-data">
                <div class="top_box">
                    <h2>Upload File</h2>
      
                    <span class="close">&times;</span>
                  </div>
                    <p>Must be in .jpg</p>
                    <div class="upload_btn">
                        <input type="file" name="file">
                        <input type="submit" value="Upload">
                    </div>


            </form>
        </div>
        </div>
    </div>
    </main>

<script>
    // Get the upload
    let modal = document.getElementById("upload_file");

    // Get the button that opens the modal
    let btn = document.getElementById("upload");

    // When the user clicks the button, open the modal
    // Get the <span> element that closes the modal
    let span = document.getElementsByClassName("close")[0];

    // When the user clicks the button, open the modal
    btn.onclick = function() {
        modal.style.display = "block";
//        cont.style.opacity = 0.3;

    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
  //      cont.style.opacity = 1;
        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        //    cont.style.opacity = 1;
        }
    }
</script>
    
</body>
</html>