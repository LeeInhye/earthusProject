<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.us.cs.faq.model.vo.Faq, com.us.cs.model.vo.CsCategory"%>
<%
    ArrayList<Faq> list = (ArrayList<Faq>)request.getAttribute("list");
	ArrayList<CsCategory> cateList = (ArrayList<CsCategory>)request.getAttribute("cateList");
    ArrayList<Faq> orList = (ArrayList<Faq>)request.getAttribute("orList");
    ArrayList<Faq> deList = (ArrayList<Faq>)request.getAttribute("deList");
    ArrayList<Faq> canList = (ArrayList<Faq>)request.getAttribute("canList");
    ArrayList<Faq> exList = (ArrayList<Faq>)request.getAttribute("exList");
    ArrayList<Faq> etcList = (ArrayList<Faq>)request.getAttribute("etcList");
%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

   <%@ include file="/views/common/menubar.jsp" %>
   
   <div class="container">
        <br><br><br><br><br><br><br><br><br>
        
        <h2 class="menu_title">자주묻는질문</h2> <br>
        <h4 class="menu_title_detail">
            &nbsp;자주 문의하시는 질문입니다. <br>
            더 자세한 문의는 'Q&A' 게시판을 이용해 주세요.
        </h4> <br> 
        <hr class="my-hr2"> <br>

        <ul class="nav justify-content-center board_category">
          <li class="nav-item">
            <a class="nav-link board_category_click" id="fqAll" href="javascript:void(0)">전체</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="fqOr" href="javascript:void(0)"><%= cateList.get(4).getCsName() %></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="fqDe" href="javascript:void(0)"><%= cateList.get(5).getCsName() %></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="fqCan" href="javascript:void(0)"><%= cateList.get(6).getCsName() %></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="fqEx" href="javascript:void(0)"><%= cateList.get(7).getCsName() %></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="fqEtc" href="javascript:void(0)"><%= cateList.get(8).getCsName() %></a>
          </li>
        </ul>
        <br><br>
            

        <table class="table table-hover CS_table">
            <thead>
                <tr>
                    <th style="width:15%;">카테고리</th>
                    <th style="width:70%;">제목</th>
                    <th style="width:15%;">내용</th>
                </tr>
            </thead>
            <tbody>

             	<!-- 반복문으로 자주묻는질문 리스트 출력 -->
                <!-- 전체  -->
                <% for(Faq f : list) { %>
                    <tr class="tbAll">
                        <td id="category"><%= f.getCsCategory() %></td>
                        <td><%= f.getFaqTitle() %></td>
                        <td style="font-size:20px; font-weight:900;">
                            <button type="button" class="board_btn">˅</button>
                        </td>
                    </tr>
                    
                    <tr class="CS_hide tbAll" id="notice_content_1">
                        <td colspan="3">
                            <div class="CS_content">
                                <p><%= f.getFaqContent() %></p>
                            </div>
                        </td>
                    </tr>
                <% } %>
                
                <!-- 주문  -->
                <% for(Faq f : orList) { %>
                    <tr class="tbOr" style="display: none;">
                        <td id="category"><%= f.getCsCategory() %></td>
                        <td><%= f.getFaqTitle() %></td>
                        <td style="font-size:20px; font-weight:900;">
                            <button type="button" class="board_btn">˅</button>
                        </td>
                    </tr>
                    
                    <tr class="CS_hide tbAll" id="notice_content_1">
                        <td colspan="3">
                            <div class="CS_content">
                                <p><%= f.getFaqContent() %></p>
                            </div>
                        </td>
                    </tr>
                <% } %>
                
                <!-- 배송  -->
                <% for(Faq f : deList) { %>
                    <tr class="tbDe" style="display: none;">
                        <td id="category"><%= f.getCsCategory() %></td>
                        <td><%= f.getFaqTitle() %></td>
                        <td style="font-size:20px; font-weight:900;">
                            <button type="button" class="board_btn">˅</button>
                        </td>
                    </tr>
                    
                    <tr class="CS_hide tbAll" id="notice_content_1">
                        <td colspan="3">
                            <div class="CS_content">
                                <p><%= f.getFaqContent() %></p>
                            </div>
                        </td>
                    </tr>
                <% } %>
                
                <!-- 취소/환불  -->
                <% for(Faq f : canList) { %>
                    <tr class="tbCan" style="display: none;">
                        <td id="category"><%= f.getCsCategory() %></td>
                        <td><%= f.getFaqTitle() %></td>
                        <td style="font-size:20px; font-weight:900;">
                            <button type="button" class="board_btn">˅</button>
                        </td>
                    </tr>
                    
                    <tr class="CS_hide tbAll" id="notice_content_1">
                        <td colspan="3">
                            <div class="CS_content">
                                <p><%= f.getFaqContent() %></p>
                            </div>
                        </td>
                    </tr>
                <% } %>
                
                <!-- 교환/반품  -->
                <% for(Faq f : exList) { %>
                    <tr class="tbEx" style="display: none;">
                        <td id="category"><%= f.getCsCategory() %></td>
                        <td><%= f.getFaqTitle() %></td>
                        <td style="font-size:20px; font-weight:900;">
                            <button type="button" class="board_btn">˅</button>
                        </td>
                    </tr>
                    
                    <tr class="CS_hide tbAll" id="notice_content_1">
                        <td colspan="3">
                            <div class="CS_content">
                                <p><%= f.getFaqContent() %></p>
                            </div>
                        </td>
                    </tr>
                <% } %>
                
                <!-- 기타  -->
                <% for(Faq f : etcList) { %>
                    <tr class="tbEtc" style="display: none;">
                        <td id="category"><%= f.getCsCategory() %></td>
                        <td><%= f.getFaqTitle() %></td>
                        <td style="font-size:20px; font-weight:900;">
                            <button type="button" class="board_btn">˅</button>
                        </td>
                    </tr>
                    
                    <tr class="CS_hide tbAll" id="notice_content_1">
                        <td colspan="3">
                            <div class="CS_content">
                                <p><%= f.getFaqContent() %></p>
                            </div>
                        </td>
                    </tr>
                <% } %>

                
                
                <script> 
			        $(document).ready(function(){
			          $(".CS_table>tbody>tr").click(function(e){ 
			            e.preventDefault();
			
			            var targetRow = $(this).closest("tr").next(".CS_hide");
			            targetRow.show().find('div').slideToggle("fast", function(){
			                if(!$(this).is(":visible")){
			                    targetRow.hide();
			                }
			            });
			          });
			        });
			    </script>


          		<script>
                    $(document).ready(function(){
                    	
                    	// 전체 클릭시
                    	$("#fqAll").click(function(){
                    		// 클릭한 카테고리 색 변화시키기
                    		$(this).addClass("board_category_click");
                    		$("#fqOr").removeClass("board_category_click");
                    		$("#fqDe").removeClass("board_category_click");
                    		$("#fqCan").removeClass("board_category_click");
                    		$("#fqEx").removeClass("board_category_click");
                    		$("#fqEtc").removeClass("board_category_click");
                    		
                    		// 전체 리스트만
                    		$(".tbAll").removeAttr("style");
                    		$(".tbOr").css('display', 'none');
                    		$(".tbDe").css('display', 'none');
                    		$(".tbCan").css('display', 'none');
                    		$(".tbEx").css('display', 'none');
                    		$(".tbEtc").css('display', 'none');
                    	});
                    	
                    	// 주문/결제 클릭시
                    	$("#fqOr").click(function(){
                    		// 클릭한 카테고리 색 변화시키기
                    		$(this).addClass("board_category_click");
                    		$("#fqAll").removeClass("board_category_click");
                    		$("#fqDe").removeClass("board_category_click");
                    		$("#fqCan").removeClass("board_category_click");
                    		$("#fqEx").removeClass("board_category_click");
                    		$("#fqEtc").removeClass("board_category_click");
                    		
                    		// 주문/결제 리스트만
                    		$(".tbOr").removeAttr("style");
                    		$(".tbAll").css('display', 'none');
                    		$(".tbDe").css('display', 'none');
                    		$(".tbCan").css('display', 'none');
                    		$(".tbEx").css('display', 'none');
                    		$(".tbEtc").css('display', 'none');
                    	});
                    	
                        // 배송 클릭시
                       $("#fqDe").click(function(){
                    		// 클릭한 카테고리 색 변화시키기
                    		$(this).addClass("board_category_click");
                    		$("#fqOr").removeClass("board_category_click");
                    		$("#fqAll").removeClass("board_category_click");
                    		$("#fqCan").removeClass("board_category_click");
                    		$("#fqEx").removeClass("board_category_click");
                    		$("#fqEtc").removeClass("board_category_click");
                    		
                    		// 배송 게시글만
                    		$(".tbDe").removeAttr("style");
                    		$(".tbOr").css('display', 'none');
                    		$(".tbAll").css('display', 'none');
                    		$(".tbCan").css('display', 'none');
                    		$(".tbEx").css('display', 'none');
                    		$(".tbEtc").css('display', 'none');
                        });
                    		
                    	// 취소/환불 클릭시
                       	$("#fqCan").click(function(){
                    		// 클릭한 카테고리 색 변화시키기
                    		$(this).addClass("board_category_click");
                    		$("#fqOr").removeClass("board_category_click");
                    		$("#fqDe").removeClass("board_category_click");
                    		$("#fqAll").removeClass("board_category_click");
                    		$("#fqEx").removeClass("board_category_click");
                    		$("#fqEtc").removeClass("board_category_click");
                       		
                       		// 취소/환불, 리스트만
                    		$(".tbCan").removeAttr("style");
                    		$(".tbOr").css('display', 'none');
                    		$(".tbDe").css('display', 'none');
                    		$(".tbAll").css('display', 'none');
                    		$(".tbEx").css('display', 'none');
                    		$(".tbEtc").css('display', 'none');
                       	});
                    	
                     // 교환/환불 클릭시
                    	$("#fqEx").click(function(){
                    		// 클릭한 카테고리 색 변화시키기
                    		$(this).addClass("board_category_click");
                    		$("#fqOr").removeClass("board_category_click");
                    		$("#fqDe").removeClass("board_category_click");
                    		$("#fqCan").removeClass("board_category_click");
                    		$("#fqAll").removeClass("board_category_click");
                    		$("#fqEtc").removeClass("board_category_click");
                    		
                    		// 교환/환불 리스트만
                    		$(".tbEx").removeAttr("style");
                    		$(".tbOr").css('display', 'none');
                    		$(".tbDe").css('display', 'none');
                    		$(".tbCan").css('display', 'none');
                    		$(".tbAll").css('display', 'none');
                    		$(".tbEtc").css('display', 'none');
                    	});
                     
                     // 기타 클릭스
                     $("#fqEtc").click(function(){
                    		// 클릭한 카테고리 색 변화시키기
                    		$(this).addClass("board_category_click");
                    		$("#fqOr").removeClass("board_category_click");
                    		$("#fqDe").removeClass("board_category_click");
                    		$("#fqCan").removeClass("board_category_click");
                    		$("#fqEx").removeClass("board_category_click");
                    		$("#fqAll").removeClass("board_category_click");
                    		
                    		// 기타 리스트만
                    		$(".tbEtc").removeAttr("style");
                    		$(".tbOr").css('display', 'none');
                    		$(".tbDe").css('display', 'none');
                    		$(".tbCan").css('display', 'none');
                    		$(".tbEx").css('display', 'none');
                    		$(".tbAll").css('display', 'none');
                     });
                    })
                </script>

            </tbody>
        </table>

        <!-- 페이징 -->

        <br><br><br><br><br><br>
        <div class="moveToQna" style="text-align:center;">
            <span>찾으시는 질문이 없다면?</span>
            <!-- QNA 게시판 이동 -->
            <a href="<%= contextPath %>/list.qa">> Q&A 게시판 바로가기</a>
            
        </div>
        <br><br><br><br><br><br><br><br><br>
        
    </div>
   
   <%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>