import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.http.HttpSession;
		public class Connexion extends HttpServlet {
		protected void doPost(HttpServletRequest req, HttpServletResponse res)throws
			ServletException, IOException {
			res.setContentType("text/html");
			PrintWriter out = res.getWriter();
			try {
				//récupération du mail et mdp
			String femail=req.getParameter("email");
			String fpassword=req.getParameter("mdp");
			//connexion à la bd
			String url="jdbc:mysql://localhost:3306/mini_projet?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
			String driver = "com.mysql.jdbc.Driver";
			Class.forName(driver).newInstance();
			Connection con;
			con=DriverManager.getConnection(url,"root","Zakaria@1999");
			PreparedStatement stmt=con.prepareStatement("select * from personnes where email=? and password=? ");
			stmt.setString(1,femail);
			stmt.setString(2,fpassword);
			ResultSet resultats = stmt.executeQuery();
			Boolean CountRows = resultats.next();
			//attention il faut s'assurer que l'utilisateur est unique
			//selection des utilisateurs et parcours
		if (CountRows) {
			//si dans la bd isAdmin=OUI la redirection sera vers admin
				if(resultats.getString(6).equals("OUI")) {
					HttpSession session = req.getSession();
					session.setAttribute("Currentid",resultats.getInt(1));
					session.setAttribute("nom",resultats.getString(2));
					session.setAttribute("prenom",resultats.getString(3));
					session.setAttribute("email",resultats.getString(4));
					session.setAttribute("password",resultats.getString(5));
					res.sendRedirect("AffichageAdmin.jsp");
				}
				else{	
					//sinon c'est un client
					out.println("Vous êtes notre cher client !");
					HttpSession session = req.getSession();
					session.setAttribute("Currentid",resultats.getInt(1));
					session.setAttribute("nom",resultats.getString(2));
					session.setAttribute("prenom",resultats.getString(3));
					session.setAttribute("email",resultats.getString(4));
					session.setAttribute("password",resultats.getString(5));
					//redirection vers index
					res.sendRedirect("index.jsp");
				}
			}
			else {
				//sion redirection vers login
				res.sendRedirect("login.jsp");
			}
			
		
		stmt.close();
		con.close();
		
		}catch (Exception e){
		out.println("Erreur : "+e.getMessage()+ " source : "+e.getStackTrace());
	}
}}
