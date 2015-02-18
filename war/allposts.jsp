<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.googlecode.objectify.*" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="guestbook2.Greeting" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<html>
  <head>
  	 <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
  </head>
 
  <body>
 
<%
    String guestbookName = request.getParameter("guestbookName");
    if (guestbookName == null) {
        guestbookName = "default";
    }
    pageContext.setAttribute("guestbookName", guestbookName);
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    if (user != null) {
      pageContext.setAttribute("user", user);
%>
<p>Hello, ${fn:escapeXml(user.nickname)}! Click 
<a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">here</a> to log out.</p> 
<%
    } else {
%>
<p>Welcome. Please
<a href="<%= userService.createLoginURL(request.getRequestURI()) %>">log in</a>
to create a post.</p>
<%
    }
%>
 
<%
	ObjectifyService.register(Greeting.class);
	List<Greeting> greetings = ObjectifyService.ofy().load().type(Greeting.class).list();   
	Collections.sort(greetings); 
	
    //DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
    //Key guestbookKey = KeyFactory.createKey("Guestbook", guestbookName);
    
    // Run an ancestor query to ensure we see the most up-to-date
    // view of the Greetings belonging to the selected Guestbook.
    
    //Query query = new Query("Greeting", guestbookKey).addSort("date", Query.SortDirection.DESCENDING);
    //List<Entity> greetings = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(5));
    
    if (greetings.isEmpty()) {
        %>
        <p>Blog has no posts.</p>
        <%
    } else {
        %>
        <p>Messages in blog:</p>
        <%
        for (Greeting greeting : greetings) {
        	pageContext.setAttribute("greeting_title", greeting.getTitle());
            pageContext.setAttribute("greeting_content",  greeting.getContent());
            if (greeting.getUser() == null) {
                %>
                <p>An anonymous person wrote:</p>
                <%
            } else {
                pageContext.setAttribute("greeting_user", greeting.getUser());
                %>
                <p><b>${fn:escapeXml(greeting_user.nickname)}</b> wrote:</p>
                <%
            }
            %>
            <blockquote>${fn:escapeXml(greeting_title)}</blockquote>
            <blockquote>${fn:escapeXml(greeting_content)}</blockquote>
            <%
        }
    }
%>

<p> <a href = "ofyguestbook2.jsp">Click here</a> to return to the home page. </p>

<!-- 
<form action = "allposts.jsp" method = "link">
	<div>
		<input type = "submit" value = "Show all posts" />
	</div>
</form>
 -->
 
  </body>
</html>