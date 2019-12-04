<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
h1
{
color:red;
}
</style>
</head>
<body>
<%
response.setContentType("text/html");            
String log_name=request.getParameter("l_name");
String log_passwd=request.getParameter("passwd");
log_name="'"+log_name+"'";
%>
<% 
try{  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","DBMS","dbms");
	Statement st=con.createStatement();
	String sql="Select * from userss where email="+log_name;
	ResultSet rs=st.executeQuery(sql);
	rs.next();
	String check_passwd=rs.getString("pass");
	if(check_passwd.equals(log_passwd))
		{
			System.out.println(log_passwd+"\t\t"+check_passwd);
			response.sendRedirect("homepage.html");			
		}
	}
catch (Exception e2) {
	System.out.println(e2);
	%>
<script type="text/javascript">
alert("Incorrect details")
window.close()
window.open("index.html")
</script>
<%
	}
%>
</h1>
</body>
</html>