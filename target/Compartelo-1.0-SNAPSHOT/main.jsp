<%@ page import="com.Compartelo.FileInfo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.Compartelo.FileDAO" session="false"  %>
<%--
  Created by IntelliJ IDEA.
  User: talha
  Date: 1/11/2022
  Time: 9:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Compartelo Feed</title>
    <link rel="stylesheet" href="css/main.css" />
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
       <form class="search" action="Controller" >
        <input
          type="text"
          name="search"
          id="search"
          placeholder="Search Books, Notes...."
        />
        <button type="submit" value="search" name="action"><i class="fas fa-search fa-3x"></i></button></a>
   </form>


        <div class="profile">
        <a href="profile.jsp"
          ><i class="fas fa-user-circle fa-3x profile"></i
        ></a>
      </div>
    </header>

    <!-- Main Body -->
    <main>
      <div class="container">
        <div id = "sub-cont">
        <div class="info">
          <h2>All Post</h2>
          <div>
              <i class="fas fa-arrow-circle-up" id="upload"></i>
          <P>Upload</P>
          </div>
        </div>

        <!-- File Section -->
        <div class="files">
            <!-- File Item -->
          <%
            ArrayList<FileInfo> files = new FileDAO().getFiles();
            for(int i=0; i<files.size(); i++){
           %>

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
                <p>
                  <%
                    out.print(files.get(i).getFile_name());
                  %></p>
                <hr>
              </div>

            </div>
            <div class="user-name">
              <p class="icon">👱</p>
              <p><%
                out.print(files.get(i).getUploader_email());
              %></p>
            </div>
            <p><strong>Subject: </strong><%
              out.print(files.get(i).getSubject());
            %></p>
            <p><strong>Date Uploaded: </strong><%
              out.print(files.get(i).getDate());
            %></p>

            <div class="category">
                <p><strong>category: </strong>  <%
                  out.print(files.get(i).getCategory());
                %></p>
                <div class="download">
                    <form action="file-download" method="get">
                        <button type="submit"><i class="fas fa-download fa-1x"></i></button>
                        <input type="hidden" name="filename" value="<%
                        out.print(files.get(i).getFile_name());
                        %>">
                        <input type="hidden" name="category" value="<%
                        out.print(files.get(i).getCategory());
                        %>">
                    </form>
                <p ><%
                  out.print(files.get(i).getDownloads());
                %></p>
                </div>

            </div>

          </div>
            <%
                }
              %>
            </div>
            </div>
           
           
            <div id="upload_file">
              <form method="post" action="file-upload" enctype="multipart/form-data">
              <div class="top_box">
              <h2>Upload File</h2>

              <span class="close">&times;</span>
            </div>
               <div class="file_container">

                <div class="file_name">
                    <p><strong>File Name</strong> (No need to add extention)</p>
                    <input type="text" name="file_name" required>
                </div>
                <div class="description">
                  <p><strong>Description</strong> (Any important detail)</p>
                  <textarea name="description"></textarea>
                </div>
                <div class="detail">
                    <p>Subject</p>
                    <p>Type</p>
                </div>
                <div class="detail_input">
                    <input type="text" name="subject" required>
                       <select name="category" id="type" >
                      <option >Book</option>
                      <option>Notes</option>
                      <option >Slides</option>
                           <option >Excel File</option>
                  </select>
                </div><br>
                <div class="upload_btn">
                  <input type="file" name="file">
                  <input type="submit" value="Upload">
                </div>

              </div>
            </form>
          </div>

        
</div>




    </main>

<!-- Java Script -->
<script>
  // Get the upload
  let modal = document.getElementById("upload_file");

  // Get the button that opens the modal
  let btn = document.getElementById("upload");

  let cont = document.getElementById("sub-cont");
  // When the user clicks the button, open the modal
  // Get the <span> element that closes the modal
let span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal
btn.onclick = function() {
  modal.style.display = "block";
  cont.style.opacity = 0.3;

}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  cont.style.opacity = 1;
  modal.style.display = "none";
}

  // When the user clicks anywhere outside of the modal, close it
  window.onclick = function(event) {
    if (event.target == modal) {
      modal.style.display = "none";
      cont.style.opacity = 1;
    }
  }
  </script>

  </body>
</html>
