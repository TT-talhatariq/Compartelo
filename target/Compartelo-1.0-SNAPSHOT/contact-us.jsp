<%@ page contentType="text/html;charset=UTF-8" session="false"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/contact-css.css">
    <script src="https://kit.fontawesome.com/42abd7998b.js" crossorigin="anonymous"></script>
    <title>Contact Us</title>
</head>
<body>
<%
    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>

    <header>
        <div class="title">
            <i class="fas fa-share-alt fa-4x"></i>
            <a href="main.jsp" class="main-page"><p>Compartelo</p></a>
        </div>
        <nav>
            <ul>
                <%
                    if(request.getSession(false) == null){
                %>
                <li><a href="index.jsp">Home</a></li>
                <%
                }
                else {
                %>
                <li><a href="main.jsp">Home</a></li>
                <%
                    }
                %>
                <li><a href="contact-us.jsp">Contact Us</a></li>
                <li><a href="about-us.jsp">About Us</a></li>
                <%
                    if(request.getSession(false) == null){
                %>
                <li><a href="login.jsp" class="highlight">Log in</a></li>
                <%
                }
                else {
                %>
                <li><a href="profile.jsp"><i class="fas fa-user-circle profile" ></i></a></li>
                <%
                    }
                %>
            </ul>
        </nav>
    </header>
   
    <main>
    <!-- Side Bar Form -->
    
   
        <div class="contact-us">
            <h2>Drop Us a Line</h2>
               
                <form action="contact-us" method="post">
                    <label for="name">Full Name</label><br>
                    <input type="text" name="Name" id="Name" placeholder="What's Your Full Name" required><br>
                    <label for="email">Email Address</label><br>
                    <input type="email" name="email" id="Email" placeholder="you@example.com" required><br>
                    <label for="Msg">Message </label><br>
                    <textarea id = "Msg" name="msg" placeholder="Write Your Message" required></textarea><br>
                    <input type="submit" value="Submit" id="button">
                </form>
        </div>

    <!-- Side Pic -->
    <img src="css/images/side1.png">

    </main>
</body>
</html>