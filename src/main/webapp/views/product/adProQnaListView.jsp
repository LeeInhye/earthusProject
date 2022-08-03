<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.us.product.model.vo.ProQna, com.us.common.model.vo.PageInfo" %>
<%
	ArrayList<ProQna> list = (ArrayList<ProQna>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 문의 관리 - Admin</title>
<style>
.pro-a-btn {
	font-size:small !important;
	width:80px !important;
	height:35px !important;
}
.pageination{
	margin-top:20px;
}

</style>
</head>
<body>

	<%@ include file="../common/adminMenubar.jsp"%>
	
	<div id="layoutSidenav">
	
		<!-- 여기부터! -->
	   <div id="layoutSidenav_content">
	       <main>
	           <div class="container-fluid px-4">
	               <div class="container productQna">
	                   <h3 class="mt-4" style="font-weight:bold;">상품 > 상품 문의 관리</h3>
	                   <hr><br>
	
	                   <div class="container pro-info-area">
	                       <!-- 정렬 select 시작-->
	                       <select name="pro-qna-orderby" id="">
	                           <option value="all">전체</option>
	                           <option value="waiting">대기중</option>
	                           <option value="complete">답변완료</option>
	                       </select>
	                       <!-- 정렬 select 끝 -->
	
	                       <!-- 상품문의 조회 영역 시작-->
	                       <table id="pro-qna-tb" border="1" style="text-align:center; width:100%">
	                           <thead style="background:#f2f2f2;">
	                               <tr height="50px">
	                                   <th width="5%">No</th>
	                                   <th width="10%">상태</th>
	                                   <th width="20%">상품정보</th>
	                                   <th width="25%">제목</th>
	                                   <th width="10%">작성자</th>
	                                   <th width="20%">작성일</th>
	                                   <th width="10%">답변</th>
	                               </tr>
	                           </thead>
	                           <tbody>
	                           <% for(ProQna pq : list){ %>
	                               <tr>
	                                   <td><%= pq.getProQnaNo() %></td>
	                                   
	                                   <% if(pq.getProAEnrollDate() == null){ %>
	                                   <td>대기중</td>
	                                   <% } else { %>
	                                   <td>답변완료</td>
	                                   <% } %>
	                                   
	                                   <td><%= pq.getProName() %></td>
	                                   <td><%= pq.getProQnaTitle() %></td>
	                                   <td><%= pq.getProQnaWriterName() %></td>
	                                   <td><%= pq.getProQEnrollDate() %></td>
	                                   <td>
	                                   <% if(pq.getProAEnrollDate() == null){ %>
	                                       <button class="btn btn-sm pro-a-btn" style="line-height:20px;"
	                                       onclick="location.href='<%=contextPath%>/updateForm.pq?proQnaNo=<%=pq.getProQnaNo()%>'">답변하기</button>
	                                   <% }else {%>
	                                   	   <button class="btn btn-sm pro-a-btn" style="line-height:20px; background:lightgray;
	                                   	   color:#404040;" disabled>답변완료</button>
	                                   <% } %>
	                                   </td>
	                               </tr>
	                           <% } %>
	                           </tbody>
	                       </table>
	                       
	                       <!------- 페이징 처리 ------>
	                        <div class="pageination">
	                        	<nav aria-label="Page navigation example">
	                        		<ul class="pagination justify-content-center">
	                        		
	                        			<% if(currentPage != 1) { %>
	                        			<li class="page-item">
	                        				<a class="page-link" href="<%=contextPath%>/adlist.pq?cpage=<%=currentPage-1%>" aria-label="Previous">
	                        					<i class="fa-solid fa-angle-left"></i>
	                        				</a>
	                        			</li>
	                        			<% } %>
	                        			
	                        			<% for(int p=startPage; p<=endPage; p++) { %>
	                        			
		                        			<% if(p == currentPage) {%>
		                        			<li class="page-item active"><a class="page-link" href="<%=contextPath%>/adlist.pq?cpage=<%=p%>"><%=p%></a></li>
		                        			<% } else {%>
		                        			<li class="page-item">
		                        				<a class="page-link" href="<%=contextPath%>/adlist.pq?cpage=<%=p%>"><%=p%></a>
		                        			</li>
		                        			<% } %>
	                        			<% } %>
	                        			
	                        			<% if(currentPage != maxPage) { %>
	                        			<li class="page-item">
	                        				<a class="page-link" href="<%=contextPath%>/adlist.pq?cpage=<%=currentPage+1%>" aria-label="Next">
	                        					<i class="fa-solid fa-angle-right"></i>
	                        				</a>
	                        			</li>
	                        			<% } %>
	                        		</ul>
	                        	</nav>
	                        </div>
	                        <!------- 페이징 처리 끝 ------>
	                   </div>
	               </div>
	           </div>
	       </main>
		</div>
  </div>              
<script>
    $(function(){
        
    	
    	
    })
</script>
	
</body>
</html>