<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.us.contents.model.vo.Contents, com.us.common.model.vo.PageInfo"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Contents> list = (ArrayList<Contents>)request.getAttribute("adList");
		
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
    .list-area:hover {
    	background: #F2F2F2;
    	cursor:pointer;
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
                   <h3 class="mt-4" style="font-weight:bold;">콘텐츠 관리</h3>
                   <hr><br><br>
                   
                    <table>
                        <tr>
                            <th width="5%" height="50px">
                               <input type="checkbox" id="checkAll">
                            </th>
                            <th width="5%">No.</th>
                            <th width="55%">제목</th>
                            <th width="15%">작성일</th>
                            <th width="10%">조회수</th>
                            <th width="10%">좋아요 수</th>
                        </tr>
                        <% if(list.isEmpty()) { %>
                            <tr>
                                <td colspan="6">존재하는 콘텐츠가 없습니다.</td>
                            </tr>  	
                        <% } else { %>
                            <% for(Contents c : list) { %>
                                <tr class="list-area">
                                    <td onclick="event.stopPropagation();"> <!-- 해당 td 클릭 시에는 수정 페이지로 이동하지 않게 함-->
                                        <input type="checkbox" name="check" value="<%= c.getCntNo() %>">
                                    </td>
                                    <td><%= c.getCntNo() %></td>
                                    <td><%= c.getCntTitle() %></td>
                                    <td><%= c.getCntEnrollDate() %></td>
                                    <td><%= c.getCntCount() %></td>
                                    <td><%= c.getCntLike() %></td>
                                </tr>
                            <% } %>
                        <% } %>
                    </table>

                    <button class="btn_admin" id="btn_delete" style="float: left; margin-left: 10%;" data-bs-toggle="modal" data-bs-target="#jyModal_noCheck">선택 삭제</button>
                    <button class="btn_admin" style="float: right; margin-right: 10%;" id="btn_enroll">새 글 작성</button>
					<br><br><br><br>
					
			        <!-- 페이징바 영역 -->
			        <div class="paging-area" align="center">
			        	<% if(currentPage != 1) {%>
			            	<button onclick="location.href='<%=contextPath%>/adList.co?cpage=<%= pi.getCurrentPage()-1 %>';" class="btn btn_black">&lt;</button>
						<% } %>
						
						<% for(int p=startPage; p<=endPage; p++) { %>
				            <% if(p == currentPage){ %>
				            	<button class="btn btn_gray" disabled><%= p %></button>
				            <% }else { %>
				            	<button class="btn btn_black" onclick="location.href='<%=contextPath%>/adList.co?cpage=<%= p %>';"><%= p %></button>
							<% } %>
						<% } %>
						
						<% if(currentPage != maxPage) { %>
			            <button onclick="location.href='<%=contextPath%>/adList.co?cpage=<%= pi.getCurrentPage()+1 %>';" class="btn btn_black">&gt;</button>
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
                            // 새 글 작성
							$("#btn_enroll").click(function(){
								location.href = '<%=contextPath%>/enrollForm.co';
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
                            
                            // 체크박스 체크/체크해제시 선택삭제 버튼의 모달 속성 변경
                            var checkCnt = "";
							$("input:checkbox[name=check]").change(function(){
								checkCnt = "";
								$("input:checkbox[name=check]:checked").each(function(){
	                                checkCnt += ($(this).val()) + ","; // 체크된 것만 게시글번호 뽑기 "2,3,4,"
	                            })
	                            checkCnt = checkCnt.substring(0,checkCnt.lastIndexOf(",")); // 맨 뒤 콤마 삭제 "2,3,4"
								
								if(checkCnt == ''){ // 선택된 체크박스 하나도 없을 경우
	                	            $("#btn_delete").attr("data-bs-target", "#jyModal_noCheck");
	                                
	                            }else{ // 선택된 체크박스 있을 경우
		                            $("#btn_delete").attr("data-bs-target", "#jyModal_confirm");
	                            }
								
							})                                                     
                            
							// 선택한 게시글 삭제
	                        $("#realDelete").click(function(){
                                $.ajax({
                                    url:"<%= contextPath%>/delete.co",
                                    data:{"checkCnt":checkCnt},
                                    success:function(result){
                        				if(result > 0){ // 게시글 삭제 성공
	                                        location.reload();
                        				}else{
                        					alert("게시글 삭제에 실패하였습니다.");
                        				}
                                    },
                                    error:function(){
                                        console.log("ajax 게시글 삭제 실패")
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