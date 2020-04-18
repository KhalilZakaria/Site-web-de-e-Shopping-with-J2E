import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.http.HttpSession;
	public class AjouterProduit extends HttpServlet {
		protected void doPost(HttpServletRequest req, HttpServletResponse res)throws
		ServletException, IOException {
			res.setContentType("text/html");
			PrintWriter out = res.getWriter();
			HttpSession session = req.getSession();
			
			String idSuggestion = "";
			
			//récuperer depuis la session id de la suggestion selectionnée
			if ((String) session.getAttribute("idsuggestion") != null) {
			
				idSuggestion= (String) session.getAttribute("idsuggestion");
			}
				try {
					//récupération des paramètres depuis le formulaire
					String fnom=req.getParameter("nomP");
					String fcategorie=req.getParameter("catP");
					String furl=req.getParameter("imageUrl");
					String fdesc=req.getParameter("imageD");
					String fprix=req.getParameter("prixP");
					//connexion à la bd
					String url="jdbc:mysql://localhost:3306/mini_projet?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
					String driver = "com.mysql.jdbc.Driver";
					Class.forName(driver).newInstance();
					Connection con;
					con=DriverManager.getConnection(url,"root","Zak1998");
					//ajout à la table poduit
					PreparedStatement stmt=con.prepareStatement("insert into produits(Nom_produit,Categorie,Prix,image_uri,description) values(?,?,?,?,?);");
					stmt.setString(1,fnom);
					stmt.setString(2,fcategorie);
					stmt.setString(3,fprix);
					stmt.setString(4,furl);
					stmt.setString(5,fdesc);
					stmt.executeUpdate();
					stmt.close();
					//suppression du table sugestions
					PreparedStatement stmt1=con.prepareStatement("DELETE FROM suggestions WHERE suggestionID =?");
					stmt1.setString(1,idSuggestion);
					stmt1.executeUpdate();
					stmt1.close();
					con.close();
					//clear session;
					session.setAttribute("idsuggestion","");
					res.sendRedirect("AffichageAdmin.jsp");
				}catch (Exception e){
					out.println("Erreur : "+e.getMessage()+ " source : "+e.getStackTrace());
				}
}}
