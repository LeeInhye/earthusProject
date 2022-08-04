<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.us.challenge.model.vo.Challenge, com.us.common.model.vo.Attachment" %>
<%
	Challenge ch = (Challenge)request.getAttribute("ch");
	Attachment at = (Attachment)request.getAttribute("at");
	Challenge prev = (Challenge)request.getAttribute("prev");
	Challenge next = (Challenge)request.getAttribute("next");
%>
<!DOCTYPE html>
<html>
<head>
<style>
.img-fluid{
	width: 130px;
    height: 88px;
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
							<h2>챌린지</h2>
							<p>어스랑 같이 제로웨이스트! 챌린지에 참여하고 쇼핑에 사용 가능한 포인트를 지급 받으세요.</p>
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
                        <th width="1200px"><%= ch.getChallTitle() %></th>
                    </tr>
                    <tr>
                        <td>
                            작성일 :
                            <%= ch.getChallEnrollDate() %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            조회수 :
                            <%= ch.getChallCount() %>
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
                        	<% if(ch.getChallContent() != null) { %>
                        		<p><%= ch.getChallContent() %></p>
                                <br>
                        	<% } %>
                        </td>
                    </tr>
    
                </table>
    
            </div>
            <div class="navigation-top">
                <div class="navigation-area">
                    <div class="row">                    
                        <div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
                        <% if( ch.getPrevNo() != 0 ) { %>
                            <div class="thumb">
                            <a href="<%=contextPath%>/detail.ch?no=<%= ch.getPrevNo() %>">
                                <img class="img-fluid" src="<%= contextPath %>/<%= prev.getChallThumbnail() %>" alt="">
                            </a>
                            </div>
                            <div class="arrow">
                            <a href="#">
                                <span class="lnr text-white ti-arrow-left"></span>
                            </a>
                            </div>
                            <div class="detials">
                            <p>이전 챌린지</p>
                            <a href="<%=contextPath%>/detail.ch?no=<%= ch.getPrevNo() %>">
                                <h4><%= prev.getChallTitle() %></h4>
                            </a>
                            </div>
                        <% } %>
                        </div>
                        <div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
                            <% if( ch.getNextNo() != 0 ) { %>
	                            <div class="detials">
	                            <p>다음 챌린지</p>
	                            <a href="<%=contextPath%>/detail.ch?no=<%= ch.getNextNo()%>">
	                                <h4><%= next.getChallTitle() %></h4>
	                            </a>
	                            </div>
	                            <div class="arrow">
	                            <a href="#">
	                                <span class="lnr text-white ti-arrow-right"></span>
	                            </a>
	                            </div>
	                            <div class="thumb">
	                            <a href="<%=contextPath%>/detail.ch?no=<%= ch.getNextNo()%>">
	                                <img class="img-fluid" src="<%= contextPath %>/<%= next.getChallThumbnail() %>" alt="">
	                            </a>
	                            </div>
	                       <% } %>
                        </div>
                    </div>
                </div>
            </div>
            
        <!--댓글 작성 칸 시작-->
        <div class="comment-form">
            <h4>댓글 작성</h4>
            <form class="form-contact comment_form" action="#" id="commentForm">
                <table>
                    <tr>
                    <% if(loginUser == null) { %>
                        <td width="900px">
                            <textarea class="form-control" name="comment" id="cmntContent" cols="30" rows="4"
                            placeholder="로그인 후 이용 가능한 서비스입니다." readonly></textarea>
                        </td>
                        <td width="200px" style="padding-left: 40px;">
                        	<button class="btn_cmnt" disabled>댓글 등록</button>
                        </td>
                    <% } else { %>
                        <td width="900px">
                            <textarea class="form-control" name="comment" id="cmntContent" cols="30" rows="4"
                            placeholder="댓글 내용을 입력해 주세요."></textarea>
                        </td>
                        <td width="200px" style="padding-left: 40px;">
                        	<button type="button" class="btn_cmnt" onclick="insertCmnt();">댓글 등록</button>
                        </td>
                    <% } %>
                    </tr>
                </table>
            </form>
        </div>
        <!-- 댓글 작성 칸 끝 -->

        <!-- 댓글 리스트 시작 -->
        <div class="comments-area">
            <h4><span id="cmntCount"><%= ch.getChallCmnt() %></span> 개의 댓글</h4>

            <div id="cmntInsertArea">
            	<!-- ajax로 댓글 목록 추가될 자리 -->
            </div>
        
			<!-- 페이징바 영역 -->
			<nav class="blog-pagination justify-content-center d-flex">
			    <ul class="pagination">
			    <!-- ajax로 페이징바 추가될 자리 -->
			    </ul>
			</nav>
			<!-- 페이징바 영역 끝 -->

		</div>
        <!-- 댓글 리스트 끝 -->

   		<hr>
        <br>
        <div style="width:1140px" align="right">
            <a href="<%= contextPath %>/list.ch?cpage=1" class="btn_list">목록</a>
        </div>
            
        </div>
    </section>
    
    <script>
    	$(function(){ // 현재 이 페이지 상의 모든 요소가 다 로딩되자마자 곧바로 실행
    		selectCmntList(1);
    	})
    	
    	// 댓글 등록
    	function insertCmnt(){
    		
    		console.log($("#cmntContent").val());
    		
    		if($("#cmntContent").val() == ''){
    			alert("내용을 입력해 주세요");
    		}else {
				$.ajax({
					url:"<%=contextPath%>/cmntInsert.ch",
					data:{
						no:<%=ch.getChallNo()%>,
						content:$("#cmntContent").val(),
					},
					type:"post",
					success:function(result){
						if(result > 0){ // 댓글 등록 성공 => 갱신된 댓글 리스트 조회, 댓글 개수 +1
							selectCmntList(1
									);
							$("#cmntContent").val(""); // textarea 초기화
                    		$("#cmntCount").text(Number($("#cmntCount").text()) + 1);
						}
						
					}, error:function(){
	    				console.log("댓글 작성용 ajax 통신 실패");
					}
				})
    		}
    	}
    	
    	// 현재 게시글에 달려 있는 댓글 목록 조회
    	function selectCmntList(page){
    		
    		$.ajax({
    			url:"<%=contextPath%>/cmntList.ch",
    			data:{no:<%= ch.getChallNo() %>, cpage:page},
    			success:function(map){
    				
    				console.log(map);
    				const list = map.list;
    				const pi = map.pi; // {currentPage: , listCount : }
    				
    				// 댓글
    				let value = "";
    				for(let i=0; i<list.length; i++) {
    					value += "<div class='comment-list'>"
    						   + "<div class='single-comment justify-content-between d-flex'>"
		    				   + "<div class='user justify-content-between d-flex'>"
		    				   + "<div class='desc'>"
		    				   + "<div class='d-flex justify-content-between'>"
		    				   + "<div class='d-flex align-items-center'>"
		    				   + "<h5>"
		    				   + "<a>" + list[i].cmntWriter + "</a>"
		    				   + "</h5>"
		    				   + "<p class='date'>" + list[i].cmntEnrollDate + "</p>"
		    				   + "</div></div>"
		    				   + "<p class='comment'>" + list[i].cmntContent + "</p>"
		    				   + "</div></div></div></div>";
    				}
    				
    				$("#cmntInsertArea").html(value);
    				
    				// 페이징바
    				var paging = "";
    				if(pi.currentPage != 1) {
    					paging += '<li class="page-item">'
    							+	'<button onclick="selectCmntList(' + (pi.currentPage-1) + ');"  class="page-link" aria-label="Previous">'
    							+		'<i class="ti-angle-left"></i>'
    							+	'</button>'
    							+ '</li>';
    				}
    				
    				for(let p=pi.startPage; p<=pi.endPage; p++){
    					
    					if(p == pi.currentPage){
    						paging += '<li class="page-item active">'
    								+	'<button class="page-link" disabled>' + p + '</button>';
    					}else{
    						paging += '<li class="page-item">'
    								+	'<button onclick="selectCmntList(' + p + ');" class="page-link">' + p + '</button>';
    					}
    					
    					paging += '</li>';
    				}
    				
    				if(pi.currentPage != pi.maxPage) {
    					paging += '<li class="page-item">'
	    						+	'<button onclick="selectCmntList(' + (pi.currentPage+1) + ');"  class="page-link" aria-label="Next">'
								+		'<i class="ti-angle-right"></i>'
								+	'</button>'
								+ '</li>';
    							
    				}
	
    				$(".pagination").html(paging);
    				
    			},error:function(){
    				console.log("댓글목록 조회용 ajax 통신 실패");
    			}
    			
    		});
    		
    	}
    	
    </script>
    
     <br><br><br><br><br><br><br>
     <!--================Blog Area =================-->

	<%@ include file="/views/common/footerbar.jsp" %>
	
</body>
</html>