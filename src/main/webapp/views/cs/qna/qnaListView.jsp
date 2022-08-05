<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page 
	import="java.util.ArrayList, com.us.cs.qna.model.vo.Qna, com.us.common.model.vo.PageInfo" 
%>
<%
	ArrayList<Qna> list = (ArrayList<Qna>)request.getAttribute("list");
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

   <%@ include file="/views/common/menubar.jsp" %>
   
   <div class="container">
        <br><br><br><br><br><br><br><br><br>
        
        <h2 class="menu_title">Q&A 게시판</h2> <br>
        <h5 class="menu_title_detail font_bold_gray">
            1 : 1 문의 게시판입니다. <br>
            Earth.Us에게 궁금한 점을 물어 보세요. <br>
            상품 문의는 상품 상세 페이지를 확인해 주세요. <br><br>

            ※고객센터 운영시간(10:00 ~ 18:00) 이후 문의는 고객센터 운영시간 내에 순차적으로 답변드립니다.

        </h5>
        <br> 
        <hr class="my-hr2"> <br>

		<br><br>
        <div class="container">

            <table class="CS_table table-hover table qna_table list-area">
              <thead>
                <tr>
                  <th>No</th>
                  <th>처리상태</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>작성일</th>
                </tr>
              </thead>
              <tbody>
              	
              	<!-- 전체  -->
                <% for(Qna q : list) { %>
                    <tr>
                        <td><%= q.getQnaNo() %></td>
                        
                        <!-- 처리중과 답변완료 구분 -->
                        <td>
                        	<% if( q.getQnaAnswer() == null ) { %>
                        		처리중
                        	<% } else { %>
                        		답변완료
                        	<% } %>
                        </td>
                        
                        <!-- 일반 제목과 비밀글 구분 -->
                        <td>
                        	<% if( q.getQnaPwd() == null ) { %>
                        		<%= q.getQnaTitle() %>
                        	<% } else { %>
                        		비밀글입니다 <i class="ti-lock"></i>
                        	<% } %>
                        </td>
                        
                        <td>
                        	<% String qnaId = q.getQnaWriter(); %>
                        	<% int end = qnaId.length(); %>
                        	<%= "***" + qnaId.substring(3, end) %>
                        </td>
                        
                        <td>
							<%= q.getQnaEnrollDate() %>
                        </td>
                    </tr>
                    
                <% } %>
              
              </tbody>
            </table>
            
         	<script>
            	$(function(){
            		$(".list-area>tbody>tr").click(function(){
            			// 비밀글일 경우
            			let qqq = $(this).children().eq(0).text();
            			console.log($(this).children().eq(0).text());
            			
            			if( $(this).children().eq(2).text().search("비밀글입니다.") != -1 ){
            				$(this).attr("data-toggle", "modal");
                            $(this).attr("data-target", "#insert_qnaPwd");
                            
                            
                            $("#checkQnaPwd").click(function(){
	                            <!-- 비밀글 비밀번호 체크 -->
	                            $.ajax({
	                            	url:"<%= contextPath %>/checkPwd.qa",
	                            	data:{
	                            		"inputPwd":$("#inputpwd").val(),
	                            		"qNo":qqq
	                            		},
	                            	success:function(result){
	                            		if(result == "YYY"){	// 비밀번호 일치
	                            			$("#outputResult").empty();
	                            			location.href = "<%= contextPath %>/detail.qa?qno=" + qqq;
	                            		} else{
	                            			console.log("뭐야;;");
	                            			$("#outputResult").html("<span class='tb_enroll_star'>비밀번호가 틀립니다.</span>");
	                            		}
	                            		
	                            	}, error:function(){
	                            		console.log("ajax Q&A 비밀번호 통신 실패");
	                            	}
	                            });
                            	
                            });
 		                   
                            
            			} else{
            				$(this).removeAttr("data-toggle");
                           	$(this).removeAttr("data-target");
	            			location.href = "<%= contextPath %>/detail.qa?qno=" + $(this).children().eq(0).text();
            			}
            			
            		});
            	})
         	</script>
            
            
            <!-- 비밀번호 네자리 입력 모달창 -->
            <div class="modal fade" id="insert_qnaPwd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		       <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
		           <!--Content-->
		           <div class="modal-content modal_alert">
		
		               <!--Body-->
		               <div class="modal-body text-center modal_alert_child">
		
		                   <h4 class="mt-1 mb-2">비밀번호 네자리를 입력하세요.</h4>
		
		                   <div class="md-form ml-0 mr-0">
		                       <input type="password" id="inputpwd"
		                           class="form-control form-control-sm validate ml-0">
		                       <div id="outputResult"></div>
		                   </div>
		
		                   <div class="text-center mt-4">
		                       <button type="button" id="checkQnaPwd" class="btn btn_green btn_medium">확인</button>
		                       <button type="button" class="btn btn_gray btn_medium" data-dismiss="modal">취소</button>
		                   </div>
		                   
		                   
		                   
		               </div>
		
		           </div>
		           <!--/.Content-->
		       </div>
		   </div>
            
            
            <br>

            <div style="width:85%; margin:auto;">
              <div align="right">
                  <button type="button" class="btn btn_green" onclick="location.href='<%= contextPath %>/write.qa'">글쓰기</button>
              </div>
            </div>
            
            <br><br><br><br>

            <!-- 페이징바 영역 -->
            <div class="paging-area" align="center">
            	<% if(currentPage != 1) { %>
            		<button class="btn btn_green" onclick="location.href='<%= contextPath %>/list.qa?qpage=<%= pi.getCurrentPage() -1 %>';">&lt;</button>
            	<% } %>
            	
            	<% for(int p = startPage; p <= endPage; p++) { %>
            		<% if(p == currentPage) { %>
            			<button class="btn btn_gray" disabled><%= p %></button>
            		<% } else { %>
            		 	<button class="btn btn_green" onclick="location.href = '<%= contextPath %>/list.qa?qpage=<%= p %>';"><%= p %></button>
            		<% } %>
            	<% } %>
            
            	<% if(currentPage != maxPage) { %>
            		<button class="btn btn_green" onclick="location.href='<%= contextPath %>/list.qa?qpage=<%= pi.getCurrentPage() + 1 %>';">&gt;</button>
            	<% } %>
            
            </div>
            
            
            <br><br><br><br><br><br><br><br><br>
            
		   
          </div>
      </div>
   
		   <%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>