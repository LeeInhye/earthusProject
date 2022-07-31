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
      <br><br><br><br><br><br>
        <div>
            <h2 class="menu_sub_title menu_sub_margin">Q&A 내역</h2> <br>
            <h5 class="font_bold_gray menu_sub_margin">
              1 : 1 문의 게시판입니다. <br>
              Earth.Us에게 궁금한 점을 물어 보세요. <br>
              상품 문의는 상품 상세 페이지를 확인해 주세요. <br><br>
  
              ※고객센터 운영시간(10:00 ~ 18:00) 이후 문의는 고객센터 운영시간 내에 순차적으로 답변드립니다.
            </h5>
            
            <div class="sub_sub_menu">
                <button type="button" class="btn btn_light_green go_mypage" onclick="location.href='<%= contextPath %>/myPage.mp';"> > &nbsp;&nbsp;마이페이지</button>    
            </div>
			<br>
        </div>
        
        <hr class="my-hr3"> <br>

        <br>

        <br><br><br><br>


        <div class="container">

            <table class="CS_table table-hover table qna_table list-area">
              <thead>
                <tr>
                  <th>No</th>
                  <th>처리상태</th>
                  <th>제목</th>
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
                        
                        <!-- 일반 제목과 비밀글 구분없음-->
                        <td><%= q.getQnaTitle() %></td>
                        
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
	            			location.href = "<%= contextPath %>/mpDetail.qa?qno=" + $(this).children().eq(0).text();
            			})
            			
            		});
         	</script>
            
            <br>

            
            <br><br><br><br>

            <!-- 페이징바 영역 -->
            <div class="paging-area" align="center">
            	<% if(currentPage != 1) { %>
            		<button class="btn btn_green" onclick="location.href='<%= contextPath %>/mpList.qa?mqpage=<%= pi.getCurrentPage() -1 %>';">&lt;</button>
            	<% } %>
            	
            	<% for(int p = startPage; p <= endPage; p++) { %>
            		<% if(p == currentPage) { %>
            			<button class="btn btn_gray" disabled><%= p %></button>
            		<% } else { %>
            		 	<button class="btn btn_green" onclick="location.href = '<%= contextPath %>/mpList.qa?mqpage=<%= p %>';"><%= p %></button>
            		<% } %>
            	<% } %>
            
            	<% if(currentPage != maxPage) { %>
            		<button class="btn btn_green" onclick="location.href='<%= contextPath %>/mpList.qa?mqpage=<%= pi.getCurrentPage() + 1 %>';">&gt;</button>
            	<% } %>
            
            </div>
            
            
            <br><br><br><br><br><br><br><br><br>
            
		   
          </div>
      </div>
   
   <%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>