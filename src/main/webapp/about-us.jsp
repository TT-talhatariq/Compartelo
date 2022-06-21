<%@ page contentType="text/html;charset=UTF-8"  session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/about-us.css">
    <script src="https://kit.fontawesome.com/42abd7998b.js" crossorigin="anonymous"></script>
    <title>About Us</title>
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
            <a href="#" class="main-page"><p>Compartelo</p></a>
        </div>
        <nav>
            <ul>
                <%
                    if(request.getSession(false)== null){
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
                    if(request.getSession(false)== null){
                %>
                    <li><a href="login.jsp" class="highlight">Log in</a></li>
                <%
                    System.out.println("Main");
                    }
                    else {

                        System.out.println("Not Main");
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
            <h1>About Compartelo</h1>
            
            <h2>Objective</h2>
            <p>
                <strong>Compartelo</strong> is an idea to help students to access & share resources using an effective and reliable plateform
            </p>
            
            <h2>Problem</h2> 
            <p>
                Students Specially, Add drop ones, faced a lot of difficulties when they need material of respective class in which they enrolled themselves.
                They have to contact Teacher or CR. Also juniors faced problems for choosing refrences material for courses
            </p>
            
            <h2>Solution</h2> 
            <p>
                <strong>Compartelo</strong> will help the students by bringing them all on a single plateform. They can share
                study material, notes, books and lectures of courses with all other students of university.
            </p>
             
              
        </div>

    <!-- Side Pic -->
    <img src="css/images/side1.png">

    </main>
</body>
</html>