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
    #btn_point_done {
        font-size: 12px;
        background: gray;
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
                            <select name="filter" class="selectStatus" onchange="selectStatus(1);">
                                <option value="" selected>전체</option>
                                <option value="N">미지급</option>
                                <option value="Y">지급완료</option>
                            </select>
                        </div>
                    </div>
					<br><br>
					
					<table id="pointTable">
						<thead>
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
						</thead>
						<tbody id="cmnt-area">
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
										<td id="btn_area">
											<% if( cmnt.getCmntStatus().equals("N") ) { %>
	                                        	<button type="button" class="btn btn-dark" id="btn_point">지급하기</button>
	                                        <% }else { %>
	                                        	<button type="button" class="btn btn-dark" id="btn_point_done" disabled>지급완료</button>
	                                        <% } %>
	                                    </td>
									</tr>
								<% } %>
							<% } %>
						</tbody>
					</table>
					<br><br>

					<script>
						// 포인트 지급
						$("#pointTable>tbody>tr").on("click", "td:last-child>button", function(){

  							// 회원명, 챌린지 글번호, 지급할 포인트, 댓글번호
							var userName = $(this).parent().parent().children().eq(4).text();
							var challNo = <%= ch.getChallNo() %>;
							var amount = <%= ch.getChallPoint() %>;
							var cmntNo = $(this).parent().parent().children().eq(1).text();
							
							$.ajax({
				    			url:"<%=contextPath%>/givePoint.ch",
				    			data:{no:challNo, cmntNo:cmntNo, userName:userName, amount:amount},
				    			success:function(result){ // 성공시 => 버튼 지급완료로 변경
				    				
				    				var value = "";
				    				
				    				value = '<button type="button" class="btn btn-dark" id="btn_point_done" disabled>지급완료</button>';
				    				
				    				$("#btn_area").html(value);
				    				
				    			}
							})
						
						})
					</script>
						
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
						
						// 처리상태 카테고리로 리스트 조회
						function selectStatus(page){
							 
							 $.ajax({
								 url:"<%= contextPath%>/filter.ch",
                                 data:{no:<%= ch.getChallNo() %>,
                                	   selectSt:$("select[name=filter] option:selected").val(),
                                	   cpage:page},
                                 success:function(map){
	                             	let contextPath = "<%=contextPath%>";
			        				let pi = map.pi;
			        				let list = map.list;
			        				
			        				let value = ""; // 댓글 리스트 
			        				let paging = ""; // 페이징 처리
			        				if(list.length == 0){
			        					value += "<tr>"
			        						   + "<td colspan='6'>존재하는 댓글이 없습니다.</td>"
			        						   + "</tr>"
			        				}else {
			        					// 댓글 리스트
			        					for(let i=0; i<list.length; i++) {
			          						switch(list[i].cmntStatus){
			          						case"N": list[i].cmntStatus = "미지급"; break;
			          						case"Y": list[i].cmntStatus = "지급완료"; break;
			          						}
			        						
			        						value += "<tr class='list-area'>"
			        							   + "<td>"
			        							   + "<input type='checkbox' name='check' value='" + list[i].cmntStatus + "'>'"
			        							   + "</td>"
			        							   + "<td>" + list[i].cmntNo + "</td>"
			        							   + "<td><label>" + list[i].cmntStatus + "</label></td>"
			        							   + "<td>" + list[i].cmntContent + "</td>"
			        							   + "<td>" + list[i].cmntWriter + "</td>"
			        							   + "<td>" + list[i].cmntEnrollDate + "</td>"
			        							   + "<td>" + "<button type='button' class='btn btn-dark' id='btn_point'>지급하기</button></td>"
			        							   + "</tr>";
			        					}
			        					
			            				// 페이징바
			            				if(pi.currentPage != 1) {
			            					paging += '<button onclick="selectStatus(' + (pi.currentPage-1) + ');" class="btn btn_black">&lt;</button>';
			            				}
			            				
			            				
			            				for(let p=pi.startPage; p<=pi.endPage; p++){
			            					
			            					if(p == pi.currentPage){
			            						paging += '<button class="btn btn_gray" disabled>' +  p + '</button>';
			            					}else{
			            						paging += '<button onclick="selectStatus(' + p + ');" class="btn btn_black">' + p + '</button>';
			            					}
			            					
			            				}
			            				
			            				if(pi.currentPage != pi.maxPage) {
			        						paging += '<button onclick="selectStatus(' + (pi.currentPage+1) + ');" class="btn btn_black">&gt;</button>';
			            				}
			        					
			        				}
			        				
                                	$("#cmnt-area").html(value);
		        				 	$(".paging-area").html(paging); 
                     					
                                 },
                                 error:function(){
                                     console.log("ajax 댓글 조회 실패")
                                 }
							 })
							 
						 }
						
					 </script>
 
				</div>
			</main>
 
		</div>
	 </div>

</body>
</html>