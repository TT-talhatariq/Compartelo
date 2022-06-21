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
    <title>Search</title>
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
                <h2>All Post that Contains<span style="color: red">
                    <%=
                  request.getParameter("search")
                %>
                    </span>
                </h2>
                <div>
                    <a href="main.jsp"><i style="margin : 0" class="fas fa-backward"></i></a>
                    <P style="margin:0">Back</P>
                </div>
            </div>

            <!-- File Section -->
            <div class="files">
                <!-- File Item -->
                <%
                    ArrayList<FileInfo> files = new FileDAO().search(request.getParameter("search"));
                    if(files.size() != 0){
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
                            <p><%
                                out.print(files.get(i).getDownloads());
                            %></p>
                        </div>

                    </div>

                </div>
                <%
                    }
                %>
            </div>
            <%
                    }
                else {
            %>
            <p style="margin: 1rem">No Post found for this word<p>
                    <%
                        }
                    %>
        </div>

    </div>
</main>

</body>
</html>
