import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.http.HttpSession;
public class AddToCart extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res)throws
		ServletException, IOException {
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		try {
			//récupere les valeurs
			String fQuantite=req.getParameter("quantite");
			String CurrentProduct =  req.getParameter("productID");
			//id de l'utilisateur courant
			int Currentid=0;
			HttpSession sess = req.getSession();
			if ((int) sess.getAttribute("Currentid") != 0) {
				Currentid = (int) sess.getAttribute("Currentid");
			}
			
			//connexion à la bd
			String url="jdbc:mysql://localhost:3306/mini_projet?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
			String driver = "com.mysql.jdbc.Driver";
			Class.forName(driver).newInstance();
			Connection con;
			con=DriverManager.getConnection(url,"root","Zakaria@1999");
			//executer la requete
			PreparedStatement stmt=con.prepareStatement("insert into panier(productID,personID,Quantite) values (?,?,?)");
			stmt.setString(1,CurrentProduct);
			stmt.setInt(2,Currentid);
			stmt.setString(3,fQuantite);
			stmt.executeUpdate();
			stmt.close();
			con.close();
			//redirection vers index
			res.sendRedirect("index.jsp");
	}catch (Exception e){
	out.println("Erreur : "+e.getMessage()+ " source : "+e.getStackTrace());
	}
	}}
