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

   <%@ include file="/views/common/menubar.jsp" %>
   
   <div class="container">
        <br><br><br><br><br><br><br><br><br>
        
        <h2 class="menu_sub_title menu_sub_margin">Q&A 게시판</h1> <br>
        <h5 class="font_bold_gray menu_sub_margin">
            어스에게 궁금한 점을 물어 보세요. <br>
            상품 문의는 상품 상세 페이지를 확인해 주세요.
            <br><br>
            ※고객센터 운영시간(10:00 ~ 18:00) 이후 문의는 고객센터 운영시간 내에 순차적으로 답변드립니다.
        </h5>
        <hr class="my-hr2"> <br>

		<form action="<%= contextPath %>/delete.qa" method="post">
			<input type="hidden" name="qNo" value="<%= q.getQnaNo() %>">
		
	        <div class="container" style="width:80%;">
	            <br><br>
	            <table class="table-sm width_hundred tb_qna_detail table-bordered">
	                <tr>
	                    <th>제목</th>
	                    <td>
	                        &nbsp;&nbsp;<%= q.getQnaTitle() %>
	                    </td>
	                </tr>
	                <tr>
	                    <th>작성자</th>
	                    <td>
	                        <% String name = q.getQnaWriter(); %>
	                        <% int length = name.length(); %>
	                        <% int end = length - (length / 2); %>
	                        <% String str = ""; %>
	                        <% for(int a = 0; a < length / 2; a++){ %>
	                        	<% str += "*"; %>
	                        <% } %>
	                        &nbsp;&nbsp;<%= name.substring(0, end) + str %>
	                    </td>
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
	            </table>
				<br><br><br>
				
	            <hr class="my-hr2"></hr>
	
	            <div class="qna_content">
	                <p>
	                <%= q.getQnaContent() %>
	                </p>
	            </div>
	
	            <hr class="my-hr2">
	            <br>
				
				<% if( q.getQnaAnswer() != null) { %>
					<table class="width_hundred">
	                	<tr class="qna_ans">
		                    <th style="width:25%; text-align:center;">Earth.Us</th>
		                    <td>
		                        <div>
		                        <p style="white-space: pre-line; width: 80%; padding: 15px;"><%= q.getQnaAnswer() %></p>
		                        </div>
		                    </td>
		                </tr>
	            	</table	>
	            <br>
	            <hr class="my-hr2">
				<% } %>
	            <!-- 답변완료시 -->
	            
	            
	            <!-- 로그인한 회원 본인이 작성한 글이 아니면 비활성화 -->
	            
	            <% if( (loginUser != null) && loginUser.getUserId().equals(q.getQnaWriter()) ) { %>
		           		<div class="qna_detail_btn">
			                <button type="button" class="btn btn_gray" 
			                onclick="location.href='<%= contextPath %>/updateForm.qa?qno=<%= q.getQnaNo() %>';">
			                수정</button>
			                <button type="button" class="btn btn_gray" data-toggle="modal" data-target="#delete_qna">
			                삭제</button>
			            </div>
	            <% } %>
	            
	            <!-- 삭제 모달창 -->
	            <div class="modal fade" id="delete_qna" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			        <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
			            <!--Content-->
			            <div class="modal-content modal_alert">
			
			                <!--Body-->
			                <div class="modal-body text-center modal_alert_child">
			                    <div>
			
			                        <h4 class="mt-1 mb-2" style="font-size: 20px;">정말 삭제하시겠습니까?</h4>
			                        <div class="text-center mt-4"> 
			                        	<br class="btn_two_center">
			                            <button type="button" class="btn btn_green btn_gray btn_medium" data-dismiss="modal">취소</button>
			                            &nbsp;&nbsp;
			                            <button type="button" class="btn btn_green btn_medium" data-toggle="modal" data-target="#delete_qna_success" data-dismiss="modal">확인</button>
			                        </div>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
			    
			    <!-- 삭제 확인 모달창 -->
				    <div class="modal fade" id="delete_qna_success" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				        <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
				            <!--Content-->
				            <div class="modal-content modal_alert">
				
				                <!--Body-->
				                <div class="modal-body text-center modal_alert_child">
				                    <div>
				
				                        <h4 class="mt-1 mb-2" style="font-size: 20px;">삭제되었습니다.</h4>
				                        <br>
				                        <div class="text-center mt-4"> 
				                            <button type="submit" id="deleteBtn" class="btn btn_green btn_green btn_medium">확인</button>
				                        </div>
				                    </div>
				                </div>
				            </div>
				        </div>
				    </div>
	            
	
	            <br><br><br><br><br>
	            <div style="text-align: center;">
	                <button type="button" class="btn btn_green btn-lg" style="width:40%;" onclick="location.href='<%= contextPath %>/list.qa?qpage=1';">목록으로 돌아가기</button>
	            </div>
	            
	            <br><br><br><br><br><br><br><br><br>
	
	        </div>
	    </form>
    </div>
   
   <%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>