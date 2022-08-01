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
<style>
	.btn-s-modal {
		width:100%;
		background:#778c79 !important;
		color:#f2f2f2 !important;
		text-align:center;
	}
	
	.modal-body {
		text-align:center;
	}
	.modal-content {
		background:#f2f2f2;
		line-height: 100px;
	}
</style>
</head>
<body>
	<%@ include file="/views/common/adminMenubar.jsp" %>
	
			<!--  alert("<%=modalMsg%>"); -->
	<script>
		$(document).ready(function(){
			$('#<%=modalId%>').modal('show');
			
		})
	</script>
	
	<!-- The Modal -->
	<div class="modal" id="<%=modalId%>">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal body -->
	      <div class="modal-body" style="height:150px text-align:center;">
	        <%= modalMsg %>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button onclick="go();" type="button" class="btn btn-s-modal" style="">확인</button>
	      </div>
	      <!-- Modal End -->
	<script>
			function go(){
				location.href = "<%=url%>";
			}
	</script>
</body>
</html>