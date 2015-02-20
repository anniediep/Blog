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
			  		<legend>Subscribe to receive daily blog updates!</legend>
			  		<div class="col-md-12">
				  		<form action="/ofysubscribe" method="post">
							<div></div>
							<label for="textArea" class="col-lg-2 control-label">E-mail</label>
							<div col-lg-10><textarea name = "emailsubscribe" rows = "1" cols = "60"></textarea></div>
							<p></p>
							<label for="textArea" class="col-lg-2 control-label">First Name</label>
					   		<div col-lg-10><textarea name = "firstnamesubscribe" rows = "1" cols = "60"></textarea></div>
					   		<p></p>
					   		<label for="textArea" class="col-lg-2 control-label">Last Name</label>
					   		<div col-lg-10><textarea name = "lastnamesubscribe" rows = "1" cols = "60"></textarea></div>
							<br>
							<div class="col-lg-10 col-lg-offset-2"><input class="btn btn-primary" type="submit" value="Subscribe" /></div>
							<!--  
					      <input type="hidden" name="guestbookName" value="${fn:escapeXml(guestbookName)}"/>
					      -->
					   	</form>
					   	
		   				<br><br>
					   	<form action = "bloghome.jsp" method = "link">
							<div class="col-lg-10 col-lg-offset-2">
					   			<input class="btn btn-default" type = "submit" value = "Cancel">
							</div>
					   	</form>
					 </div>  	
  				</body>
  			</div>
  		</div>
  	</div>
  
</html>