 <%@ page import ="java.sql.DriverManager" %>
 <%@ page import ="java.sql.Connection" %>
 <%@ page import ="java.sql.Statement" %>
 <%@ page import ="java.sql.ResultSet" %>
 <%@ page import ="java.sql.SQLException" %>

 <% // MySQL JDBC Driver Loading
              Class.forName("com.mysql.cj.jdbc.Driver");
              Connection conn =null;
              Statement stmt =null;
              ResultSet rs =null;
	      String jdbcDriver="jdbc:mysql://localhost:3306/CLOUD_DB?serverTimezone=UTC";
              String dbUser ="root"; //mysql id
              String dbPass ="1234"; //mysql password
	      conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	      stmt = conn.createStatement();
 %>
	      
