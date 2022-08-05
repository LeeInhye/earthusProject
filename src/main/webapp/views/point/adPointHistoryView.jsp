<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.us.point.model.vo.Point, com.us.common.model.vo.PageInfo, java.text.SimpleDateFormat" 
%>
<%
	ArrayList<Point> list = (ArrayList<Point>)request.getAttribute("list");
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

	<%@ include file="/views/common/adminMenubar.jsp" %>

	<div id="layoutSidenav">
		<div id="layoutSidenav_content">
			<main>
		        <div class="container-fluid px-4 btnHover">
		        	<br>
                    <h3 class="mt-4" style="font-weight:bold">포인트 관리 > 내역 조회</h3>
		            <hr>
                    
                    <br><br>
	            
	            	<div style="width: 90%" class="main_width  sumin_font">
	                <input type="text" class="search_all" placeholder="회원 아이디 / 회원명 입력" id="keyword">
	               
	                &nbsp;
	                <button type="button" class="btn-sm btn_black" id="searchBtn" onclick="searchList(1);">조회</button>
	                <br><br><br>
	                
	                <!-- 검색기능 -->
	                <script>
	                
	                function searchList(page){
	                	$.ajax({
                			url:"<%= contextPath %>/adSearch.po",
                			type:"post",
                			data:{
                				keyword:$("#keyword").val(),
                				cpage:page
                			},
                			success:function(map){
                				const pi = map.pi; // {}
                				const list = map.list; // [{}, {}, {}]
                				
                				var value = "";
                				for(let i = 0; i < list.length; i++){
									// 검색 결과 넣어주기	
                					
									value += '<tr style="cursor: auto;">'
									     + '<td>' + list[i].pointNo + '</td>'
									     + '<td>' + list[i].userId + '</td>'
									     + '<td>' + list[i].userName + '</td>'
									     + '<td>' + list[i].pointReason + '</td>'
									     + '<td>' + list[i].pointAmount + '</td>'
									     + '<td>' + list[i].pointDate + '</td>'
									     + '<td>' + list[i].pointType + '</td>'
									     + '<td>' + list[i].pointBalance + '</td>'
									     + '<td class="btn_left">'
		                                 + '<button type="button" class="btn-sm btn_black">수정</button>'
		                                 + '</td>'
		                                 + '</tr>';
            					}
                				
                				var ptxt = "";
                				// 페이징바
                				ptxt += '<div class="paging-area" align="center" id="pagingBar">';
                				
                				if(pi.currentPage != 1){
                					ptxt += '<button class="btn btn_black" onclick="searchList(' + (pi.currentPage - 1) + ');">&lt;</button> ';
                				}
                				
                				for(var pp = pi.startPage; pp <= pi.endPage; pp++){
                					if(pp == pi.currentPage) {
                						ptxt += '<button class="btn btn_gray" disabled>' + pp + '</button> ';
                					} else {
                						ptxt += '<button class="btn btn_black" onclick="searchList(' + pp + ');">' + pp + '</button> ';
                					}
                				}
                				
                				if(pi.currentPage != pi.maxPage){
                					ptxt += '<button class="btn btn_black" onclick="searchList(' + (pi.currentPage + 1) + ');">&gt;</button>';
                				}
                				
                				ptxt += "</div>";
                			
                				$("#pointBody").html(value);
                				$("#pagingBar").html(ptxt);
                				
                			}, error:function(){
                				console.log("ajax 검색 기능 실패");
                			}
                		});
	                }
	                </script>
	                
	                <table class="M_member_table table table-hover">
	                    <thead>
	                        <tr class="table_thead_border" style="border-bottom: none;">
	                        	<th width="5%">No.</th>
	                            <th width="10%">아이디</th>
	                            <th width="5%">이름</th>
	                            <th width="30%">포인트 내용</th>
	                            <th width="10%">포인트</th>
	                            <th width="15%">일시</th>
	                            <th width="10%">유형</th>
	                            <th width="10%">잔액</th>
	                            <th width="5%"> </th>
	                        </tr>
	                    </thead>
	                    <tbody id="pointBody">
	                    
	                    <!-- 전체  -->
               			<% for(Point p : list) { %>
	                        <tr style="cursor: auto;">
	                        	<td><%= p.getPointNo() %></td>
	                            <td><%= p.getUserId() %></td>
	                            <td><%= p.getUserName() %></td>
	                            <td><%= p.getPointReason() %></td>
	                            <td><%= p.getPointAmount() %></td>
	                            <td><%= p.getPointDate() %></td>
	                            <td><%= p.getPointType() %></td>
	                            <td><%= p.getPointBalance() %></td>
	                            <td class="btn_left">
	                                <button type="button" class="btn-sm btn_black">수정</button>
	                                
	                            </td>
	                        </tr>
	                        
	                      <% } %>
	                        
	                    </tbody>
	                </table>
	                
	                <br><br>
	                
	            </div>
	            
	            <br><br>
	            
	            <!-- 페이징바 영역 -->
	            <div class="paging-area" align="center" id="pagingBar">
	            	<% if(currentPage != 1) { %>
	            		<button class="btn btn_black" onclick="location.href='<%= contextPath %>/history.po?cpage=<%= pi.getCurrentPage() -1 %>';">&lt;</button>
	            	<% } %>
	            	
	            	<% for(int p = startPage; p <= endPage; p++) { %>
	            		<% if(p == currentPage) { %>
	            			<button class="btn btn_gray" disabled><%= p %></button>
	            		<% } else { %>
	            		 	<button class="btn btn_black" onclick="location.href = '<%= contextPath %>/history.po?cpage=<%= p %>';"><%= p %></button>
	            		<% } %>
	            	<% } %>
	            
	            	<% if(currentPage != maxPage) { %>
	            		<button class="btn btn_black" onclick="location.href='<%= contextPath %>/history.po?cpage=<%= pi.getCurrentPage() + 1 %>';">&gt;</button>
	            	<% } %>
	            
	            </div>
	            
	            <!-- 전체 선택 -->
	            <script>

					// 수정버튼 클릭시 수정 페이지로 이동
	            	$(function(){
	            		$(".M_member_table>tbody>tr").on("click", "td:last-child", function() {
	            			console.log( $(this).parent().children().eq(1).text() );
	            			location.href = "<%= contextPath %>/adUpdateForm.me?mNo=" + $(this).parent().children().eq(1).text();
	            		})

				</script>
				                
		        </div>
		    </main>
		</div>
	</div>
	

</body>
</html>