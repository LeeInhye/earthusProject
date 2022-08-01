<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String modalId = (String)request.getAttribute("modalId");
	String modalMsg = (String)request.getAttribute("modalMsg");
	String url = (String)request.getAttribute("url");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	.modal-body {
		text-align:center !important;
		height:100px !Important;
	}
	.modal-footer{
		text-align:center;
		border-top:none !important;
	}
	.btn-s-modal {
		display:inline-block;
		width:100%;
		background:#778c79 !important;
		color:#f2f2f2 !important;
		text-align:center;
		height:40px;
	}
	.modal-content {
		background:lightgray !important;
		line-height: 100px;
	}
</style>
</head>
<body>
	<%@ include file="/views/common/adminMenubar.jsp" %>
	
	<script>
		$(document).ready(function(){
			$('#<%= modalId %>').modal('show');
			
		})
	</script>
	
	
	<!-- The Modal -->
	<div class="modal" id="<%=modalId%>">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        <%= modalMsg %>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button onclick="go();" type="button" class="btn btn-s-modal">확인</button>
	      </div>
	      
	    </div>
	  </div>
	</div>
	      <!-- Modal End -->
	<script>
			function go(){
				location.href = "<%=url%>";
			}
	</script>
</body>
</html>