<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page errorPage="erreur.jsp" import="java.sql.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="dao.Suppression" %>

<%

String url="jdbc:mysql://localhost/mini_projet?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
String driver = "com.mysql.jdbc.Driver";
Class.forName(driver).newInstance();
Connection con=DriverManager.getConnection(url,"root","Zakaria@1999");
PreparedStatement stmt=con.prepareStatement("select * from suggestions");

%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://kit.fontawesome.com/1d8b2a613a.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/design3.css">
</head>
<body>
<div class="top_bar">
    <div class="hcontainer">
        <span class="top_bar_info"><img src="images/phone.png"> +2126 50 40 30 20</span>
        <span class="top_bar_info"><img src="images/mail.png"> <a href="mailto:contact@lesQuatres.com">contact@lesQuatres.com</a></span>
        <span class="top_bar_info" style="float:right">
      <%
     int Currentid=0;
     
		HttpSession sess = request.getSession();
		if ((int) sess.getAttribute("Currentid") != 0) {
			Currentid = (int) sess.getAttribute("Currentid");
		}
		
		ResultSet resultats = stmt.executeQuery();
		String prenom="";
		
		if ((String) sess.getAttribute("prenom") != null) {
			prenom = (String) sess.getAttribute("prenom");
		}
		String nom;
		
		if ((String) sess.getAttribute("nom") != null) {
			nom = (String) sess.getAttribute("nom");
		}
		
		String email;
		
		if ((String) sess.getAttribute("email") != null) {
			email = (String) sess.getAttribute("email");
		}
		
		if(Currentid ==0){
			%><a href='SignIn.jsp'></a><% 
		}
		else { 
			%><a>Bonjour <%=prenom %></a> 
			<a method='POST' href='DeconnexionPath'>Déconenxion</a>
			<% 
		}
		
      %>
 
      </span>
    </div>
</div>
<div class="header">
   <h3 style="color:grey;font:normal 36px 'Open Sans',cursive;margin:0;">Les<span text-vertical:center; style="color:#0e8ce4;font :normal 36px 'Open Sans',cursive;margin:0;padding0;"> Quatres</span></h3>
</div>
<div class="nav_bar">
    <div class="navcontainer">
        <ul> 
            
            <a href="AffichageAdmin.jsp"><li><i class="fas fa-shopping-basket"></i>Acceuil</a></li>
          </ul>
    </div>
</div>
<br><br>
</div>



<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
			<form method="post" action="AddProductPath">
					<div class="table">
			
						<div class="row header">
						
							<div class="cell">
								Nom du produit
							</div>
							<div class="cell">
								Categorie
							</div>
							<div class="cell">
								image
							</div>
						
							<div class="cell">
								Description
							</div>
							<div class="cell">
								Supprimer
							</div>
							<div class="cell">
								Accepter
							</div>
						</div>
		<% boolean encore = resultats.next();
while (encore) { 
%>
						<div class="row">
							<div class="cell" data-title="Full Name" style="">
								<%=resultats.getString(2)%>
							</div>
							<div class="cell" data-title="Age">
								<%=resultats.getString(3)%>
							</div>
							<div class="cell" data-title="Job Title">
								<img  class="firstname" src="<%=resultats.getString(4)%>" alt='Avatar' style='width:100px;height: 100px;'>
							</div>
							
							<div class="cell" data-title="Location">
								<%=resultats.getString(5)%>
							</div>
							<div class="cell" data-title="Location">
								<input type="submit" name="<%=resultats.getInt(1)%>" value="X">
							</div>
							<div class="cell" data-title="Location">
								<input type="submit" name="<%=resultats.getInt(1)%>" value="Accepter">
							</div>
							
						</div>
<% encore = resultats.next(); } %>
			
					</div>
					</form>
			</div>

<br><br>

		</div>
		<div style="background:#c4d3f6;padding-bottom:30px;" >
	
 <button class='submit-btn' name="Validate" type='submit' style="padding-top:20px;"><a href="signupAdmin.jsp" style="color:white;">Ajouter un nouveau client</a> </button>

		</div>
		
	</div>







</body>
<footer class="footer-distributed">

			<div class="footer-left">

				<h3>Les<span> Quatres</span></h3>

				<p class="footer-links">
					<a href="#" class="link-1">Home</a>
					
					<a href="#">Blog</a>
				
					<a href="#">Pricing</a>
				
					<a href="#">About</a>
					
					<a href="#">Faq</a>
					
					<a href="#">Contact</a>
				</p>

				<p class="footer-company-name">Les Quatres © 2020</p>
			</div>

			<div class="footer-center">

				<div>
					<i class="fa fa-map-marker"></i>
					<p><span>7 km Route Al jadida</span>Casablanca,Morocco</p>
				</div>

				<div>
					<i class="fa fa-phone"></i>
					<p>+212 5 22 40 30 20</p>
				</div>

				<div>
					<i class="fa fa-envelope"></i>
					<p><a href="mailto:support@lesQuatres.com">support@lesQuatres.com</a></p>
				</div>

			</div>

			<div class="footer-right">

				<p class="footer-company-about">
					<span>à Propos</span>
					Lorem ipsum dolor sit amet, consectateur adispicing elit. Fusce euismod convallis velit, eu auctor lacus vehicula sit amet.
				</p>

				<div class="footer-icons">

					<a href="#"><i class="fa fa-facebook"></i></a>
					<a href="#"><i class="fa fa-twitter"></i></a>
					<a href="#"><i class="fa fa-linkedin"></i></a>
					<a href="#"><i class="fa fa-github"></i></a>

				</div>

			</div>

		</footer>
</html>
