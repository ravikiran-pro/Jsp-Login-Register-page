<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<!-- To check whether password is strong -->
<%!
public int checkstrength(String pass,String re_pass)
{
	int uppercase=1;
	for(int i=0;i<pass.length();i++)
	{
		char ch=pass.charAt(i);
		if(Character.isUpperCase(ch) || uppercase==1)
		{
			uppercase=1;
			if(pass.charAt(i)>='0' && pass.charAt(i)<='9')
			{
				return 1;
			}
		}
	}%>
<%!
	return 0;
}
%>
<!-- To check whether password matches -->
<%!
	public int checkmatch(String pass,String re_pass)
	{
		if(pass.equals(re_pass))
		{
			return 1;
		}
		return 0;
	}
%>

<!-- ///To check whether fields are not empty -->
<%!
public int empty(String uname,String name,String email)
{
	if(uname.length()!=0 && name.length()!=0 && email.length()!=0)
	{
		return 1;
	}
	return 0;
}
%>
<!--checking whether email address have been used by others -->
<%! 
public int check_email(String email)
{
	try{  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","DBMS","dbms");
	Statement st=con.createStatement();
	email="'"+email+"'";
	String sql="Select * from userss where email="+email;
	ResultSet rs=st.executeQuery(sql);
	rs.next();
	String check_passwd=rs.getString("pass");
	System.out.println(check_passwd);
	}
	catch (Exception e2) {
		///error thrown when email address not found
		return 1;
}
	return 0;
}
%>
	
<%
/// Extracting user data's
response.setContentType("text/html");
String uname = request.getParameter("uname");
String name = request.getParameter("name");
String email = request.getParameter("email");
email=email.toLowerCase();
System.out.println(email);
String pass = request.getParameter("pass");
String re_pass = request.getParameter("re_pass");

if(checkstrength(pass,re_pass)==1 && empty(uname,name,email)==1 && checkmatch(pass,re_pass)==1 && check_email(email)==1)  ///checking whether following data's or valid or not.
{
	try
	{  
		///connecting to db if valid
		Class.forName("oracle.jdbc.driver.OracleDriver");  
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","DBMS","dbms");
		String query = "insert into userss (username,name,email,pass)"+"values(?,?,?,?)";
		System.out.println(con);
		PreparedStatement stmt = con.prepareStatement(query);
		stmt.setString(1,uname);
		stmt.setString(2,name);
		stmt.setString(3,email);
		stmt.setString(4,pass);
		stmt.execute();
		con.close();
		
%>
<!-- If data's uploaded successfully redirecting to the login page -->
<script type="text/javascript">
alert("Login to continue")
window.close()
window.open("index.html")
</script>
<%
	}
	catch (Exception e2) 
	{
		System.out.println(e2);
	}
}
else
{
%>
<!-- If there are errors over entry ..see the above methods condition and fill the registration form accordingly -->
<script type="text/javascript">
alert("invalid entries found")
window.close()
window.open("index.html")
</script>
<% 	
}
%>

</body>
</html>