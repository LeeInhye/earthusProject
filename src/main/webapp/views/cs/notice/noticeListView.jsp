<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.us.cs.notice.model.vo.Notice, com.us.cs.model.vo.CsCategory"%>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	ArrayList<CsCategory> cateList = (ArrayList<CsCategory>)request.getAttribute("cateList");
	ArrayList<Notice> noList = (ArrayList<Notice>)request.getAttribute("noList");
	ArrayList<Notice> deList = (ArrayList<Notice>)request.getAttribute("deList");
	ArrayList<Notice> evList = (ArrayList<Notice>)request.getAttribute("evList");
	ArrayList<Notice> hiList = (ArrayList<Notice>)request.getAttribute("hiList");
%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

   <%@ include file="/views/common/menubar.jsp" %>
   
   <div class="container">
        <br><br><br><br><br><br><br><br><br>

        <h2 class="menu_title">공지사항</h2> <br>
        <h4 class="menu_title_detail">배송 및 운영 관련 공지사항 게시판입니다.</h4> <br> 
        <hr class="my-hr2"> <br>
        <!-- 카테고리 이름도 번호로 연결해서 채우기 -->
        <ul class="nav justify-content-center board_category">
          <li class="nav-item">
            <a class="nav-link board_category_click" id="noAll" href="javascript:void(0)">전체</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" id="notice" href="javascript:void(0)"><%= cateList.get(0).getCsName() %></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="noDeliver" href="javascript:void(0)"><%= cateList.get(1).getCsName() %></a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" id="noEvent" href="javascript:void(0)"><%= cateList.get(2).getCsName() %></a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" id="noHire" href="javascript:void(0)"><%= cateList.get(3).getCsName() %></a>
          </li>
          
        </ul>
        
        <br><br>
        

        <table class="CS_table table-hover tb_CS_centered table">
            <thead>
                <tr>
                    <th style="width:15%;">카테고리</th>
                    <th style="width:70%;">제목</th>
                    <th style="width:15%;">내용</th>
                </tr>
            </thead>
            <tbody>
            

                <!-- 반복문으로 공지사항 리스트 출력 -->
                <!-- 전체 공지사항 -->
                <% for(Notice n : list) { %>
                    <tr class="tbAll">
                        <td id="category"><%= n.getCsCategory() %></td>
                        <td><%= n.getNoticeTitle() %></td>
                        <td style="font-size:20px; font-weight:900;">
                            <button type="button" class="board_btn">˅</button>
                        </td>
                    </tr>
                    
                    <tr class="CS_hide tbAll" id="notice_content_1">
                        <td colspan="3">
                            <div class="CS_content">
                                <p style="width: 100%;"><%= n.getNoticeContent() %></p>
                            </div>
                        </td>
                    </tr>
                <% } %>
                
                
                <!-- 공지사항만 출력 -->
                <% for(Notice n : noList) { %>
                    <tr class="tbNo" style="display: none;">
                        <td id="category"><%= n.getCsCategory() %></td>
                        <td><%= n.getNoticeTitle() %></td>
                        <td style="font-size:20px; font-weight:900;">
                            <button type="button" class="board_btn">˅</button>
                        </td>
                    </tr>
                    
                    <tr class="CS_hide tbAll" id="notice_content_1">
                        <td colspan="3">
                            <div class="CS_content">
                                <p><%= n.getNoticeContent() %></p>
                            </div>
                        </td>
                    </tr>
                <% } %>
                
                
                <!-- 배송안내만 출력 -->
                <% for(Notice n : deList) { %>
                    <tr class="tbDe" style="display: none;">
                        <td id="category"><%= n.getCsCategory() %></td>
                        <td><%= n.getNoticeTitle() %></td>
                        <td style="font-size:20px; font-weight:900;">
                            <button type="button" class="board_btn">˅</button>
                        </td>
                    </tr>
                    
                    <tr class="CS_hide tbAll" id="notice_content_1">
                        <td colspan="3">
                            <div class="CS_content">
                                <p><%= n.getNoticeContent() %></p>
                            </div>
                        </td>
                    </tr>
                <% } %>
                
                
                <!-- 이벤트만 출력 -->
                <% for(Notice n : evList) { %>
                    <tr class="tbEv" style="display: none;">
                        <td id="category"><%= n.getCsCategory() %></td>
                        <td><%= n.getNoticeTitle() %></td>
                        <td style="font-size:20px; font-weight:900;">
                            <button type="button" class="board_btn">˅</button>
                        </td>
                    </tr>
                    
                    <tr class="CS_hide tbAll" id="notice_content_1">
                        <td colspan="3">
                            <div class="CS_content">
                                <p><%= n.getNoticeContent() %></p>
                            </div>
                        </td>
                    </tr>
                <% } %>
                
                
                <!-- 채용공고만 출력 -->
                <% for(Notice n : hiList) { %>
                    <tr class="tbHi" style="display: none;">
                        <td id="category"><%= n.getCsCategory() %></td>
                        <td><%= n.getNoticeTitle() %></td>
                        <td style="font-size:20px; font-weight:900;">
                            <button type="button" class="board_btn">˅</button>
                        </td>
                    </tr>
                    
                    <tr class="CS_hide tbAll" id="notice_content_1">
                        <td colspan="3">
                            <div class="CS_content">
                                <p><%= n.getNoticeContent() %></p>
                            </div>
                        </td>
                    </tr>
                <% } %>
                
                
               
			         
			    
			    
                <script>
                    $(document).ready(function(){
                    	// 슬라이드 보이게
                    	 $(".CS_table>tbody>tr").click(function(e){ 
				            e.preventDefault();
				
				            var targetRow = $(this).closest("tr").next(".CS_hide");
				            targetRow.show().find('div').slideToggle("fast", function(){
				                if(!$(this).is(":visible")){
				                    targetRow.hide();
				                }
				            });
			         	 });
			      
                    	
                    	// 전체 공지 클릭시
                    	$("#noAll").click(function(){
                    		// 클릭한 카테고리 색 변화시키기
                    		$(this).addClass("board_category_click");
                    		$("#notice").removeClass("board_category_click");
                    		$("#noDeliver").removeClass("board_category_click");
                    		$("#noEvent").removeClass("board_category_click");
                    		$("#noHire").removeClass("board_category_click");
                    		
                    		// 전체 리스트만
                    		$(".tbAll").removeAttr("style");
                    		$(".tbDe").css('display', 'none');
                    		$(".tbNo").css('display', 'none');
                    		$(".tbEv").css('display', 'none');
                    		$(".tbHi").css('display', 'none');
                    	});
                    	
                    	// 공지사항 클릭시
                    	$("#notice").click(function(){
                    		$(this).addClass("board_category_click");
                    		$("#noAll").removeClass("board_category_click");
                    		$("#noDeliver").removeClass("board_category_click");
                    		$("#noEvent").removeClass("board_category_click");
                    		$("#noHire").removeClass("board_category_click");
                    		
                    		// 공지사항 리스트만
                    		$(".tbNo").removeAttr("style");
                    		$(".tbDe").css('display', 'none');
                    		$(".tbAll").css('display', 'none');
                    		$(".tbEv").css('display', 'none');
                    		$(".tbHi").css('display', 'none');
                    	});
                    	
                        // 배송안내 클릭시
                        $("#noDeliver").click(function(){
                        	$(this).addClass("board_category_click");
                    		$("#notice").removeClass("board_category_click");
                    		$("#noAll").removeClass("board_category_click");
                    		$("#noEvent").removeClass("board_category_click");
                    		$("#noHire").removeClass("board_category_click");
                    		
                    		// 배송안내 게시글만
                    		$(".tbDe").removeAttr("style");
                    		$(".tbAll").css('display', 'none');
                    		$(".tbNo").css('display', 'none');
                    		$(".tbEv").css('display', 'none');
                    		$(".tbHi").css('display', 'none');
                        });
                    		
                    	// 이벤트 클릭시
                       	$("#noEvent").click(function(){
                       		$(this).addClass("board_category_click");
                       		$("#notice").removeClass("board_category_click");
                       		$("#noDeliver").removeClass("board_category_click");
                       		$("#noAll").removeClass("board_category_click");
                       		$("#noHire").removeClass("board_category_click");
                       		
                       	// 이벤트 리스트만
                    		$(".tbEv").removeAttr("style");
                    		$(".tbDe").css('display', 'none');
                    		$(".tbNo").css('display', 'none');
                    		$(".tbAll").css('display', 'none');
                    		$(".tbHi").css('display', 'none');
                       	});
                    	
                     // 채용 공고 클릭시
                    	$("#noHire").click(function(){
                    		$(this).addClass("board_category_click");
                    		$("#notice").removeClass("board_category_click");
                    		$("#noDeliver").removeClass("board_category_click");
                    		$("#noEvent").removeClass("board_category_click");
                    		$("#noAll").removeClass("board_category_click");
                    		
                    		// 채용공고 리스트만
                    		$(".tbHi").removeAttr("style");
                    		$(".tbDe").css('display', 'none');
                    		$(".tbNo").css('display', 'none');
                    		$(".tbEv").css('display', 'none');
                    		$(".tbAll").css('display', 'none');
                    	});
                     
                    })
                </script>

                

            </tbody>
        </table>
    </div>
    <br><br><br><br><br><br><br><br><br>

   <%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>