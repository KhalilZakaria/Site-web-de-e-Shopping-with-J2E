import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.http.HttpSession;
public class Modify extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res)throws
		ServletException, IOException {
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		HttpSession session = req.getSession();
			try {
				//récpération des valeurs
				String fnom=req.getParameter("nom");
				String fprenom=req.getParameter("prenom");
				String femail=req.getParameter("email");
				String fpassword=req.getParameter("mdp");
				String id = "";
				//récupération de l'id de l'utilsateur selectionné
				HttpSession sess = req.getSession();
				if ((String) sess.getAttribute("id") != null) {
				
					id = (String) sess.getAttribute("id");
				}
				//connexion à la d
				String url="jdbc:mysql://localhost:3306/mini_projet?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
				String driver = "com.mysql.jdbc.Driver";
				Class.forName(driver).newInstance();
				Connection con;
				con=DriverManager.getConnection(url,"root","Zak1998");
				//UPDATE operation
				PreparedStatement stmt=con.prepareStatement("UPDATE personnes SET nom=?,prenom=?,email=?,password=? WHERE id=?");
				stmt.setString(1,fnom);
				stmt.setString(2,fprenom);
				stmt.setString(3,femail);
				stmt.setString(4,fpassword);
				stmt.setString(5,id);
				stmt.executeUpdate();
				stmt.close();
				con.close();
				//clear session;
				session.setAttribute("id","");
				res.sendRedirect("AffichageAdmin.jsp");
			}catch (Exception e){
			out.println("Erreur : "+e.getMessage()+ " source : "+e.getStackTrace());
		}
	}}
