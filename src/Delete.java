

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
@WebServlet("/Delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delete() {
        super();
        // TODO Auto-generated constructor stub
    }
    //en fait cette classe va d'abord détécter si c'est modifier ou supprimer
	protected void doPost(HttpServletRequest request, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		try {

		String url="jdbc:mysql://localhost:3306/mini_projet?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		String driver = "com.mysql.jdbc.Driver";
		Class.forName(driver).newInstance();
		Connection con;
		con=DriverManager.getConnection(url,"root","Zak1998");
		//selection de tt les utilisateurs
		PreparedStatement stmt=con.prepareStatement("select * from personnes;");
		ResultSet resultats = stmt.executeQuery();
		int CountRows=0;
		//calcul de leurs nombres
		while(resultats.next()) {
			CountRows++;
		}
		
		out.println("Nbr de lignes : "+CountRows);
		String OurValue="";
		int j=1;
		//detection de la valeur de l'utilisateur selectionné
		while(true) {
			String test = String.valueOf(j); 
			  if (request.getParameter(test) != null) {
				  OurValue=test;
				  break;
			  }
			  j++;
		}
		
		
		stmt.close();
		out.println("My value " +OurValue);
		
		String edit = request.getParameter("Modifier");
		PreparedStatement stmt2;
		String button = request.getParameter(OurValue);
		//detection de la valeur du button selectionné
		if ( button.equalsIgnoreCase("Modifier") )
			{out.println("C'est modifier");
			//ajout à la session et envoie vers modify.jsp
			HttpSession session = request.getSession();
			session.setAttribute("id",OurValue);
			res.sendRedirect("modify.jsp");
			}
		if ( button.equalsIgnoreCase("X") )
			{out.println("C'est supprimer");
			//si c'est supprimer nous supprimons l'utilisateur
			stmt2=con.prepareStatement("DELETE FROM personnes WHERE id =?");
			stmt2.setString(1,OurValue);
			stmt2.executeUpdate();
			stmt2.close();
			con.close();
			//redirecton vers affichage admin
			res.sendRedirect("AffichageAdmin.jsp");
			
			}
		
	
		
		
	
		}catch (Exception e){
		out.println("Erreur : "+e.getMessage()+ " source : "+e.getStackTrace());
		}
	
		
	}

}
