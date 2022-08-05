<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String html = (String)request.getAttribute("html");
%>
    <!doctype html>
<html lang="zxx">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>회사 소개</title>
  
  <!-- jQuery CDN -->
  <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>

<body>

	<%@ include file="../../common/menubar.jsp" %>
	
	  <!--================Home Banner Area =================-->
	  <!-- breadcrumb start-->
	  <section class="breadcrumb contents_bg">
	    <div class="container">
	      <div class="row justify-content-center">
	        <div class="col-lg-8">
	          <div class="breadcrumb_iner">
	            <div class="breadcrumb_iner_item">
	              <h2>AboutUs</h2>
	              <p>제로 웨이스트 샵, Earth.Us를 소개합니다!</p>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </section>
	  <!-- breadcrumb End-->
	
	<!-- ================ contact section start ================= -->
	<section class="contact-section padding_top">
	  <div class="container" align="center" style="width:800px; word-break: break-all;">
	    <p white-place="pre">
	
	      <%= html %>
	      
	    </p>
	
	  </div>
	</section>
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<!-- ================ contact section end ================= -->
	
	<!-- =============== Footer Bar Area =============== -->
	<%@ include file="../../common/footerbar.jsp" %>


</body>

</html>