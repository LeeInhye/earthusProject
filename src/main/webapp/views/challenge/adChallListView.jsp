<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

	<%@ include file="/views/common/adminMenubar.jsp" %>


	<div id="layoutSidenav">
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<br>
					<h3 class="mt-4" style="font-weight:bold;">챌린지 관리</h3>
					<hr><br><br>
					
					<table>
						<tr>
							<th width="5%" height="50px">
								<input type="checkbox" id="checkAll">
							</th>
							<th width="5%">No.</th>
							<th width="55%">제목</th>
							<th width="15%">작성일</th>
							<th width="10%">지급 포인트</th>
							<th width="10%">댓글 수</th>
						</tr>
						

					</table>
 
						<button class="btn_admin" onclick="deleteContents();" style="float: left; margin-left: 10%;">선택 삭제</button>
						<button class="btn_admin" style="float: right; margin-right: 10%;" id="btn_enroll">새 글 작성</button>
 
					 <script>
						 $(function(){
							 // 새 글 작성
							 $("#btn_enroll").click(function(){
								 location.href = '<%=contextPath%>/enrollForm.ch';
							 })
								 
							 // 게시글 클릭시 해당 게시글 수정 페이지로 이동
							 $(".list-area").click(function(){
								 const cntNo = $(this).children().eq(1).text(); // 클릭한 글 번호
								 
								 location.href = '<%=contextPath%>/updateForm.co?no='+ cntNo;
							 })
							 
							 // 체크박스 전체선택, 전체해제 기능
							 $("#checkAll").click(function(){
 
								 if($("#checkAll").prop("checked")){
									 $("input[name=check]").prop("checked", true);
								 }else {
									 $("input[name=check]").prop("checked", false);
								 }
 
							 })
							 
							 // 전체선택 상태에서 체크박스 하나 해제시 헤더에 있는 체크박스도 해제되고,
							 // 목록의 체크박스들을 전부 선택시 헤더에 있는 체크박스가 선택되는 기능
							 $("input[name=check]").click(function(){
								 var total = $("input[name=check]").length;
								 var checked = $("input[name=check]:checked").length;
 
								 if(total != checked){
									 $("#checkAll").prop("checked", false);
								 }else {
									 $("#checkAll").prop("checked", true);
								 }
							 })
 
						 })
						 
						 // 선택 게시글 삭제
						 function deleteContents(){
							 var checkCnt = "";
 
							 $("input:checkbox[name=check]:checked").each(function(){
								 checkCnt = checkCnt + ($(this).val()) + ","; // 체크된 것만 게시글번호 뽑기 "2,3,4,"
							 })
 
							 checkCnt = checkCnt.substring(0,checkCnt.lastIndexOf(",")); // 맨 뒤 콤마 삭제 "2,3,4"
							 console.log(checkCnt);
							 
							 // 선택된 체크박스 없이 삭제 버튼 누른 경우
							 if(checkCnt == ''){
								 alert("삭제할 게시글을 선택하세요");
								 return false;
							 }
 
							 if(confirm("정말 삭제하시겠습니까?")) {
								 $.ajax({
									 url:"/us/delete.co",
									 data:{"checkCnt":checkCnt},
									 success:function(){
										 location.reload();
									 },
									 error:function(){
										 console.log("ajax 게시글 삭제 실패")
									 }
								 })
							 }							                            
 
						 }
					 </script>
 
				</div>
			</main>
 
		</div>
	 </div>

</body>
</html>