<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.us.contents.model.vo.Contents, com.us.common.model.vo.PageInfo" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Contents> list = (ArrayList<Contents>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<style>
    .blog_item:hover {
    	cursor:pointer;
    }
</style>
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
                            <input type="hidden" value="<%= c.getCntNo() %>">
	                        <div class="blog_item_img">
	                            <img class="card-img rounded-0" src="<%= contextPath %>/<%= c.getCntThumbnail() %>" alt="" width="1370" height="520">
	                            <a href="#" class="blog_item_date">
	                                <p>No.</p>
	                                <h3><%= c.getCntNo() %></h3>
	                            </a>
	                        </div>
	
	                        <div class="blog_details">
	                            <a class="d-inline-block">
	                                <h2><%= c.getCntTitle() %></h2>
	                            </a>
	                            <% if( c.getCntContent() != null) { %>
	                            	<p><%= c.getCntContent() %></p>
	                            <% } %>
	                            <ul class="blog-info-link">
	                                <li style="color:gray;"><i class="ti-calendar"></i><%= c.getCntEnrollDate() %></li>
	                                <li><a href="#"><i class="ti-heart"></i> <%= c.getCntLike() %> Likes</a></li>
	                            </ul>
	                        </div>
	                    </article>
                    <% } %>
                    
					<!-- 페이징바 영역 -->
                    <nav class="blog-pagination justify-content-center d-flex">
                        <ul class="pagination">
                        	<% if(currentPage != 1) {%>
                                <li class="page-item">
                                    <button onclick="location.href='<%=contextPath%>/list.co?cpage=<%= pi.getCurrentPage()-1 %>';" class="page-link" aria-label="Previous">
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
                                        <button class="page-link" onclick="location.href='<%=contextPath%>/list.co?cpage=<%= p %>';"><%= p %></button>
                                    </li>
								<% } %>
							<% } %>
						
                            <% if(currentPage != maxPage) { %>
                                <li class="page-item">
                                    <button onclick="location.href='<%=contextPath%>/list.co?cpage=<%= pi.getCurrentPage()+1 %>';" class="page-link" aria-label="Next">
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

    <script>
        $(function(){
            $(".blog_item").click(function(){
                location.href = '<%=contextPath%>/detail.co?no=' + $(this).children().eq(0).val();
            })
        })
    </script>

    <!--================Blog Area =================-->


	<%@ include file="/views/common/footerbar.jsp" %>
	
</body>
</html>