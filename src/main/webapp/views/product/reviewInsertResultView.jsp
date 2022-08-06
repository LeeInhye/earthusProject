<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.us.product.model.vo.Review" %>
<%
	String resultMsg = (String)request.getAttribute("resultMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성 결과</title>

	<!-- 리뷰 영역 스타일 -->
<style>
    .outer{
       margin:100px 0px auto;
    }
	#submit-btn{
         background-color:#A8BFAA;
         color:#F2F2F2;
         border: none;
         border-radius:5px;
         width:100px;
         height:30px;
         font-size:15px; font-weight: bold;
      }
      #submit-btn:hover{
         color:#404040 ;
         transition: 500ms;
      }
</style>

<!-- jQUery -->
<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>

<!-- font awesome -->
<script src="https://use.fontawesome.com/e3cb36acfb.js"></script>

<link rel="icon" href="img/favicon.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- animate CSS -->
<link rel="stylesheet" href="css/animate.css">
<!-- owl carousel CSS -->
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/lightslider.min.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="css/all.css">
<!-- flaticon CSS -->
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/themify-icons.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="css/magnific-popup.css">
<!-- style CSS -->
<link rel="stylesheet" href="css/style.css">

</head>

<body>

	<%@ include file="/views/common/menubar.jsp" %>
	
	
	<!-- 결과에 대한 alert창 -->
	<div class="outer" align="center">
		<br><br><br><br><br>
		<p style="font-size:25px;"><%= resultMsg %></p>
		<br><br><br>
		<div id="submit-btn" align="center" >
			<a href="<%= contextPath%>" style="text-decoration:none; color:white; line-height:30px;">메인으로</a>
		</div>
	</div>
	
	
	
	
	
  <!-- jquery plugins here-->
  <!-- jquery -->
  <script src="js/jquery-1.12.1.min.js"></script>
  <!-- popper js -->
  <script src="js/popper.min.js"></script>
  <!-- bootstrap js -->
  <script src="js/bootstrap.min.js"></script>
  <!-- easing js -->
  <script src="js/jquery.magnific-popup.js"></script>
  <!-- swiper js -->
  <script src="js/lightslider.min.js"></script>
  <!-- swiper js -->
  <script src="js/masonry.pkgd.js"></script>
  <!-- particles js -->
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.nice-select.min.js"></script>
  <!-- slick js -->
  <script src="js/slick.min.js"></script>
  <script src="js/swiper.jquery.js"></script>
  <script src="js/jquery.counterup.min.js"></script>
  <script src="js/waypoints.min.js"></script>
  <script src="js/contact.js"></script>
  <script src="js/jquery.ajaxchimp.min.js"></script>
  <script src="js/jquery.form.js"></script>
  <script src="js/jquery.validate.min.js"></script>
  <script src="js/mail-script.js"></script>
  <script src="js/stellar.js"></script>
  <!-- custom js -->
  <script src="js/theme.js"></script>
  <script src="js/custom.js"></script>
         
</body>
</html>