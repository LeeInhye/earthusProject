<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.us.contents.model.vo.Contents, com.us.common.model.vo.Attachment"%>
<%
	Contents c = (Contents)request.getAttribute("c");
	Attachment at = (Attachment)request.getAttribute("at");
	Contents prev = (Contents)request.getAttribute("prev");
	Contents next = (Contents)request.getAttribute("next");
%>
<!DOCTYPE html>
<html>
<head>
<style>
.img-fluid{
	width: 200px;
    height: 100px;
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
    <section class="blog_area single-post-area padding_top">
        <div class="container">
            <div class="chall_details">
                <table class="table chall-table" style="margin: auto;">
                    <tr>
                        <th width="1200px"><%= c.getCntTitle() %></th>
                    </tr>
                    <tr>
                        <td>
                            작성일 :
                            <%= c.getCntEnrollDate() %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            조회수 :
                            <%= c.getCntCount() %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            첨부파일 :
                            <a download="<%= at.getOriginName() %>" href="<%= contextPath %>/<%= at.getFilePath() + at.getChangeName() %>"><%= at.getOriginName() %></a>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:center">
                            <img src="<%= contextPath %>/<%= at.getFilePath() + at.getChangeName() %>" style="margin:30px 0px">
                        	<% if(c.getCntContent() != null) { %>
                        		<p><%= c.getCntContent() %></p>
                                <br>
                        	<% } %>
                        </td>
                    </tr>
    
                </table>
    
            </div>
            <div class="navigation-top">
                <div class="d-sm-flex justify-content-between text-center" style="margin-left:2%">
                    <p class="like-info"><span class="align-middle"><i class="far fa-heart"></i></span>
                        <%= c.getCntLike() %>명이 좋아합니다</p>
                 </div>
                <div class="navigation-area">
                    <div class="row">                    
                        <div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
                        <% if( c.getPrevNo() != 0 ) { %>
                            <div class="thumb">
                            <a href="<%=contextPath%>/detail.co?no=<%=c.getPrevNo() %>">
                                <img class="img-fluid" src="<%= contextPath %>/<%= prev.getCntThumbnail() %>" alt="">
                            </a>
                            </div>
                            <div class="arrow">
                            <a href="#">
                                <span class="lnr text-white ti-arrow-left"></span>
                            </a>
                            </div>
                            <div class="detials">
                            <p>이전 콘텐츠</p>
                            <a href="<%=contextPath%>/detail.co?no=<%=c.getPrevNo() %>">
                                <h4><%= prev.getCntTitle() %></h4>
                            </a>
                            </div>
                        <% } %>
                        </div>
                        <div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
                            <% if( c.getNextNo() != 0 ) { %>
	                            <div class="detials">
	                            <p>다음 콘텐츠</p>
	                            <a href="<%=contextPath%>/detail.co?no=<%=c.getNextNo()%>">
	                                <h4><%= next.getCntTitle() %></h4>
	                            </a>
	                            </div>
	                            <div class="arrow">
	                            <a href="#">
	                                <span class="lnr text-white ti-arrow-right"></span>
	                            </a>
	                            </div>
	                            <div class="thumb">
	                            <a href="<%=contextPath%>/detail.co?no=<%=c.getNextNo()%>">
	                                <img class="img-fluid" src="<%= contextPath %>/<%= next.getCntThumbnail() %>" alt="">
	                            </a>
	                            </div>
	                       <% } %>
                        </div>
                    </div>
                </div>
            </div>
    
            <br><br>
            <div style="width:1140px" align="right">
                <a href="<%= contextPath %>/list.co" class="btn_list">목록</a>
            </div>
            
        </div>
     </section>
    
     <br><br><br><br><br><br><br>
        <!--================Blog Area =================-->    

</body>
</html>