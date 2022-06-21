
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Application</title>
    <link rel="stylesheet" href="css/application.css">
    <script src="https://kit.fontawesome.com/42abd7998b.js" crossorigin="anonymous"></script>
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
 
    <div id="upload_file">
        <form method="post" action="change-password">
        <div class="top_box">
        <h2>Make Application</h2>
      </div>    

          <div class="detail">
              <p>Old Password</p>
              <p>New Password</p>
          </div>
          <div class="detail_input">
              <input type="text" name="old" required>
              <input type="text" name="new" required>
          </div>
          
          <div class="upload_btn">
            <input type="submit" value="Change Password" name="action">
          </div>
          
        </form>

                <%
                if(request.getAttribute("change") != null){
                if( request.getAttribute("change").equals("false")){
            %>
            <div class="error" id="error" style="display: block">Old Password is Wrong</div>
                <%
                }
                else{
                    %>
            <div class="error" id="error" ></div>
            <%
                }
                if(request.getAttribute("change").equals("true")) {
            %>

            <div class="error" id="error" style="display: block">Password Changed</div>
            <%
                }
                else{
                    %>
            <div class="error" id="error" ></div>
<%
        }
                }
                %>
    </div>
        <div class="back">
            <a href="profile.jsp"><i style="margin : 0" class="fas fa-backward"></i></a>
            <P style="margin:0">Back</P>
        </div>
    
    
    
</body>
</html>