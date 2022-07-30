<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page 
	import="java.util.ArrayList, com.us.cs.qna.model.vo.Qna, java.text.SimpleDateFormat,
			com.us.common.model.vo.PageInfo" 
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
                        	<% int end = qnaId.length() - 2; %>
                        	<%= qnaId.substring(0, end) + "****" %>
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
            			location.href = "<%= contextPath %>/detail.qa?no=" + $(this).children().eq(0).text();
            		});
            	})
            </script>
            
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
            		<button class="btn btn_green" onclick="location.href='<%= contextPath %>/list.qa?cpage=<%= pi.getCurrentPage() -1 %>';">&lt;</button>
            	<% } %>
            	
            	<% for(int p = startPage; p <= endPage; p++) { %>
            		<% if(p == currentPage) { %>
            			<button class="btn btn_gray" disabled><%= p %></button>
            		<% } else { %>
            		 	<button class="btn btn_green" onclick="location.href = '<%= contextPath %>/list.qa?cpage=<%= p %>';"><%= p %></button>
            		<% } %>
            	<% } %>
            
            	<% if(currentPage != maxPage) { %>
            		<button class="btn btn_green" onclick="location.href='<%= contextPath %>/list.qa?cpage=<%= pi.getCurrentPage() + 1 %>';">&gt;</button>
            	<% } %>
            
            </div>
            
            
            <br><br><br><br><br><br><br><br><br>
            
		   
          </div>
      </div>
   
		   <%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>