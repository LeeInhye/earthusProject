<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.us.cs.homepage.model.vo.Banner, java.util.ArrayList" %>
<%
	ArrayList<Banner> list = (ArrayList<Banner>)request.getAttribute("list");
	String errorMsg = (String)session.getAttribute("errorMsg");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>배너 관리</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="/resources/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Modal -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- Modal -->

<!-- My Style -->
<style>
.banner-manage-body {
	padding-top: 50px;
	margin: auto;
}

#datatablesSimple {
	color: #404040;
}

#add-btn {
	width: 100px;
	height: 40px;
	border: 0px;
	border-radius: 5px;
	background-color: #778C79;
	color: #F2F2F2;
	font-weight: bold;
}

.dataTable-info {
	visibility: hidden;
}

.modal-body {
	padding-top: 50px;
	width: 80%;
	margin: auto;
}

.thumbnail-img {
	width: 100%;
	margin: auto;
	height: 100px;
	border: 1px solid black;
}

#banner-status * {
	display: inline-block;
	margin-top: 30px;
}

.modal-body p {
	font-weight: bold;
}
</style>
<!-- My Style -->
</head>
<body>
	<%@ include file="../../common/adminMenubar.jsp"%>
	<div id="layoutSidenav">
		<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<div class="banner-manage-body" style="width: 800px;">
					<h1 class="mt-4" style="padding-top: 50px;">배너 관리</h1>
					<hr>
					<table id="datatablesSimple" class="banner-manage ">
						<thead>
							<tr>
								<th width="10px">NO</th>
								<th width="100px;">상태</th>
								<th width="600px;">이미지</th>
							</tr>
						</thead>
						<tbody>
							<% for(Banner b : list){ %>
							<tr>
								<td><%=b.getBnNo()%></td>
								<td><%=b.getBnStatus()%></td>
								<td height="150px;">
									<a href="" id="activate-edit-modal" data-toggle="modal" data-target="#edit-banner">
										<img src="<%=b.getBnImgURL()%>" style="height:100%;">
									</a>
								</td>
							</tr>
							<% } %>
						</tbody>
					</table>
	
					<div align="right">
						<button type="button" id="add-btn" data-toggle="modal" data-target="#add-banner">배너 등록</button>
					</div>
	
					<br> <br> <br> <br> <br>
				</div>
	
				<!-- 페이징 처리 필요 없음 -->
	
			</div>
		</main>
	</div>
	<!-- ========== START MODAL AREA ========== -->
	<!-- Modal - Edit Banner -->
	<div class="modal" id="edit-banner">
		<div class="modal-dialog">

			<!-- Modal Content - Edit Banner -->
			<div class="modal-content">
				<form action="<%=contextPath%>/edit.bn" method="post" enctype="multipart/form-data">
					<div class="modal-header"><h3 class="modal-title">배너 수정</h3></div>
					
					<div class="modal-body">
						<p>배너 이미지 수정</p>
						<div>
							<img class="thumbnail-img"  onclick="insertImg();">
							<input type="file" name="banner-img" id="eidt-img" onchange="loadImg(this);" style="visibility: hidden;">
							<!-- 파일 업로드하면 업로드된 사진이 썸네일에 변경되어 보여야 함 -->
						</div>
						
						<div class="banner-status">
							<p style="padding-right: 10px;">배너 상태 수정</p>
							<select name="bn-status" id="bn-status">
								<option value="Y">공개</option>
								<option value="N">삭제</option>
							</select>
						</div>
					</div>
					
					<div class="modal-footer">
						<button type="submit" class="btn btn-default" data-dismiss="modal">수정하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>


	<!-- Modal - Add Banner -->
	<div class="modal" id="add-banner">
		<div class="modal-dialog">

			<!-- Modal Content - Add Banner -->
			<div class="modal-content">
				<form action="<%=contextPath%>/insert.bn" method="post" enctype="multipart/form-data">
					<div class="modal-header"><h3 class="modal-title">배너 등록</h3></div>
					
					<div class="modal-body">
						<p>배너 이미지 등록</p>
						<div>
							<img class="thumbnail-img" onclick="insertImg();">
							<input type="file" name="banner-img" id="insert-img" onchange="loadImg(this);" style="visibility: hidden;">
							<!-- 파일 업로드하면 업로드된 사진이 썸네일에 변경되어 보여야 함 -->
						</div>
						
						<div class="modal-footer">
							<button type="submit" class="btn btn-default" data-dismiss="modal">등록하기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		
	</div>
	<!-- ========== END MODAL CONTENT AREA ========== -->


	<!-- ========== START SCRIPT AREA ========== -->
	<script>
		// 썸네일 클릭하면 이미지 업로드할 수 있도록 만드는 함수
		function insertImg(){
			$("input").click();
		}
		
		// 썸네일에 선택한 이미지 미리보기하는 함수
		function loadImg(inputFile){
            if(inputFile.files.length == 1){
                const reader = new FileReader();
                reader.readAsDataURL(inputFile.files[0]);
				
                reader.onload = function(e){
                    // 매개변수 e : 이벤트가 발생한 요소의 정보를 담고 있는 요소객체(element)
                    // e.target.result = 읽어들인 파일의 고유한 url값
                    // console.log(e.target.result); -- FileReader가 읽어온 요소(이미지)의 고유한 url 출력

                    // num의 값에 따라 대표이미지/상세이미지에 첨부파일 이미지 담기도록
                    // jQuery의 attr(속성명, 속성값) : 해당 속성명의 속성값을 변경
                    switch(num){
                        case 1 : $("#thumbnail").attr("src", e.target.result); break;
                        case 2 : $("#contentImg1").attr("src", e.target.result); break;
                        case 3 : $("#contentImg2").attr("src", e.target.result); break;
                        case 4 : $("#contentImg3").attr("src", e.target.result); break;
                    }
                }

            }else{
                // 파일 선택 취소된 경우 : 미리보기로 보여졌던 이미지도 사라지게 만들기
                switch(num){
                        case 1 : $("#titleImg").attr("src", null); break;
                        case 2 : $("#contentImg1").attr("src", null); break;
                        case 3 : $("#contentImg2").attr("src", null); break;
                        case 4 : $("#contentImg3").attr("src", null); break;
                    }
            }
        };
		
		// 파일을 첨부하면 수정하기/등록하기 버튼이 활성화되도록 만드는 함수
		/* $(function(){
			$("input[type=file]").change(function(){
				$(".btn").removeAttr("disabled");
			})
		}) */
		
		$(function(){
			<% if(errorMsg != null){ %>
				alert("<%= errorMsg %>");
			<% }%>
		})
		
		
	</script>

</div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>
