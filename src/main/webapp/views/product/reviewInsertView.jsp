<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.us.product.model.vo.Review" %>
<%
	String contextPath = request.getContextPath();
	int userNo = (int)request.getAttribute("userNo");
	String proCode = (String)request.getAttribute("proCode");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>

	<!-- 리뷰 영역 스타일 -->
<style>
	body{
		background-color:#F2F2F2;
	
    }
    .insert-review-outer{
       padding-left:50px;
       padding-right:50px;
    }
    #insert-review-content{
       width:100%; 
       resize:none; 
       border:1px solid #F2F2F2;
       border-radius: 10px;
    }
	#rate-star{
	  display:inline-block;
	  border:0px;
	  padding-left:10px;
	}
	#rate-star input[type=radio]{
	  display:none;
	}
	.review-rate{
	  color:#fbd600;
	}
	#submit-btn{
         background-color:#A8BFAA;
         color:#F2F2F2;
         border: none;
         border-radius:10px;
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
	<!-- 리뷰 작성 팝업창으로 띄우기 -->
	
	<div class="insert-review-outer">
		<div class="insert-review-content">
	        <form action="<%= contextPath %>/insertResult.re" method="post" enctype="multipart/form-data">
	        <!-- 현재 Review r 객체에 (USER_NO, PRO_CODE, PRO_NAME, PRO_IMG_PATH 담겨있음) -->
	        <input type="hidden" name="userNo" value="<%= userNo %>">
	        <input type="hidden" name="proCode" value="<%= proCode %>">
	        
	            
				<h3>리뷰 작성하기</h3>
				<div class="rate-area">
					<p style="display:inline;">당신의 별점은: </p>
					<fieldset id="rate-star">
						  <input type="radio" name="rate" value="1" id="rate1">
						  <label for="rate1"><i class="fa fa-star review-rate"></i></label>
						  <input type="radio" name="rate" value="2" id="rate2">
						  <label for="rate2"><i class="fa fa-star review-rate"></i></label>
						  <input type="radio" name="rate" value="3" id="rate3">
						  <label for="rate3"><i class="fa fa-star review-rate"></i></label>
						  <input type="radio" name="rate" value="4" id="rate4">
						  <label for="rate4"><i class="fa fa-star review-rate"></i></label>
						  <input type="radio" name="rate" value="5" id="rate5">
						  <label for="rate5"><i class="fa fa-star review-rate"></i></label>
					</fieldset>
				</div>
				
				<script>
					$(function(){
						// 별점 checked속성에 대한 function (클릭하면 유지되도록)
						$("input[name=rate]").change(function(){
							$(this).next().children().css("color", "#fbd600");
							$(this).prevAll("label").children().css("color", "#fbd600");
							$(this).next().nextAll("label").children().css("color", "gainsboro");
						})
					})                      
				</script>
	         	
	         	<div class="content-area">
					<textarea name="content" rows="4" placeholder="최소 20자 이상 입력해주세요." style="width:100%; border:1px solid gainsboro; resize:none;"></textarea>
					<input type="file" name="review-image">
					
					<div class="button-area" align="right">
						<button type="submit" id="submit-btn" disabled>제출하기</button>	         	
					</div>
	         	</div>
	        </form>
		</div>
	</div>
	
	<script>
		// 글자수에 대한 조건처리
		$("textarea[name=content]").change(function(){
			if( $(this).val().length < 20 ){
				alert("최소 20자 이상을 입력해 주세요.");
				$("#submit-btn").attr("disabled", true);
			}else{
				$("#submit-btn").removeAttr("disabled");
			}
		})
	</script>
	
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