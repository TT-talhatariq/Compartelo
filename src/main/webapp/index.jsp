<%@ page contentType="text/html;charset=UTF-8" session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="stylesheet" href="css/style_signup.css">
    <script src="https://kit.fontawesome.com/42abd7998b.js" crossorigin="anonymous"></script>
</head>
<body>
    <script src="javascript/validate.js"></script>
    <%
        response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0");
    %>
    <%
        if(request.getSession(false) != null) {
            response.sendRedirect("main.jsp");
        }
    %>
    <header>
        <div class="title">
            <i class="fas fa-share-alt fa-4x"></i>
            <a href="login.jsp" class="main-page"><p>Compartelo</p></a>
        </div>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="contact-us.jsp">Contact Us</a></li>
                <li><a href="about-us.jsp">About Us</a></li>
                <li><a href="login.jsp" class="highlight">Log in</a></li>
            </ul>
        </nav>
    </header>
   
    <h2>Sign up to Join the Community</h2>
    <form onsubmit = "return validate()" action = "Controller" method="post">

        <div class = "box">
        <input type="email" name = "email" class="email" id="email" placeholder="Email" autocomplete="off" required onblur ="validate()">
        <p class="tag_line">Use Official Email ID only</p>

        <input type="password" name = "password" class="password" id="password" placeholder="Password" required minlength="8"  >
        <p class="tag_line">Use 8 or more character </p>
        <input type="password" name = "confirm_password"  class= "con-password" id="confirm-password" placeholder="Confirm Password" required onblur ="validate()"  >
        <p class="tag_line">By clicking Sign up, you agree to our Terms</p>
        <input type="submit" value="Sign Up" name="action">
            <%
                if( request.getAttribute("login") == "true"){
            %>
            <div class="error" id="error" style="display: block">Already Have an Account</div>
            <%
                }

            %>

        <div class="error" id="error"></div> 
    </div>

</form>

</body>
</html>