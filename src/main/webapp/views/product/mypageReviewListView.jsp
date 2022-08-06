<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.us.product.model.vo.Review, com.us.common.model.vo.Attachment" %>
<%
	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
	ArrayList<Attachment> picList = (ArrayList<Attachment>)request.getAttribute("picList");
%>

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
		.btn-bottom{
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
		#edit-review{
			display:inline-block;
			width:50px; 
			height:150px; 
			border:1px solid #F2F2F2; 
			background:none; 
			border-radius:5px;
			text-decoration:none;
			color:black;
			line-height:150px;
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
                            <h2>리뷰 관리</h2>
                            <p>구매한 상품에 리뷰를 남기고 조회, 수정, 삭제해 보세요!</p>
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
			<hr><br>
		</div>
		
		<table class="table">
			<thead>
			  <tr align="center">
				<th width="20px" class="review-pic"><input type="checkbox" id="check-all"  onclick="checkAll();"></th>
				<th width="150px">상품 사진</th>
				<th width="150px">상품명</th>
				<th colspan="2" width="300px">리뷰 내용</th>
				<th width="100px">리뷰 수정</th>
			  </tr>
			</thead>
			<tbody>
			<% for(Review r : list) { %> 
				<tr style="line-height:50px;">
					<td align="center"><input type="checkbox" class="check-review" value="<%= r.getRevNo() %>"></td>
					<td align="center" class="clickable" height="150px;">
						<img src="<%= r.getProImgPath() %>" width="90%">
					</td>
					<td align="center"> <%= r.getProName() %> </td>
					
					<% if( r.getRevType().equals("P") ){ %>
						<td style="padding:0px; margin-left:10px;">
							<div style="float:left;">
							<% for(int i=0; i<picList.size(); i++ ){ %>
								<% if( picList.get(i).getRefBNo() == r.getRevNo() ){ %>
									<img src="<%= picList.get(i).getFilePath() + picList.get(i).getChangeName() %>" style="width:200px; height:100px;">
								<% } %>
							<% } %>
							</div>
						</td>
						<td style="margin-top:20px; white-space:pre-wrap;"><%= r.getRevContent() %></td>
					<% }else { %>
						<td colspan="2">
							<pre style="margin-top:20px; white-space:pre-wrap;"><%= r.getRevContent() %></pre>
						</td>
					<% } %>
					<td align="center">
						<a href="<%= contextPath %>/update.re?userNo=<%= loginUser.getUserNo() %>&revNo=<%= r.getRevNo() %>" id="edit-review" >수정</a>
					</td>
				</tr>
			<% } %> 
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6"><button type="button" class="btn-bottom btn-delete" onclick="deleteChecked();">삭제</button></td>
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
			var deleteElement = "";
				
			$(".check-review:checked").each(function(){
				deleteElement = deleteElement + ($(this).val()) + ",";
			})
			
			deleteElement = deleteElement.substring(0, deleteElement.lastIndexOf(","));
			
			$.ajax({
				url:"<%= contextPath %>/delete.re",
				data:{
					revNo:deleteElement
					},
				success:function(result){
					alert("선택한 상품 삭제에 성공하였습니다.");
					location.reload();
				}, 
				error:function(){
					alert("선택한 상품 삭제에 실패하였습니다.");
				}
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

			// 리뷰 수정 버튼을 누르면 리뷰 수정 페이지로 이동하는 함수
			$("#edit-review").click(function(){
				$("input[name=proCode]").val( $(this).next().val() );
				$("#btn-submit").click();
			})
			
		})
	</script>
	
	   <%@ include file="../common/footerbar.jsp" %>
	

</body>
</html>