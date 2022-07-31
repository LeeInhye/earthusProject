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

<style>
	.terms-content-area{
		padding-top: 100px;
		padding-bottom: 200px;
		width:800px;
		margin:auto;
	}
</style>

</head>
<body>

	<%@ include file="../../common/menubar.jsp" %>
	
	
	  <!-- breadcrumb start-->
	  <section class="breadcrumb contents_bg">
	    <div class="container">
	      <div class="row justify-content-center">
	        <div class="col-lg-8">
	          <div class="breadcrumb_iner">
	            <div class="breadcrumb_iner_item">
	              <h2>이용약관</h2>
	              <p> </p>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </section>
	  <!-- breadcrumb End-->
	  
	<script>
		<% if(successMsg != null){ %>
			alert("<%= successMsg %>");
			successMsg = null;
		<% } %>	
	</script>
	
	<div class="wrap">	
		<div class="terms-content-area" >
			<%= html %>
		</div>
	</div>
	
	<!-- =============== Footer Bar Area =============== -->
	<%@ include file="../../common/footerbar.jsp" %>
	
</body>
</html>