<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String modalId = (String)session.getAttribute("modalId");
	String modalMsg = (String)session.getAttribute("modalMsg");
	String url = (String)session.getAttribute("url");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/views/common/adminMenubar.jsp" %>
	
	<script>
		$(document).ready(function(){
			alert("<%=modalMsg%>");
			location.href = "<%=url%>";
		})
	</script>
</body>
</html>