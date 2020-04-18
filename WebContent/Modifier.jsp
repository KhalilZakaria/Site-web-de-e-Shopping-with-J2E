<%@page errorPage="erreur.jsp" import="java.sql.*"%>
<%
		String id = "";
		
		HttpSession sess = request.getSession();
		if ((String) sess.getAttribute("id") != null) {
		
			id = (String) sess.getAttribute("id");
		}
	%>
<% String url="jdbc:mysql://localhost/mini_projet?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
String driver = "com.mysql.jdbc.Driver";
Class.forName(driver).newInstance();
Connection con=DriverManager.getConnection(url,"root","Zak1998");
PreparedStatement stmt=con.prepareStatement("select * from personnes where id=?;");
stmt.setString(1,id);
ResultSet resultats = stmt.executeQuery();

%>

<html>
<head><title>Modifier un utilisateur</title></head>
<body>

<br/><br/>
<form method="post" action="ModifyPath">
<table border="1">

<% boolean encore = resultats.next();
while (encore) { %>
<tr>
<td>Nom :</td><td><input type=text name="nom" value="<%=resultats.getString(2)%>"></td>
<td>Prenom :</td><td><input type=text name="prenom" value="<%=resultats.getString(3)%>"></td>
<td>Email:</td><td><input type=text name="email" value="<%=resultats.getString(4)%>"></td>
<td>Mot de passe:</td><td><input type=text name="mdp" value="<%=resultats.getString(5)%>"></td>

<td><input type="submit" name="Modifier" value="Modifier"></td>
</tr>
<% encore = resultats.next(); } %>
</table>
</form>
<%
resultats.close();
stmt.close();
con.close();
%>
<a href="accueil.html"> retour à la page d'accueil </a>
</body>
</html>
