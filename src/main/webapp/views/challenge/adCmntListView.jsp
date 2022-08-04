<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.us.challenge.model.vo.Challenge, com.us.common.model.vo.PageInfo" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Challenge> list = (ArrayList<Challenge>)request.getAttribute("adList");	
	
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
					<h3 class="mt-4" style="font-weight:bold;">챌린지 댓글 관리</h3>
					<hr><br><br>
					
					<table>
						<tr>
							<th width="5%">No.</th>
							<th width="55%">제목</th>
							<th width="15%">작성일</th>
							<th width="10%">지급 포인트</th>
							<th width="10%">댓글 수</th>
						</tr>
						<% if(list.isEmpty()) { %>
							<tr>
								<td colspan="5">존재하는 챌린지가 없습니다.</td>
							</tr>  	
						<% } else { %>
							   <% for(Challenge cc : list) { %>
								<tr class="list-area">
									<td><%= cc.getChallNo() %></td>
									<td><%= cc.getChallTitle() %></td>
									<td><%= cc.getChallEnrollDate() %></td>
									<td><%= cc.getChallPoint() %></td>
									<td><%= cc.getChallCmnt() %></td>
								</tr>
							<% } %>
						<% } %>
					</table>
					<br><br><br>
						
					<!-- 페이징바 영역 -->
					<div class="paging-area" align="center">
						<% if(currentPage != 1) {%>
							<button onclick="location.href='<%=contextPath%>/adCmntMain.ch?cpage=<%= pi.getCurrentPage()-1 %>';" class="btn btn_black">&lt;</button>
						<% } %>
						
						<% for(int p=startPage; p<=endPage; p++) { %>
							<% if(p == currentPage){ %>
								<button class="btn btn_gray" disabled><%= p %></button>
							<% }else { %>
								<button class="btn btn_black" onclick="location.href='<%=contextPath%>/adCmntMain.ch?cpage=<%= p %>';"><%= p %></button>
							<% } %>
						<% } %>
						
						<% if(currentPage != maxPage) { %>
						<button onclick="location.href='<%=contextPath%>/adCmntMain.ch?cpage=<%= pi.getCurrentPage()+1 %>';" class="btn btn_black">&gt;</button>
						<% } %>
					</div>
					<!-- 페이징바 영역 끝 -->
				        
					 <script>
						 $(function(){

							 // 게시글 클릭시 해당 게시글 상세 댓글관리 페이지로 이동
							 $(".list-area").click(function(){
								 const challNo = $(this).children().eq(0).text(); // 클릭한 글 번호
								 
								 location.href = '<%=contextPath%>/adCmntDetail.ch?no='+ challNo;
							 })                                                   

						})
					 </script>
 
				</div>
			</main>
 
		</div>
	 </div>

</body>
</html>