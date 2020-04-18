<%@page errorPage="erreur.jsp" import="java.sql.*"%>
<%@ page import="dao.Suppression" %>
<% String url="jdbc:mysql://localhost/mini_projet?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
String driver = "com.mysql.jdbc.Driver";
Class.forName(driver).newInstance();
Connection con=DriverManager.getConnection(url,"root","Zakaria@1999");
PreparedStatement stmt=con.prepareStatement("select * from personnes;");
ResultSet resultats = stmt.executeQuery();


%>

<html>
<head><title>liste des personnes inscrites</title></head>
<body>

<button><a href="FormulaireAdmin.html">Ajouter un client</a></button>

<br/><br/>
<form method="post" action="Delete">
<table border="1">
<tr><td>Id</td><td>Nom</td><td>Prénom</td><td>email</td><td>password</td><td>isAdmin</td>
<% boolean encore = resultats.next();
while (encore) { %>
<tr>
<td><%=resultats.getInt(1)%></td><td><%=resultats.getString(2) %></td>
<td><%=resultats.getString(3) %></td><td><%=resultats.getString(4)%></td>
<td><%=resultats.getString(5)%></td><td><%=resultats.getString(6)%></td>

<td><input type="submit" name="<%=resultats.getInt(1)%>" value="X"></td>
<td><input type="submit" name="<%=resultats.getInt(1)%>" value="Modifier"></td>
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
