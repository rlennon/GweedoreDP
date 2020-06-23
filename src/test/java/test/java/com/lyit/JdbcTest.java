package test.java.com.lyit;

import java.sql.*;

import org.junit.Test;

import com.lyit.SecurityUtils;

public class JdbcTest {

   @Test	
   public void testJdbc() {
      try {
    	 Class.forName("com.mysql.cj.jdbc.Driver");
         Connection conn = DriverManager.getConnection(
               "jdbc:mysql://gweedore.cpagctkouszj.us-east-2.rds.amazonaws.com:3306/gweedore_db?useSSL=false",
               "admin", new SecurityUtils().decryptString("LNvW/C8kRbyu+NNScViMqY/Og5688/ku8kqwS/CGwRs="));
         Statement stmt = conn.createStatement();
       
         String strSelect = "INSERT INTO gweedore_db.user_log (user_name, activity, activity_date) VALUES ( \"GweedoreDev\", \"UnitTest\", CURRENT_TIMESTAMP)";
 
         int rset = stmt.executeUpdate(strSelect);
 
      } catch(SQLException ex) {
         ex.printStackTrace();
      } catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
   }
}