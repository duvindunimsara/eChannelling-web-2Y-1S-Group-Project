<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Appointments</title>
	<link rel="stylesheet" href="css/AvailableAppointment.css">
	<link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"> 
<style> 

.topic p{
margin: 35px 70px 30px 85px;
font-size: 25px;
    font-weight: 600;
}

.cards{
border: 1px solid #ccc;
padding: 15px;
margin: 10px;
width: 320px;
height:280px;
background-color: rgba(30, 224, 224, 0.1);
box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
transition: 0.3s;
display: inline-block;
vertical-align: top;
border-radius: 15px;
font-size:16px;
border: 2px solid #3498db;
}
 	 
.cards:hover {
 box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
 }

.card-container{
margin: 0px 70px 70px 70px;
}
.cards button{
  margin-top:10px;
  display: inline-block;
  padding: 10px 20px;
  background-color: rgb(0, 123, 255, 0.7);; /* Background color */
  color: #fff; /* Text color */
  border: none;
  border-radius: 10px;
  text-align: center;
  text-decoration: none;
  font-size: 16px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.cards button:hover{
background-color: #2980b9;
}
 
 </style>
</head>

<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.Objects" %>

<%
	HttpSession session1 = request.getSession(false);
    String userName = (session1 != null) ? (String) session1.getAttribute("UserName") : null;
%>

<body style="background-image: url('img/white-concrete-wall.jpg');
background-size: cover;
background-repeat: no-repeat;">
   
    <header class="header">
        <div class="hcontainer">
            <nav class="navbar">
               <div class="logo"><a href="#"><img src="img/logo.jpg" alt="logo"></a></div>
               <ul class="nav-links">
                    <li><a href="index.jsp">Home</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropbtn">Services</a>
                        <div class="dropdown-content">
                            <a href="#">Book an Appointment</a>
                            <a href="#">Order Medicine</a>
                        </div>
                    </li>
                    <li><a href="about_us.jsp">About Us</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                </ul>
                <div class="nav-buttons">
                    <% if (userName != null) { %>
                    <a href="displayappointments.jsp" class="sbutton">My Appointments</a>
                    <a href="user_info.jsp" class="sbutton"><%=userName %></a>
                    <a href="logout.jsp" class="sbutton">Logout</a>
                <% } else { %>  	
                    <a href="register.jsp" class="sbutton">Sign Up</a>
                    <a href="login.jsp" class="sbutton">Sign In</a>
                <% } %>
                </div>
            </nav>
        </div>
    </header>
    
    <dev class=topic><p>Search Results</p></dev>
    
<div class=card-container>
<c:forEach var="app" items="${appDetails}">
    
    <c:set var="docName" value="${app.doctorName}"/>
    <c:set var="appId" value="${app.appointmentID}"/>
    <c:set var="spec" value="${app.specialization}"/>
    <c:set var="hosName" value="${app.hospitalName}"/>
    <c:set var="date" value="${app.date}"/>
    <c:set var="time" value="${app.time}"/>
    <c:set var="docCharge" value="${app.doctorCharge}"/>
    
   	<c:url value="PatientDetailsForm.jsp" var="channel">
		<c:param name="docName" value="${app.doctorName}"/>
		<c:param name="appID" value="${app.appointmentID}"/>
		<c:param name="spec" value="${app.specialization}"/>
		<c:param name="hosName" value="${app.hospitalName}"/>
		<c:param name="date" value="${app.date}"/>
		<c:param name="time" value="${app.time}"/>
		<c:param name="charge" value="${app.doctorCharge}"/>
	</c:url>
    
     <div class="cards">
        <h2>Dr.${app.doctorName}</h2>
        <p>Appointment No: ${app.appointmentID}</p>
        <p>Specialization: ${app.specialization}</p>
        <p>Hospital: ${app.hospitalName}</p>
        <p>Session Date: ${app.date}</p>
        <p>Session Start Time: ${app.time}</p>
        <a href="${channel}"><button type="button">Book Now</button></a>
    </div>
</c:forEach>
</div>
<footer class="footer">
        <div class="fcontainer">
            <div class="row">
                <div class="footer-col">
                    <h4>Company</h4>
                    <ul>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Privacy Policies</a></li>
                        <li><a href="#">T & C</a></li>
                        <li><a href="#">Blog</a></li>
                    </ul>
                </div>               
                <div class="footer-col">
                    <h4>Get Help</h4>
                    <ul>
                        <li><a href="#">Contact</a></li>
                        <li><a href="#">FAQ</a></li>
                        <li><a href="#">Live Chat</a></li>
                        <li><a href="#">Refund</a></li>
                    </ul>
                </div>               
 
                <div class="footer-col">
                    <h4>Payment</h4>
                    <div class="payment-links">
                        <a href="#"><i class="fab fa-cc-visa"></i></a>
                        <a href="#"><i class="fab fa-cc-mastercard"></i></a>
                        <a href="#"><i class="fab fa-cc-amex"></i></a>
                        <a href="#"><i class="fab fa-cc-paypal"></i></a>
                    </div>
                </div>
                <div class="footer-col">
                    <h4>follow us</h4>
                    <div class="social-links">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
            </div>
        </div>
                <div class="copyright"> <p>&copy; 2023 E-Channelling</p>
            <p><a href="#"> By NexTech Visionaries</a></p>
        </div>
    </footer>

</body>
</html>
