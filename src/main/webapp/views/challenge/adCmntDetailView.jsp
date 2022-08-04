<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.us.challenge.model.vo.*, com.us.common.model.vo.PageInfo" %>
<%
	Challenge ch = (Challenge)request.getAttribute("ch");
	ArrayList<Comment> list = (ArrayList<Comment>)request.getAttribute("list");

	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<style>
   table{
           border:2px solid lightgray;
           font-size:small;
           text-align:center;
           width:80%;
           margin:auto;
       }
    table td{
    	border:1px solid lightgray;
    	height: 40px;
    }
    table th{
    	background-color:rgba(211, 211, 211,0.5);
    	border:1px solid lightgray;
    	height: 50px;
    }
    .bold {
        font-weight: bold;
        font-size: 18px;
    }
    .flex{
        flex-direction: row;
        justify-content: space-around;
    }
    #btn_point {
        font-size: 12px;
        background: #778C79;
    }
</style>
</head>
<body>

    <%@ include file="/views/common/adminMenubar.jsp" %>

	<div id="layoutSidenav">
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<br>
					<h3 class="mt-4" style="font-weight:bold;">챌린지 댓글 관리</h3>
					<hr><br><br>
                    
                    <div style="display: flex" class="flex">
                        <div>
                            <label class="bold">챌린지명 : </label>
                            <label><%= ch.getChallTitle() %></label>
                        </div>
                        <div> 
                            <label class="bold">지급 포인트 : </label>
                            <label><%= ch.getChallPoint() %> P</label>
                        </div>
                        <div>
                            <label class="bold">처리 상태 : </label>
                            <select name="" id="">
                                <option value="">전체</option>
                                <option value="">미지급</option>
                                <option value="">지급완료</option>
                            </select>
                        </div>
                    </div>
					<br><br>
					
					<table>
						<tr>
							<th width="5%" height="50px">
								<input type="checkbox" id="checkAll">
							</th>
							<th width="5%">No.</th>
							<th width="7%">처리 상태</th>
							<th width="55%">댓글 내용</th>
							<th width="7%">작성자</th>
							<th width="12%">작성일</th>
							<th width="14%">처리</th>
						</tr>
						<% if(list.isEmpty()) { %>
							<tr>
								<td colspan="6">존재하는 댓글이 없습니다.</td>
							</tr>  	
						<% } else { %>
							   <% for(Comment cmnt : list) { %>
								<tr class="list-area">
									 <td>
										<input type="checkbox" name="check" value="<%= cmnt.getCmntNo() %>">
									</td>
									<td><%= cmnt.getCmntNo() %></td>
                                    <td>
                                        <% if( cmnt.getCmntStatus().equals("Y") ) { %>
											<label>지급완료</label>
										<% } else { %>
											<label>미지급</label>
										<% } %>
                                    </td>
									<td><%= cmnt.getCmntContent() %></td>
									<td><%= cmnt.getCmntWriter() %></td>
									<td><%= cmnt.getCmntEnrollDate() %></td>
									<td>
                                        <button type="button" class="btn btn-dark" id="btn_point">지급하기</button>
                                    </td>
								</tr>
							<% } %>
						<% } %>
					</table>
 
						<button class="btn_admin" id="btn_delete" style="float: left; margin-left: 10%;" data-bs-toggle="modal" data-bs-target="#jyModal_noCheck">선택 삭제</button>
						<a href="<%= contextPath %>/adCmntMain.ch?cpage=1" class="btn_admin" style="float: right; margin-right: 10%; text-decoration:none;">챌린지 목록</a>
	 					<br><br><br><br><br>
						
				       <!-- 페이징바 영역 -->
				       <div class="paging-area" align="center">
				        	<% if(currentPage != 1) { %>
				            	<button onclick="location.href='<%=contextPath%>/adCmntDetail.ch?no=<%= ch.getChallNo() %>&cpage=<%= pi.getCurrentPage()-1 %>';" class="btn btn_black">&lt;</button>
							<% } %>
							
							<% for(int p=startPage; p<=endPage; p++) { %>
					            <% if(p == currentPage){ %>
					            	<button class="btn btn_gray" disabled><%= p %></button>
					            <% }else { %>
					            	<button class="btn btn_black" onclick="location.href='<%=contextPath%>/adCmntDetail.ch?no=<%= ch.getChallNo() %>&cpage=<%= p %>';"><%= p %></button>
								<% } %>
							<% } %>
							
							<% if(currentPage != maxPage) { %>
				            <button onclick="location.href='<%=contextPath%>/adCmntDetail.ch?no=<%= ch.getChallNo() %>&cpage=<%= pi.getCurrentPage()+1 %>';" class="btn btn_black">&gt;</button>
				            <% } %>
				       </div>
				       <!-- 페이징바 영역 끝 -->
				        		        
	                   <!-- 모달: 게시글 선택 안 했을 경우 -->
	                    <div class="modal" id="jyModal_noCheck">
	                        <div class="modal-dialog modal-dialog-centered">
	                            <div class="modal-content">
	                                <!-- Modal Header -->
	                                <div class="modal-header">
	                                <button type="button" class="modal_close" data-bs-dismiss="modal" style="margin-left: 95%;">&times;</button>
	                                </div>
	                                <!-- Modal body -->
	                                <div class="modal-body" style="text-align: center;">
	                                삭제할 게시글을 선택해 주세요.
	                                </div>
	                                <!-- Modal footer -->
	                                <div class="modal-footer">
	                                <button type="button" class="btn btn-dark" data-bs-dismiss="modal">확인</button>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <!-- 모달 끝 -->
	
	                    <!-- 모달: 삭제 컨펌 -->
	                    <div class="modal" id="jyModal_confirm">
	                        <div class="modal-dialog modal-dialog-centered">
	                            <div class="modal-content">
	                                <!-- Modal Header -->
	                                <div class="modal-header">
	                                <button type="button" class="modal_close" data-bs-dismiss="modal" style="margin-left: 95%;">&times;</button>
	                                </div>
	                                <!-- Modal body -->
	                                <div class="modal-body" style="text-align: center;">
	                                정말 삭제하시겠습니까?
	                                </div>
	                                <!-- Modal footer -->
	                                <div class="modal-footer">
	                                <button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
	                                <button type="button" class="btn btn-dark" id="realDelete">확인</button>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <!-- 모달 끝 -->
				        
					 <script>
						 $(function(){
							 // 목록 버튼
							 $("#btn_back").click(function(){
								 location.href = '<%=contextPath%>/adCmntMain.ch';
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
 
                            // 체크박스 체크/체크해제시 선택삭제 버튼의 모달 속성 변경
                            var checkCmnt = "";
							$("input:checkbox").change(function(){
								checkCmnt = "";
								$("input:checkbox[name=check]:checked").each(function(){
									checkCmnt += ($(this).val()) + ","; // 체크된 것만 게시글번호 뽑기 "2,3,4,"
	                            })
	                            checkCmnt = checkCmnt.substring(0,checkCmnt.lastIndexOf(",")); // 맨 뒤 콤마 삭제 "2,3,4"
								console.log(checkCmnt);
								if(checkCmnt == ''){ // 선택된 체크박스 하나도 없을 경우
	                	            $("#btn_delete").attr("data-bs-target", "#jyModal_noCheck");
	                                
	                            }else{ // 선택된 체크박스 있을 경우
		                            $("#btn_delete").attr("data-bs-target", "#jyModal_confirm");
	                            }
								
							})                                                     
                            
							// 선택한 게시글 삭제
	                        $("#realDelete").click(function(){
                                $.ajax({
                                    url:"<%= contextPath%>/adCmntDelete.ch",
                                    data:{"checkCmnt":checkCmnt},
                                    success:function(result){
                        				if(result > 0){ // 게시글 삭제 성공
	                                        location.reload();
                        				}else{
                        					alert("게시글 삭제에 실패하였습니다.");
                        				}
                                    },
                                    error:function(){
                                        console.log("ajax 게시글 삭제 실패");
                                    }
                                })
                            })

						})
					 </script>
 
				</div>
			</main>
 
		</div>
	 </div>

</body>
</html>