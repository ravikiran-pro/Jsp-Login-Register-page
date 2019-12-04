# Jsp-Login-Register-page

A basic login and Register page using jsp connected with oracle database

index.html        -->Login/register page
homepage.html     -->Redirecting After login page
jsp/login.jsp     -->Checking login details with oracle database

                      [] Supporting username with password
                      [] Supporting Email with password

jsp/register.jsp  -->Adding user data to oracle database with function like

                      []  pasword check (Should contain a uppercase letter,special symbol,
                          number and password must be greater than 8 characters)                          
                      []  Username already available or Not
                      []  Age restrictions


****************************************************************************
--> Open Your Respective Java ide.
--> Import Jsp-Login-Register-page.zip as Dynamic web project.
--> Configure Apache Tomcat.
--> Run the program in eclipse Server.
--> Now the browser you load your page

*****************************************************************************
Configuring Oracle
-->Open cmd Run sqllite
-->Enter Your password and username
-->copy and paste WebCommunity\sql.sql
-->Create the database
-->open WebCommunity\jsp\login.jsp && WebCommunity\jsp\Register.jsp
-->Replace the following
   DBMS ---> With your database username
   dbms ---> With your database password
   
      Class.forName("oracle.jdbc.driver.OracleDriver");  
	        Connection con=DriverManager.getConnection(  
	        "jdbc:oracle:thin:@localhost:1521:xe","DBMS","dbms");
                                                 
*****************************************************************************
