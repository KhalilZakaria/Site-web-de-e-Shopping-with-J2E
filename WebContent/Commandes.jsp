<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page errorPage="erreur.jsp" import="java.sql.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="dao.Suppression" %>

<%

String url="jdbc:mysql://localhost/mini_projet?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
String driver = "com.mysql.jdbc.Driver";
Class.forName(driver).newInstance();
Connection con=DriverManager.getConnection(url,"root","Zak1998");
PreparedStatement stmt=con.prepareStatement("select ProduitID,Nom_Produit,Categorie,Prix,image_uri,description,quantite from produits,commandes where ProduitID=ProductID and personID=?");

%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://kit.fontawesome.com/1d8b2a613a.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/design2.css">
</head>
<body>
<div class="top_bar">
    <div class="hcontainer">
        <span class="top_bar_info"><img src="images/phone.png"> +2126 50 40 30 20</span>
        <span class="top_bar_info"><img src="images/mail.png"> <a href="mailto:contact@lesQuatres.com">contact@lesQuatres.com</a></span>
        <span class="top_bar_info" style="float:right">
      <%
     int Currentid=0;
     double Somme=0;
		HttpSession sess = request.getSession();
		if ((int) sess.getAttribute("Currentid") != 0) {
			Currentid = (int) sess.getAttribute("Currentid");
		}
		stmt.setInt(1,Currentid);
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
       
            <li><a href="index.jsp"><i class="fas fa-home"></i> Acceuil</a></li>
            <li><a href="panier.jsp"><i class="fas fa-shopping-cart"></i> Shop</a></li>
            <a href="Commandes.jsp"><li><i class="fas fa-shopping-basket"></i> Mes Commandes</a></li>
              <a href="Suggerer.jsp"><li><i class="fas fa-lightbulb"></i> Suggérer</a></li>
          </ul>
    </div>
</div>
<br><br>
</div>



<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
					<div class="table">
			
						<div class="row header">
							<div class="cell">
								Nom du Produit
							</div>
							<div class="cell">
								Categorie
							</div>
							<div class="cell">
								Prix
							</div>
						
							<div class="cell">
								Quantité
							</div>
							
						</div>
		<% boolean encore = resultats.next();
while (encore) { 

Somme=Somme + Double.valueOf(resultats.getString(4) )*  Double.valueOf(resultats.getString(7) );
%>
						<div class="row">
							<div class="cell" data-title="Full Name">
								<%=resultats.getString(2)%>
							</div>
							<div class="cell" data-title="Age">
								<%=resultats.getString(3)%>
							</div>
							<div class="cell" data-title="Job Title">
								<%=resultats.getString(4)%>
							</div>
							
							<div class="cell" data-title="Location">
								<%=resultats.getString(7)%>
							</div>
						</div>
<% encore = resultats.next(); } %>
				
					</div>
			</div>

<br><br>

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
