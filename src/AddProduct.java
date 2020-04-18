

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
@WebServlet("/AddProduct")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		try {
		//connexion � ma bd
		String url="jdbc:mysql://localhost:3306/mini_projet?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		String driver = "com.mysql.jdbc.Driver";
		Class.forName(driver).newInstance();
		Connection con;
		con=DriverManager.getConnection(url,"root","Zakaria@1999");
		PreparedStatement stmt=con.prepareStatement("select * from suggestions;");
		ResultSet resultats = stmt.executeQuery();
		//compter le nombre des suggestions (pending) disponible
		int CountRows=0;
		while(resultats.next()) {
			CountRows++;
		}
		
		//out.println("Nbr de lignes : "+CountRows);
		//r�cup�rer le produitt selectionn�
		String OurValue="";
		int j=1;
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
		//String edit = request.getParameter("Modifier");
		PreparedStatement stmt2;
		//la valeur du button
		String button = request.getParameter(OurValue);
		if ( button.equalsIgnoreCase("Accepter") )
			{out.println("C'est modifier");
			//ajouter l'id de la suggestion selectionn�e puis aller vers la jsp Accepter
			HttpSession session = request.getSession();
			session.setAttribute("idsuggestion",OurValue);
			res.sendRedirect("Accepter.jsp");
			}
			// Si c'est supprimer
		if ( button.equalsIgnoreCase("X") )
			{out.println("C'est supprimer");
			//supprimer directement de la base de donn�e
			stmt2=con.prepareStatement("DELETE FROM suggestions WHERE suggestionID =?");
			stmt2.setString(1,OurValue);
			stmt2.executeUpdate();
			stmt2.close();
			con.close();
			res.sendRedirect("suggestions.jsp");
			
			}
		
		}catch (Exception e){
		out.println("Erreur : "+e.getMessage()+ " source : "+e.getStackTrace());
		}
	
		
	}

}
