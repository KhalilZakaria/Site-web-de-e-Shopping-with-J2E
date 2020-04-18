import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class AddClient extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res)throws
	ServletException, IOException { 
		
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
			try {
				//récupération des données
				String fnom=req.getParameter("nom");
				String fprenom=req.getParameter("prenom");
				String femail=req.getParameter("email");
				String fpassword=req.getParameter("mdp");
				//Connexion à la base de données
				String url="jdbc:mysql://localhost:3306/mini_projet?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
				String driver = "com.mysql.jdbc.Driver";
				Class.forName(driver).newInstance();
				Connection con;
				con=DriverManager.getConnection(url,"root","Zak1998");
				PreparedStatement stmt=con.prepareStatement("insert into personnes(nom,prenom,email,password,isAdmin) values (?,?,?,?,?)");
				//afectation des valeurs
				stmt.setString(1,fnom);
				stmt.setString(2,fprenom);
				stmt.setString(3,femail);
				stmt.setString(4,fpassword);
				stmt.setString(5,"non");
				stmt.executeUpdate();
				stmt.close();
				con.close();
				//redirection
				res.sendRedirect("AffichageAdmin.jsp");
			}catch (Exception e){
				out.println("Erreur : "+e.getMessage()+ " source : "+e.getStackTrace());
			}
	}}
