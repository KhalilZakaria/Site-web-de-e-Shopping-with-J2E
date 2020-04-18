import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class Finaliser extends HttpServlet {
protected void doPost(HttpServletRequest req, HttpServletResponse res)throws
ServletException, IOException {
res.setContentType("text/html");
PrintWriter out = res.getWriter();
try {

	//connecton à la bd
	String url="jdbc:mysql://localhost/mini_projet?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	String driver = "com.mysql.jdbc.Driver";
	Class.forName(driver).newInstance();
	Connection con=DriverManager.getConnection(url,"root","Zakaria@1999");
	PreparedStatement stmt=con.prepareStatement("select ProduitID,quantite from produits,panier where ProduitID=ProductID and personID=?");
	  //recupération de l'id du personnes connécté courant
	int Currentid=0;
			HttpSession sess = req.getSession();
			if ((int) sess.getAttribute("Currentid") != 0) {
				Currentid = (int) sess.getAttribute("Currentid");
			}
	stmt.setInt(1,Currentid);
	stmt.executeQuery();
	ResultSet resultats = stmt.executeQuery();
	
	boolean encore = resultats.next();	
	PreparedStatement stmt1=null;;
	//parcours , normalement il n'ya q une seule résultat
	while (encore) { 
		
		stmt1=con.prepareStatement("insert into commandes(PersonID,ProductID,quantite) values (?,?,?)");
		stmt1.setInt(1,Currentid);
		stmt1.setInt(2,resultats.getInt(1));
		stmt1.setInt(3,resultats.getInt(2));
		stmt1.executeUpdate();
		
		encore = resultats.next(); } 
		stmt1.close();

		PreparedStatement stmt2=null;;
		stmt.close();
		//Supprimer depuis panier
		stmt2=con.prepareStatement("delete from panier where personID=?");
		stmt2.setInt(1,Currentid);
		stmt2.executeUpdate();
	
	
		con.close();
		//renvoie vers merci.jsp
		res.sendRedirect("Merci.jsp");
		}catch (Exception e){
		out.println("Erreur : "+e.getMessage()+ " source : "+e.getStackTrace());
		}
		}}
