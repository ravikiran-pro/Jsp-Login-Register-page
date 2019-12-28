# Jsp-Login-Register-page
### A basic login and Register page using jsp connected with oracle database

## DIRECTORY

- <b>index.html</b>         -<i>Login/register page</i>

- <b>homepage.html</b>     -<i>Redirecting After login page</i>

- <b>jsp/login.jsp</b>     -<i> Checking login details with oracle database</i>

				> Supporting username with password
        	        > Supporting Email with password
				
- <b>jsp/register.jsp</b>  - <i>Adding user data to oracle database with function like</i>

			      > pasword check (Should contain a uppercase letter,special symbol,
                         number and password must be greater than 8 characters)                          
                    > Username already available or Not
                    > Age restrictions

## INSTALLATION_INSTRUCTIONS

### Setting up project 
- Open Your Respective Java ide.
- Import Jsp-Login-Register-page.zip as Dynamic web project.
- Configure Apache Tomcat.
- Run the program in eclipse using Apache Server.
- Now the in-built ide browser will load the login page

### Configuring oracle
- Open cmd Run sqllite
- Enter Your password and username
- copy and paste WebCommunity\sql.sql
- Create the database
- open WebCommunity\jsp\login.jsp && WebCommunity\jsp\Register.jsp
- Replace the following code snippet
   ```
      Class.forName("oracle.jdbc.driver.OracleDriver");  
	        Connection con=DriverManager.getConnection(  
	        "jdbc:oracle:thin:@localhost:1521:xe","DBMS","dbms");
                
     Dbms -> Your oracle username
     dbms -> Your oracle password
  ```
