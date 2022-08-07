<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.us.point.model.vo.Point, com.us.common.model.vo.PageInfo" 
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
                				
                				var year = "";
	                            var month = "";
	                            var day = ""
	                            var indexM = "";
	                            var indexD = "";
	                            var indexY = "";
                				
	                            if(list.length == 0) {
		        					value += '<tr>'
		        						   + '<td colspan="8">존재하는 내역이 없습니다.</td>'
		        						   + '</tr>';
								} else {
	                				for(let i = 0; i < list.length; i++){
										// 검색 결과 넣어주기	
										value += '<tr style="cursor: auto;">'
										     + '<td>' + list[i].pointNo + '</td>'
										     + '<td>' + list[i].userId + '</td>'
										     + '<td>' + list[i].userName + '</td>'
										     + '<td>' + list[i].pointReason + '</td>'
										     + '<td>' + list[i].pointAmount + '</td>';
										     
									    <!-- 날짜 -->
			                            indexM = list[i].pointDate.indexOf("월");
			                            indexD = list[i].pointDate.indexOf(",");
			                            indexY = list[i].pointDate.length;
			                            
			                            year = list[i].pointDate.substring(indexD + 2, indexY);
			                            month = list[i].pointDate.substring(0, indexM);
			                            day = list[i].pointDate.substring(indexM + 2, indexD);
			                            
			                           	if(month < 10){
			                           		month = "0" + month;
			                           	}
			                           	if(day < 10){
			                           		day = "0" + day;
			                           	}
			                            
			                            value += "<td>" + year + "-" + month + "-" + day + "</td>";
										    
			                            value += '<td>' + list[i].pointType + '</td>'
										      + '<td>' + list[i].pointBalance + '</td>'
			                                  + '</tr>';
	            					}
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
	                        	<th width="10%">No.</th>
	                            <th width="10%">아이디</th>
	                            <th width="8%">이름</th>
	                            <th width="30%">포인트 내용</th>
	                            <th width="10%">포인트</th>
	                            <th width="15%">일시</th>
	                            <th width="5%">유형</th>
	                            <th width="12%">잔액</th>
	                        </tr>
	                    </thead>
	                    <tbody id="pointBody">
	                    
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

		        </div>
		    </main>
		</div>
	</div>
	

</body>
</html>