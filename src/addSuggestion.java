import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class addSuggestion extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res)throws
	ServletException, IOException {
	res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		try {
			//récupération des valeurs des champs
			String nomP=req.getParameter("name");
			String catP=req.getParameter("catP");
			String urlP=req.getParameter("urlP");
			String descP=req.getParameter("descP");
			//connexion à la bd
			String url="jdbc:mysql://localhost:3306/mini_projet?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
			String driver = "com.mysql.jdbc.Driver";
			Class.forName(driver).newInstance();
			Connection con;
			con=DriverManager.getConnection(url,"root","Zak1998");
			PreparedStatement stmt=con.prepareStatement("insert into Suggestions(Nom_Produit,Categorie,image_uri,description) values (?,?,?,?)");
			stmt.setString(1,nomP);
			stmt.setString(2,catP);
			stmt.setString(3,urlP);
			stmt.setString(4,descP);
			stmt.executeUpdate();
			stmt.close();
			con.close();
			//après execution vient la redirection
			res.sendRedirect("index.jsp");
	}catch (Exception e){
		out.println("Erreur : "+e.getMessage()+ " source : "+e.getStackTrace());
	}
	}}
