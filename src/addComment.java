

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Delete
 */
@WebServlet("/addComment")
public class addComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addComment() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		//la valeur o� nous allons stocker l'id de l'utilisateur
		 int Currentid=0;
	    
	     //r�cuperation de la session
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
		
		
		
		try {
		//connexion � la base de donn�e
			String url="jdbc:mysql://localhost:3306/mini_projet?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
			String driver = "com.mysql.jdbc.Driver";
			Class.forName(driver).newInstance();
			Connection con;
			con=DriverManager.getConnection(url,"root","Zakaria@1999");
			PreparedStatement stmt=con.prepareStatement("select OrderID,Nom_Produit,commentaire from produits,commandes where ProduitID=ProductID and personID=?");
			stmt.setInt(1,Currentid);
			ResultSet resultats = stmt.executeQuery();
			PreparedStatement stmt2=con.prepareStatement("UPDATE commandes SET commentaire=? WHERE OrderID=?");
			boolean encore = resultats.next();
			//parcourir la liste des orders et leurs commentaies associ�s
			int CurrentOrder  = 0;
			String CurrentComment= "";
		  while (encore) { 
			  //executer l'instruction � chaque fois les valeurs sont mises � jour
			  CurrentOrder=resultats.getInt(1);
			  CurrentComment = request.getParameter(Integer.toString(resultats.getInt(1)));
			  stmt2.setString(1,CurrentComment);
			  stmt2.setInt(2,CurrentOrder);
			  stmt2.executeUpdate();
			  encore = resultats.next(); }
		  //redirection vers index.jsp
			res.sendRedirect("index.jsp");
		  	
		}catch (Exception e){
		out.println("Erreur : "+e.getMessage()+ " source : "+e.getStackTrace());
		}
	
		
	}

}
