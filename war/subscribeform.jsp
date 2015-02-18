<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.googlecode.objectify.*" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="guestbook2.Greeting" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<%  
UserService userService = UserServiceFactory.getUserService();
User user = userService.getCurrentUser();%> 

    
<html>
  <head>
  	 <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
  </head>
 
  <body>
  		<p>Subscribe to receive daily blog updates!</p>
  		<form action="/ofysubscribe" method="post">
		<div></div>
		<p>Email:</p>
		<div><textarea name = "emailsubscribe" rows = "1" cols = "60"></textarea></div>
		<p>First Name:</p>
   		<div><textarea name = "firstnamesubscribe" rows = "1" cols = "60"></textarea></div>
   		<p>Last Name:</p>
   		<div><textarea name = "lastnamesubscribe" rows = "1" cols = "60"></textarea></div>
		<div><input type="submit" value="Subscribe" /></div>
		<!--  
      <input type="hidden" name="guestbookName" value="${fn:escapeXml(guestbookName)}"/>
      -->
   	</form>
   	
   	<form action = "ofyguestbook2.jsp" method = "link">
		<div>
   			<input type = "submit" value = "Cancel">
		</div>
   	</form>

   	
 
    
  </body>
  
</html>