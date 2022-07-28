<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>리뷰 관리</title>
	<link rel="icon" href="img/favicon.png">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<!-- animate CSS -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- owl carousel CSS -->
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<!-- font awesome CSS -->
	<link rel="stylesheet" href="css/all.css">
	<!-- flaticon CSS -->
	<link rel="stylesheet" href="css/flaticon.css">
	<link rel="stylesheet" href="css/themify-icons.css">
	<link rel="stylesheet" href="css/nice-select.css">
	<!-- font awesome CSS -->
	<link rel="stylesheet" href=">css/magnific-popup.css">
	<!-- swiper CSS -->
	<link rel="stylesheet" href="css/slick.css">
	<!-- style CSS -->
	<link rel="stylesheet" href="css/style.css">
	
	<!-- *** DONT'T DELETE :: SCRIPT FROM W3SCHOOLS *** -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	
	<style>
		.btn-delete{
			border-radius: 5px;
			font-weight:bold;
			background-color: #A8BFAA;
			color: #F2F2F2;
			border:none;
			}
		img{
			display: block;
			margin: auto auto;
			margin-top:10px;
		}
	</style>

</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<!--================ START BANNER AREA =================-->
    <section class="breadcrumb contents_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h2>작성 리뷰 관리</h2>
                            <p>작성했던 리뷰를 한 군데에 모아서 조회, 수정, 삭제해 보세요!</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
   	<!--================ END BANNER AREA =================-->
		
	<!-- BELOW :: CONTENT AREA START  -->
	<div class="container" style="max-width: 960px;">
		<br><br>
		<div align="right" id="mypage-review-top">
			<a href="#" class="genric-btn default circle" style="background-color:#A8BFAA; color:white;">마이페이지로 &gt;</a>
			<hr>
		</div>

		<table class="table">
			<thead>
			  <tr align="center">
				<th class="review-pic" width="5%;"><input type="checkbox" id="check-all"  onclick="checkAll();"></th>
				<th width="20%;">상품 사진</th>
				<th width="25%">상품 정보</th>
				<th width="45%">리뷰</th>
			  </tr>
			</thead>
			<tbody>
			  <tr style="line-height:50px;">
				<td align="center"><input type="checkbox" class="check-review"></td>
				<td class="clickable" height="150px;"><img src="img/b1.jpg" width="80%"></td>
				<td class="clickable">강아지 냄새가 나는 비누</td>
				<td class="clickable">
					<p>정말 비누에서 강아지 냄새가 나네요? 너무너무 신기해요. 제 몸에서 개냄새가 납니다. 강아지 꼬순내 너무 좋네요. 강아지도 제가 개인 줄 알고 좋아해요.</p>
				</td>
			  </tr>
			  <tr style="line-height:50px;">
				<td align="center"><input type="checkbox" class="check-review"></td>
				<td class="clickable" height="150px;"><img src="img/b1.jpg" width="80%"></td>
				<td class="clickable">강아지 냄새가 나는 비누</td>
				<td class="clickable">
					<p>정말 비누에서 강아지 냄새가 나네요? 너무너무 신기해요. 제 몸에서 개냄새가 납니다. 강아지 꼬순내 너무 좋네요. 강아지도 제가 개인 줄 알고 좋아해요.</p>
				</td>
			  </tr>
			  <tr style="line-height:50px;">
				<td align="center"><input type="checkbox" class="check-review"></td>
				<td class="clickable" height="150px;"><img src="img/b1.jpg" width="80%"></td>
				<td class="clickable">강아지 냄새가 나는 비누</td>
				<td class="clickable">
					<p>정말 비누에서 강아지 냄새가 나네요? 너무너무 신기해요. 제 몸에서 개냄새가 납니다. 강아지 꼬순내 너무 좋네요. 강아지도 제가 개인 줄 알고 좋아해요.</p>
				</td>
			</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4"><button type="button" class="btn-delete"onclick="deleteChecked();">삭제</button></td>
				</tr>
			</tfoot>
		</table>		
	</div>
	
	
	<!-- ============ Start Script Area ==============-->
	<script>
		// 전체선택 checkbox에 대한 함수
		function checkAll(){
		  if( $("#check-all").is(':checked') ){
			$(".check-review").prop('checked', true);
		  }else {
			$(".check-review").prop('checked', false)
		  }
		}
		
		// 선택삭제 checkbox에 대한 함수
		function deleteChecked(){
		  $(".check-review:checked").each(function(){
			$(this).parent().parent().remove();
		  })
		}

		// document-ready-function area
		$(function(){

			// 개별 checkbox가 하나라도 해제됐을 때 전체선택 checkbox의 'checked'를 false로 만드는 함수
			$(".check-review").change(function(){ 
				// .check-review에 change이벤트가 발생했을 때 실행
				//	** document ready function은 문서의 요소가 '다 만들어지자마자' 실행되므로, 이 시점에 모든 checkbox는 체크되지 않은 상태
				// 		=> 따라서, 각 checkbox에 변화가 생길 때(change이벤트 발생할 때)마다 조건검사 해주어야 제대로 작동
				$(".check-review").each(function(){
					if(!$(this).prop('checked')){
						$("#check-all").prop('checked', false);
					}
				})
			})

			// 리뷰 내용 영역을 누르면 팝업페이지(리뷰수정 페이지) 띄우는 함수
			$(".clickable").click(function(){
				var popupX = screen.width/2 - 250;
				var popupY = screen.height/2 - 300; 
				const option = "scrollbars=no, location=no, toolbar=no, resizable=no, status=no, width=500px, height=600px, left=" + popupX + ", top=" + popupY;
				window.open("<%= contextPath %>/views/member/mypageReviewEdit.jsp", "리뷰 수정", option);
			})
		})
	</script>
	<!-- ============ End Script Area ==============-->
	

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
	<script src="js/swiper.min.js"></script>
	<!-- swiper js -->
	<script src="js/masonry.pkgd.js"></script>
	<!-- particles js -->
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<!-- slick js -->
	<script src="js/slick.min.js"></script>
	<script src="js/jquery.counterup.min.js"></script>
	<script src="js/waypoints.min.js"></script>
	<script src="js/contact.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.form.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/mail-script.js"></script>
	<!-- custom js -->
	<script src="js/custom.js"></script>
</body>
</html>