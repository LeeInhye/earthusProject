<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String successMsg = (String)request.getAttribute("successMsg");
	String html = (String)request.getAttribute("html");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<% if(successMsg != null){ %>
		alert("<%= successMsg %>");
	<% } %>
	
	<%= html %>
</body>
</html>