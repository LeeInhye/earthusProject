<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.us.product.model.vo.ProQna" %>
<%
	String proCode = (String)request.getAttribute("proCode");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 문의 등록 성공 - Earth.Us</title>
<style>
	.btn-white {
	     background:#f2f2f2;
	     color:#404040;
	   }
	
	.btn-green {
	  background:#778C79;
	  color:#f2f2f2;
	  line-height:40px;
	  font-weight:bold;
	}
</style> 
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<!-- 바디부 시작-->
	<div class="product_qna_area section_padding">
	  <div class="container" style="padding:100px 0px;">
	    <h3><b>상품 문의 작성</b></h3>
	    <br>
	    <hr>
	    <br>
	
	    <form action="" method="post" id="pro-qna-form">
	    <div class="container form-group" style="padding:50px;">
	        <div id="pro-qna-form-success-img">
	          <img src="<%=contextPath%>/resources/img/product/proQna_insert_success.png" alt="">
	          <h4><i class="fa fa-check" aria-hidden="true"></i> 상품 문의가 작성되었습니다.</h4>
	          <div style="margin:50px;">
	            상품 문의는 해당 상품 상세 페이지에서 조회 가능합니다.<br>
	            빠른 시일 내에 답변드리도록 최선을 다하겠습니다. <br>
	            감사합니다.
	          </div>
	          <div>
	            <!-- <button class="pro-qna-btn">상품 페이지로</button> -->
	            <a type="button" class="pro-qna-btn btn-green" style="color:#f2f2f2;">상품 페이지로</a>
	            <script>
	              $('.product_qna_area a').click(function(){
	                location.href = "<%=contextPath%>/detail.pro?proCode=<%=proCode%>";
	              })
	            </script>
	          </div>
	        </div>
	  </div>
	</div>
	<!--바디부 끝-->
	
	
	<%@ include file="../common/footerbar.jsp" %>

</body>
</html>