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
%> 


    
<html>
  <head>
  	 <link type="text/css" rel="stylesheet" href="/stylesheets/superhero.css" />
  </head>
	<div class="container">
	<div class="jumbotron">
  		<div class="row">
  			<div class="col-md-6"><h1>What's your story?</h1></div>
			<div class="col-md-6">	
			  	<img src="http://images4.fanpop.com/image/photos/20800000/DOMO-D-domo-kun-20858807-500-306.png" alt="Responsive image">
			</div>
		</div>
 	</div>
  		<div class="row">
	  		<div class="col-md-12">
			  <body>
			  		<div class="alert alert-dismissible alert-success">
  <button type="button" class="close" data-dismiss="alert"></button>
  <strong>You have been unsubscribed. :^(</strong> 
</div>
			  		<p><a href = "bloghome.jsp" >Click here</a> to return to the home page.</p>
			  		<p>
			 </body>
			</div>
		</div>
	</div>
		
  
</html>