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
  		<p>Post submission form will go here!</p>
  		
  		
  		
	<% if(user != null){ %>
	<form action="/ofysign" method="post">
		<div></div>
		<div><textarea name = "title" rows = "1" cols = "60"></textarea></div>
   		<div><textarea name="content" rows="3" cols="60"></textarea></div> 
		<div><input type="submit" value="Create a new post" /></div>
      <input type="hidden" name="guestbookName" value="${fn:escapeXml(guestbookName)}"/>
   	</form>
   	
   	   	<form action = "ofyguestbook2.jsp" method = "link">
   		<div>
   			<input type = "submit" value = "Cancel">
   		</div>
   	</form>
   	<% } %>
   	
   	<% if(user == null){ %>
  			<p>Please <a href = "ofyguestbook2.jsp">log in</a> to create a post.</p>
  			<% } %>
   	
 
    
  </body>
  
</html>