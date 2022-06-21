<%@ page contentType="text/html;charset=UTF-8"   session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="css/style_login.css">
    <script src="https://kit.fontawesome.com/42abd7998b.js" crossorigin="anonymous"></script>   
</head>
<body>
<%
    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>
    <script src="javascript/validate_login.js"></script>
    <%
        if(request.getSession(false) != null) {
            response.sendRedirect("main.jsp");
        }
    %>
    <header>
        <div class="title">
            <i class="fas fa-share-alt fa-4x"></i>
            <a href="index.jsp" class="main-page"><p>Compartelo</p></a>
        </div>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="contact-us.jsp">Contact Us</a></li>
                <li><a href="about-us.jsp">About Us</a></li>
                <li><a href="index.jsp" class="highlight">Sign Up</a></li>
            </ul>
        </nav>
    </header>
   
    <h2>Login</h2>
    <div class = "box">
        <form  onsubmit="return validate()"  action = "Controller"  method="post">
        <input type="email" name = "email" class="email" id="email" placeholder="Email" autocomplete="off" required onblur ="validate()">
        <p class="tag_line">Use Official Email ID only</p>

        <input type="password" name = "password" class="password" id="password" placeholder="Password" required>
   
        <input type="submit" value="Login" name="action">
        </form>

        <%
            if( request.getAttribute("error") == "false"){
        %>
            <div class="error" id="error" style="display: block">Invalid Credentials</div>
        <%
            }

        %>

        <%
            if( request.getAttribute("logged") == "done"){
        %>
        <div class="error" id="error" style="display: block">Sign Up Done, Now Get Logged in</div>
        <%
            }

        %>
        <div class="error" id="error"></div> 
    </div>

</body>
</html>