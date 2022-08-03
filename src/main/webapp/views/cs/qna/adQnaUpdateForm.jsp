<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.us.cs.qna.model.vo.Qna, com.us.common.model.vo.Attachment"%>
<%
	Qna q = (Qna)request.getAttribute("q");
	Attachment at = (Attachment)request.getAttribute("at");
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
                    <h3 class="mt-4" style="font-weight:bold">Q&A 관리</h3>
		            <hr>
		            
		            <br><br>
		            
		            <form action="<%= contextPath %>/adUpdate.qa" method="post" id="adQnaUpdateForm">
		            	<input type="hidden" name="ansWriter" value="<%= loginUser.getUserNo() %>">
		            	<input type="hidden" name="qNo" value="<%= q.getQnaNo() %>">
	                    <div style="width: 90%" class="main_width">
	                        <table class="M_qna_table table table-bordered">
	                            <tr>
	                                <th>제목</th>
	                                <td>&nbsp;&nbsp;<%= q.getQnaTitle() %></td>
	                            </tr>
	                            <tr>
	                                <th>작성자</th>
	                                <td>&nbsp;&nbsp;<%= q.getQnaWriter() %></td>
	                            </tr>
	                            <tr>
	                                <th>작성일</th>
	                                <td>&nbsp;&nbsp;<%= q.getQnaEnrollDate() %></td>
	                            </tr>
	                            <tr>
	                                <th>첨부파일</th>
	                                <td>
	                                	<!-- 파일이 없는 경우 -->
				                        <% if(at == null) { %>
				                        	&nbsp;&nbsp;첨부파일이 없습니다.
				                        <% } else { %>
				                        	<!-- 첨부파일 클릭시 다운로드 -->
				                        	<a download="<%= at.getOriginName() %>" href="<%= contextPath %>/<%= at.getFilePath() %> + <%= at.getChangeName() %>">
				                        	&nbsp;&nbsp;<%= at.getOriginName() %>
				                        	</a>
				                        <% } %>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>내용</th>
	                                <td>
	                                    <div style="height:200px; overflow: auto; padding: 10px;">
	                                    
		                                    <!-- 이미지 미리보기 -->
								            <!-- 파일이 있는 경우 -->
							                <% if(at != null) { %>
							                	<p style="white-space: pre;"><%= q.getQnaContent() %>
	                                        	</p>
	                                        	
							                	<div class="qna_img">
							                    	<img id="titleImg" src = "<%= contextPath %>/<%= at.getFilePath() + at.getChangeName() %>">
							                	</div>
								            <% } else {%>
								            	<p style="white-space: pre;"><%= q.getQnaContent() %>
	                                        	</p>
								            <% } %>
							            
	                                    </div>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th style="height: 120px;">답변</th>
	                                <!-- 입력했던 답변이 쓰여져있음 -->
	                                <td>
	                                    <div style="height: 120px; overflow: auto;">
	                                    
	                                    	<!-- 답변이 비어있을 때 -->
	                                        <% if( q.getQnaAnswer() != null ) {%>
<textarea style="white-space: pre;" name="qnaAns" id="qnaAns" placeholder="답변을 입력해주세요." required><%= q.getQnaAnswer() %></textarea>
	                                        <% } else {%>
<textarea style="white-space: pre;" name="qnaAns" id="qnaAns" placeholder="답변을 입력해주세요." required></textarea>
	                                        <% } %>
	                                        
	                                    </div>
	                                </td>
	                            </tr>
	                        </table>
	
	                        <br><br>
	
	                        <div class="btn_right">
	                            <button type="button" class="btn btn_gray btn_qna" onclick="location.href='<%= contextPath %>/adList.qa?qpage=1';">돌아가기</button>
	                            &nbsp;&nbsp;
	                            <button type="button" id="updateBtn" class="btn btn_black btn_qna">답변 입력/수정</button>
	                        </div>
	                    </div>
	                    
	                    <script>
	                    // 모달 클릭 두번해야함 다른 예시보고 고치기
	                    	$(document).ready(function(){
	    							if( $("#qnaAns").val() == "" ){ 
	    								$("#updateBtn").attr("data-bs-toggle", "modal");
                               			$("#updateBtn").attr("data-bs-target", "#nowrite_pe");
	    							} 
	    								
	    							$("#qnaAns").on("propertychange change keyup paste input", function() {
	    								if( $("#qnaAns").val() != "" ){ 
		    								$("#updateBtn").removeAttr("data-bs-toggle");
	                               			$("#updateBtn").removeAttr("data-bs-target");
	    								}		
	    							})
	    							
	    							$("#updateBtn").click(function(){
	    								$("#adQnaUpdateForm").submit();
	    							})
	    						})
	                    </script>
	                    
	                    <!-- textarea가 빈 칸일 때 모달 -->
	                    <div class="modal" id="nowrite_pe" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
								<!--Content-->
								<div class="modal-content modal_alert">
						
									<!--Body-->
									<div class="modal-body text-center modal_alert_child">
						
										<h4 class="mt-1 mb-2">답변을 입력해주세요.</h4>
										<br>
										<div class="text-center mt-4"> 
											<button type="button" class="btn btn_black btn_medium" data-bs-dismiss="modal">확인</button>
										</div>
									</div>
								</div>
							</div>
						</div>
	                    
	                    
					</form>


                </div>
            </main>

        </div>
   </div>
   
   

</body>
</html>