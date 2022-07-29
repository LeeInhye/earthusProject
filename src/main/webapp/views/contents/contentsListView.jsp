<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.us.contents.model.vo.Contents" %>
<%
	ArrayList<Contents> list = (ArrayList<Contents>)request.getAttribute("list");
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
                            <h2>콘텐츠</h2>
                            <p>환경을 지키며 궁금한 것들, 어스가 대신 알려드립니다!</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!--================Blog Area =================-->
    <section class="blog_area padding_top">
        <div class="container">
            <div class="row">
                <br><br><br>
                <div class="blog_left_sidebar" style="width: 100%;">
                    
                    <!-- 콘텐츠 게시글 리스트 -->
                    <% for(Contents c : list) { %>
	                    <article class="blog_item">
	                        <div class="blog_item_img">
	                            <img class="card-img rounded-0" src="<%= contextPath %>/<%= c.getCntThumbnail() %>" alt="" width="1370" height="520">
	                            <a href="#" class="blog_item_date">
	                                <p>No.</p>
	                                <h3><%= c.getCntNo() %></h3>
	                            </a>
	                        </div>
	
	                        <div class="blog_details">
	                            <a class="d-inline-block" href="single-blog.html">
	                                <h2><%= c.getCntTitle() %></h2>
	                            </a>
	                            <p><%= c.getCntContent() %></p>
	                            <ul class="blog-info-link">
	                                <li><a href="#"><i class="ti-calendar"></i><%= c.getCntEnrollDate() %></a></li>
	                                <li><a href="#"><i class="ti-heart"></i> <%= c.getCntLike() %> Likes</a></li>
	                            </ul>
	                        </div>
	                    </article>
                    <% } %>

                    <nav class="blog-pagination justify-content-center d-flex">
                        <ul class="pagination">
                            <li class="page-item">
                                <a href="#" class="page-link" aria-label="Previous">
                                    <i class="ti-angle-left"></i>
                                </a>
                            </li>
                            <li class="page-item">
                                <a href="#" class="page-link">1</a>
                            </li>
                            <li class="page-item active">
                                <a href="#" class="page-link">2</a>
                            </li>
                            <li class="page-item">
                                <a href="#" class="page-link" aria-label="Next">
                                    <i class="ti-angle-right"></i>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>     
        </div>
    </section>
    <br><br><br><br><br>
    <!--================Blog Area =================-->

	<%@ include file="/views/common/footerbar.jsp" %>
	
</body>
</html>