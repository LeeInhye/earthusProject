<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.us.challenge.model.vo.Challenge, com.us.common.model.vo.PageInfo" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Challenge> list = (ArrayList<Challenge>)request.getAttribute("list");
	
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

	<!--================ Banner Area =================-->
	<section class="breadcrumb contents_bg">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item">
							<h2>챌린지</h2>
							<p>어스랑 같이 제로웨이스트! 챌린지에 참여하고 쇼핑에 사용 가능한 포인트를 지급 받으세요.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


    <!--================Blog Area =================-->
    <section class="blog_area padding_top">
        <div class="container">
            <div class="row" style="margin: auto;">
                <div class="chall_outer">

					<!-- 챌린지 게시글 리스트 -->
					<% for(Challenge ch : list) { %>
						<article class="chall_item">
							<div class="chall_item_img">
								<img class="card-img rounded-0" src="<%= contextPath %>/<%= ch.getChallThumbnail() %>" alt="">
							</div>
	
							<div class="blog_details">
								<a class="d-inline-block" href="single-blog.html">
									<h2><%= ch.getChallTitle() %></h2>
								</a>
								<ul class="blog-info-link">
									<li><a href="#"><i class="far fa-user"></i><%= ch.getChallEnrollDate() %></a></li>
									<li><a href="#"><i class="far fa-comments"></i><%= ch.getChallCmnt() %> Comments</a></li>
								</ul>
								<br>
								<button class="btn_chall_point"><%= ch.getChallPoint() %> POINT</button>
							</div>
						</article>
					<% } %>

					<!-- 페이징바 영역 -->
                    <nav class="blog-pagination justify-content-center d-flex">
                        <ul class="pagination">
                        	<% if(currentPage != 1) {%>
                                <li class="page-item">
                                    <button onclick="location.href='<%=contextPath%>/list.ch?cpage=<%= pi.getCurrentPage()-1 %>';" class="page-link" aria-label="Previous">
                                        <i class="ti-angle-left"></i>
                                    </button>
                                </li>
                            <% } %>
                            
                            <% for(int p=startPage; p<=endPage; p++) { %>
					            <% if(p == currentPage){ %>
                                    <li class="page-item active">
                                        <button class="page-link" disabled><%= p %></button>
                                    </li>
					            <% }else { %>
                                    <li class="page-item">
                                        <button class="page-link" onclick="location.href='<%=contextPath%>/list.ch?cpage=<%= p %>';"><%= p %></button>
                                    </li>
								<% } %>
							<% } %>
						
                            <% if(currentPage != maxPage) { %>
                                <li class="page-item">
                                    <button onclick="location.href='<%=contextPath%>/list.ch?cpage=<%= pi.getCurrentPage()+1 %>';" class="page-link" aria-label="Next">
                                        <i class="ti-angle-right"></i>
                                    </button>
                                </li>
                            <% } %>
                        </ul>
                    </nav>
                    <!-- 페이징바 영역 끝 -->
                    
				</div>
            </div>
        </div>
    </section>
    <br><br><br><br><br>
    <!--================Blog Area =================-->

	<%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>