<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page errorPage="erreur.jsp" import="java.sql.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="dao.Suppression" %>
<% String url="jdbc:mysql://localhost/mini_projet?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
String driver = "com.mysql.jdbc.Driver";
Class.forName(driver).newInstance();
Connection con=DriverManager.getConnection(url,"root","Zak1998");
PreparedStatement stmt=con.prepareStatement("select * from produits where ProduitID=?;");
String CurrentProduct =  request.getParameter("productID");
stmt.setString(1,CurrentProduct);
ResultSet resultats = stmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://kit.fontawesome.com/1d8b2a613a.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/design1.css">
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
			<a href=''>Déconenxion</a>
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
           <li><a href="Panier.jsp"><i class="fas fa-shopping-cart"></i> Shop</a></li>
            <li><a href="Commandes.jsp"><li><i class="fas fa-shopping-basket"></i> Mes Commandes</a></li>
            <li><a href="Suggerer.jsp"><li><i class="fas fa-lightbulb"></i> Suggérer</a></li>
          </ul>
    </div>
</div>
<br><br>
</div>
<div class="mid" >
<div class="product_left">
<% boolean encore = resultats.next();
while (encore) { %>
<img src="<%=resultats.getString(5)%>" alt='Avatar' style='width:250px;height: 250px;'>
</div>
<div class="product_right">

<h4 style="color:grey;"><%=resultats.getString(3)%></h4><br>
<h2><%=resultats.getString(2)%></h2><br>
<hr style='height: 1px;background-color: #0e8ce4;border:none'><br><br>
<p style='font-size:20px;font-family:sans serif;'><%=resultats.getString(6)%><br><br>
<p style='font-weight:bold;font-size:20px;font-family:sans serif;'>Price : <span id='prix'style='font-weight:bold;font-size:20px;font-family:sans serif;color:#0e8ce4'><%=resultats.getString(4)%></span></p><br>
<label style='font-weight:bold;font-size:20px;font-family:sans serif;'>Quantité :</label>
          <form method='POST' action="AddToCartPath?productID=<%=CurrentProduct%>">   <input id='input'style='font-size:15px;padding:6px;line-height:30px;border: 1px solid #0e8ce4;border-radius:4px;' placeholder='0' type='number' name='quantite'><br><br>
           <button class='submit-btn' name="AddPanier" type='submit' >Ajouter au panier </button></form>
<% encore = resultats.next(); } %>
<br><br>
</div>
</div>

<div>
<% 
stmt.close();
PreparedStatement stmt1=con.prepareStatement("select prenom,commentaire from personnes,commandes where id=PersonID and productID=?");
stmt1.setString(1,CurrentProduct);
ResultSet resultats2 = stmt1.executeQuery();
%>
<% boolean encore1 = resultats2.next();
%>

<h2 style="padding-left:60px;color:balck;">Commentaires</h2>
<br>
<%
while (encore1) { 
if (!resultats2.getString(2).equals("pas de commentaire")){

%>

<h2 style="padding-left:100px;color:#0e8ce4;"><%=resultats2.getString(1)%></h2>
<br>
<p style='border-width:1px;border-color:black;font-size:20px;font-family:sans serif;padding-left:140px;'><%=resultats2.getString(2)%></p>
	<br>
	<%
}
encore1 = resultats2.next(); } %>
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
