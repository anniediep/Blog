<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.googlecode.objectify.*" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="guestbook2.Email" %>

<%@ page import="com.googlecode.objectify.ObjectifyService" %>
<%@ page import="com.googlecode.objectify.cmd.Query" %>



<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


 
<%  
UserService userService = UserServiceFactory.getUserService();
User user = userService.getCurrentUser();


//testing
/*
ObjectifyService.register(Email.class);

Query<Email> query = ObjectifyService.ofy().load().type(Email.class);
List<Email> emailList = query.list();
*/

%> 


    
<html>
  <head>
  	 <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
  </head>
 
  <body>
  		<p>You have been subscribed!</p>
  	
  		<!-- testing -->
  		<%
  		//pageContext.setAttribute("email_test",  emailList.getEmail());
  		%>
  		<!--  	
  		<blockquote>${fn:escapeXml(email_test)}</blockquote>
  		-->
  		
  		
  		<p><a href = "ofyguestbook2.jsp" >Click here</a> to return to the home page.</p>
  		
  		<p>

   	
 
    
  </body>
  
</html>