<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page errorPage="erreur.jsp" import="java.sql.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="dao.Suppression" %>
<% String url="jdbc:mysql://localhost/mini_projet?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
String driver = "com.mysql.jdbc.Driver";
Class.forName(driver).newInstance();
Connection con=DriverManager.getConnection(url,"root","Zak1998");
PreparedStatement stmt=con.prepareStatement("select * from produits where categorie=?;");
stmt.setString(1,"FLOUR");
ResultSet resultats = stmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://kit.fontawesome.com/1d8b2a613a.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/design.css">
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
		String nom;
		
		if ((String) sess.getAttribute("nom") != null) {
			nom = (String) sess.getAttribute("nom");
		}
		String prenom="";
		
		if ((String) sess.getAttribute("prenom") != null) {
			prenom = (String) sess.getAttribute("prenom");
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
<div class="header" >
	<h3 style="color:grey;font:normal 36px 'Open Sans',cursive;margin:0;">Les<span text-vertical:center; style="color:#0e8ce4;font :normal 36px 'Open Sans',cursive;margin:0;padding0;"> Quatres</span></h3>
</div>
<div class="nav_bar">
    <div class="navcontainer">
        <ul> 
            <li class="dropdown">
              
              <a href="javascript:void(0)" class="dropbtn"><i class="fas fa-bars"></i> Categories&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
              <div class="dropdown-content">
                <a href="#FLOUR">FLOUR</a>
                <a href="#SWEETENERS">SWEETENERS</a>
                <a href="#FATS">FATS</a>
                <a href="#LIQUIDS">LIQUIDS</a>
                <a href="#STUFFING">STUFFING</a>
                <a href="#OTHERS">OTHERS</a>
              </div>
            </li>
            
            <li><a href="Panier.jsp"><i class="fas fa-shopping-cart"></i> Shop</a></li>
            <a href="Commandes.jsp"><li><i class="fas fa-shopping-basket"></i> Mes Commandes</a></li>
            <a href="Suggerer.jsp"><li><i class="fas fa-lightbulb"></i> Suggérer</a></li>
          </ul>
    </div>
</div>
<br><br>


<div class="mid">
<div class="leftcolumn"></div>
<div class="rightcolumn">
<div class="row" id="FLOUR">

<h3 style='text-align:center;' >FLOUR</h3>
				<% boolean encore = resultats.next();
while (encore) { %>
	
<a method='POST' href='product.jsp?productID=<%=resultats.getInt(1)%>'><div class='column'>
<div class='card' style='width:150px;height: 200px;'>
<img src="<%=resultats.getString(5)%>" alt='Avatar' style='width:100px;height: 100px;'>
<h3><%=resultats.getString(2)%></h3>
<p><%=resultats.getString(4)%></p> 
 </div>
</div></a>

<% encore = resultats.next(); } %>
</div>

<h3 style='text-align:center;'>SWEETNERS</h3>
<div class="row id="SWEETENERS"">

<%
stmt.close();
PreparedStatement stmt1=con.prepareStatement("select * from produits where categorie=?;");
stmt1.setString(1,"SWEETENERS");
ResultSet resultats2 = stmt1.executeQuery();
%>

<% boolean encore1 = resultats2.next();
while (encore1) { %>
<a method='POST' href='product.jsp?productID=<%=resultats2.getInt(1)%>'><div class='column'>
<div class='card' style='width:150px;height: 200px;'>
<img src="<%=resultats2.getString(5)%>" alt='Avatar' style='width:100px;height: 100px;'>
<h3><%=resultats2.getString(2)%>"</h3>
<p><%=resultats2.getString(4)%></p> 
 </div>
</div></a>
<% encore1 = resultats2.next(); } %>
</div>


<div class="row" id="FATS">
<h3 style='text-align:center;' >FATS</h3>
<%
stmt1.close();
PreparedStatement stmt2=con.prepareStatement("select * from produits where categorie=?;");
stmt2.setString(1,"FATS");
ResultSet resultats3 = stmt2.executeQuery();
%>
<% boolean encore2 = resultats3.next();
while (encore2) { %>
<a method='POST' href='product.jsp?productID=<%=resultats3.getInt(1)%>'><div class='column'>
<div class='card' style='width:150px;height: 200px;'>
<img src="<%=resultats3.getString(5)%>" alt='Avatar' style='width:100px;height: 100px;'>
<h3><%=resultats3.getString(2)%>"</h3>
<p><%=resultats3.getString(4)%></p> 
 </div>
</div></a>
<% encore2 = resultats3.next(); } %>
</div>


<div class="row" id="LIQUIDS">
<h3 style='text-align:center;' >LIQUIDS</h3>
<%
stmt2.close();
PreparedStatement stmt3=con.prepareStatement("select * from produits where categorie=?;");
stmt3.setString(1,"LIQUIDS");
ResultSet resultats4 = stmt3.executeQuery();
%>
<% boolean encore3 = resultats4.next();
while (encore3) { %>
<a method='POST' href='product.jsp?productID=<%=resultats4.getInt(1)%>'><div class='column'>
<div class='card' style='width:150px;height: 200px;'>
<img src="<%=resultats4.getString(5)%>" alt='Avatar' style='width:100px;height: 100px;'>
<h3><%=resultats4.getString(2)%>"</h3>
<p><%=resultats4.getString(4)%></p> 
 </div>
</div></a>
<% encore3 = resultats4.next(); } %>
</div>

<div class="row" id="STUFFING">
<h3 style='text-align:center;' >STUFFING</h3>
<%
stmt3.close();
PreparedStatement stmt4=con.prepareStatement("select * from produits where categorie=?;");
stmt4.setString(1,"STUFFING");
ResultSet resultats5 = stmt4.executeQuery();
%>
<% boolean encore4 = resultats5.next();
while (encore4) { %>
<a method='POST' href='product.jsp?productID=<%=resultats5.getInt(1)%>'><div class='column'>
<div class='card' style='width:150px;height: 200px;'>
<img src="<%=resultats5.getString(5)%>" alt='Avatar' style='width:100px;height: 100px;'>
<h3><%=resultats5.getString(2)%>"</h3>
<p><%=resultats5.getString(4)%></p> 
 </div>
</div></a>
<% encore4 = resultats5.next(); } %>
</div>


<div class="row" id="OTHERS">
<h3 style='text-align:center;' >OTHERS</h3>
<%
stmt4.close();
PreparedStatement stmt5=con.prepareStatement("select * from produits where categorie=?;");
stmt5.setString(1,"OTHERS");
ResultSet resultats6 = stmt5.executeQuery();
%>
<% boolean encore5 = resultats6.next();
while (encore5) { %>
<a method='POST' href='product.jsp?productID=<%=resultats6.getInt(1)%>'><div class='column'>
<div class='card' style='width:150px;height: 200px;'>
<img src="<%=resultats6.getString(5)%>" alt='Avatar' style='width:100px;height: 100px;'>
<h3><%=resultats6.getString(2)%>"</h3>
<p><%=resultats6.getString(4)%></p> 
 </div>
</div></a>
<% encore5 = resultats6.next(); } %>
</div>


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
