<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page 
	import="java.util.ArrayList, com.us.cs.notice.model.vo.Notice, com.us.common.model.vo.PageInfo" 
%>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

   <%@include file = "/views/common/adminMenubar.jsp" %>
   
   <div id="layoutSidenav">
       <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4 btnHover">
		        <br>
                    <h3 class="mt-4" style="font-weight:bold">공지사항</h3>
		            <hr>
		            
		            <br><br>
		            
                     <div style="width: 90%" class="main_width  sumin_font">
                     
                        <table class="M_member_table table table-hover">
                            <thead>
                                <tr class="table_thead_border" style="border-bottom: none;">
                                    <th width="3%"><input type="checkbox" onclick="checkAll(this);"></th>
                                    <th width="5%">번호</th>
                                    <th width="8%">카테고리</th>
                                    <th width="30%">제목</th>
                                    <th width="10%">작성일</th>
                                    <th width="5%">상태</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- 값은 다 DB와 연결될 것 -->
                                <% for(Notice n : list) { %>
                                <tr>
                                    <td><input type="checkbox" name="checkNotice" value="<%= n.getNoticeNo() %>"></td>
                                    <td><%= n.getNoticeNo() %></td>
                                    <td><%= n.getCsCategory() %></td>
                                    <td><%= n.getNoticeTitle() %></td>
                                    <td><%= n.getNoticeEnrollDate() %></td>
									<td><%= n.getNotice_status() %></td>
                                </tr>
                                <% } %>

                            </tbody>
                        </table>
                        <br><br>
                        
                        <div class="btn_two_spacing">
                            <button type="button" id="deleteBtn" class="btn btn_black" onclick="deleteNotice();">선택삭제</button>
                            <button type="button" class="btn btn_black btn-sm" onclick="location.href='<%= contextPath %>/adEnrollForm.no';">새글작성</button>
                        </div>
                    </div>
		         	
		         	<br><br>
		            
		            <!-- 페이징바 영역 -->
		            <div class="paging-area" align="center" id="pagingBar">
		            	<% if(currentPage != 1) { %>
		            		<button class="btn btn_black" onclick="location.href='<%= contextPath %>/adList.no?npage=<%= pi.getCurrentPage() -1 %>';">&lt;</button>
		            	<% } %>
		            	
		            	<% for(int p = startPage; p <= endPage; p++) { %>
		            		<% if(p == currentPage) { %>
		            			<button class="btn btn_gray" disabled><%= p %></button>
		            		<% } else { %>
		            		 	<button class="btn btn_black" onclick="location.href = '<%= contextPath %>/adList.no?npage=<%= p %>';"><%= p %></button>
		            		<% } %>
		            	<% } %>
		            
		            	<% if(currentPage != maxPage) { %>
		            		<button class="btn btn_black" onclick="location.href='<%= contextPath %>/adList.no?npage=<%= pi.getCurrentPage() + 1 %>';">&gt;</button>
		            	<% } %>
		            
		            </div>
		            
		            
		            <!-- 전체 선택 -->
		            <script>
		            	//checkAll 체크시 전체 체크됨
		            	function checkAll(checkAll){
		            		const checkboxes = document.querySelectorAll("input[type='checkbox']");
							checkboxes.forEach((checkbox) => {
								checkbox.checked = checkAll.checked;
							})
						}
					
						// 체크박스 전체 선택되면 맨 위의 체크박스도 자동 체크
						$(document).ready(function(){
							$("input[name='checkNotice']").click(function(){
								var count = $("input[name='checkNotice']").length;
								var checked = $("input[name='checkNotice']:checked").length;
								
								if(count != checked){
			        				$('#checkAll').prop("checked", false);
			        			} else{
			        				$("#checkAll").prop("checked", true);
			        			}
							});
						})
						
						$(function(){
		            		$(".M_member_table>tbody>tr").on("click", "td:not(:first-child)", function() {
		            			console.log($(this).children().eq(1).text());
		            			location.href = "<%= contextPath %>/adUpdateForm.no?nNo=" + $(this).children().eq(1).text();
		            			})
		            			
		            		});

					</script>
					
					
		         	<!-- 공지사항 삭제 모달창 -->
                    <div class="modal fade" id="adDeleteNotice" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                    <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
	                        <!--Content-->
	                        <div class="modal-content modal_alert">
	                            
	                            <!--Body-->
	                            <div class="modal-body text-center modal_alert_child">
	                                <div>
	                
	                                    <h5 class="mt-1 mb-2">정말 삭제하시겠습니까?</h5>
	                                    <br>                                
	                                    <div class="text-center mt-4"> 
	                                        <button type="button" id="next" class="btn btn_gray btn_medium" data-bs-dismiss="modal">취소</button>
	                                        <button type="button" id="realDelete" class="btn btn_black btn_medium">확인</button>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                
	                <button type="button" id="nocheckBtn" class="btn_trans" data-bs-toggle="modal" data-bs-target="#nocheck"></button>
	                <!-- 회원 선택 안했을 때 -->
	                <div class="modal fade" id="nocheck" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                    <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
	                        <!--Content-->
	                        <div class="modal-content modal_alert">
	                            
	                            <!--Body-->
	                            <div class="modal-body text-center modal_alert_child">
	                                <div>
	                
	                                    <h5 class="mt-1 mb-2">삭제할 공지사항을 선택해주세요.</h5>
	                                    <br>                                
	                                    <div class="text-center mt-4"> 
	                                        <button type="button" class="btn btn_black btn_medium" data-bs-dismiss="modal">확인</button>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                
	                
	                <script>
                	// 회원 삭제
                		function deleteNotice(){
                           var checkCnt = "";

                           $("input:checkbox[name=checkNotice]:checked").each(function(){
                               checkCnt = checkCnt + ($(this).val()) + ","; // 체크된 것만 게시글번호 뽑기 "2,3,4,"
                           })

                           checkCnt = checkCnt.substring(0,checkCnt.lastIndexOf(",")); // 맨 뒤 콤마 삭제 "2,3,4"
                           console.log(checkCnt);
						
                           // 선택된 체크박스 없이 삭제 버튼 누른 경우
                           if(checkCnt == ''){
                           	$("#deleteBtn").removeAttr("data-bs-toggle");
                           	$("#deleteBtn").removeAttr("data-bs-target");
                               $("#nocheckBtn").click();
                           }

                           else {
                           	$("#deleteBtn").attr("data-bs-toggle", "modal");
                           	$("#deleteBtn").attr("data-bs-target", "#adDeleteNotice");
                           	
                           	$("#realDelete").click(function(){
                           	
	                            $.ajax({
	                                url:"<%= contextPath %>/adDelete.no",
	                                data:{"checkCnt":checkCnt},
	                                success:function(result){
	                                	if(result > 0){
	                                		location.reload();
	                                	}
	                                },
	                                error:function(){
	                                    console.log("ajax 공지사항 삭제 실패")
	                                }
	                            })
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