<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page
	import="java.util.ArrayList, com.us.common.model.vo.PageInfo, com.us.product.model.vo.Product"
 %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 관리 > 상품 > 조회 - Earth.Us</title>
</head>
<body>

	<%@include file = "../common/adminMenubar.jsp" %>
	
	
	<div id="layoutSidenav">
		<div id="layoutSidenav_content">
	        <main>
	            <div class="container-fluid px-4">
	                <div class="container selectProduct">
	                    <h3 class="mt-4" style="font-weight:bold;">상품 > 조회</h3>
	                    <hr><br>
	
	                    <div class="container pro-info-area">
	                        <!-- 정렬 바 시작-->
	                        <div class="pro-info-var">
	                            <table height="100%" style="margin:auto">
	                                <tr>
	                                    <td width="20%" class="tb-title">카테고리</td>
	                                    <td width="80%" colspan="3" id="category">
	                                        <input type="checkbox" name="hair" id="hair" value="1" checked> <label for="hair">Hair</label>
	                                        <input type="checkbox" name="body" id="body" value="2" checked> <label for="body">Body</label>
	                                        <input type="checkbox" name="kitchen" id="kitchen" value="3" checked> <label for="kitchen">Kitchen</label>
	                                        <input type="checkbox" name="bath" id="bath" value="4" checked> <label for="bath">Bath</label>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td class="tb-title">상품 등록일</td>
	                                    <td width="40%">
	                                        <button type="button" class="btn btn-sm" onclick="dateAll();" disabled>전체</button>
	                                        <button type="button" class="btn btn-sm" onclick="dateNow();">오늘</button>
	                                        <button type="button" class="btn btn-sm" onclick="date7();">7일</button>
	                                        <button type="button" class="btn btn-sm" onclick="date30();">30일</button>
	                                    </td>
	                                    <td width="40%" colspan="2">
	                                        <input type="date" class="btn btn-sm" name="startDate"> ~ <input type="date" class="btn btn-sm" name="endDate">
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td class="tb-title">검색</td>
	                                    <td colspan="2">
	                                        <input type="text" class="form-control" name="proKeyword" placeholder="키워드를 입력하세요.">
	                                    </td>
	                                    <td>
	                                    	<input type="submit" class="btn btn-sm btn-update" value="조회" style="margin-left:20px;">
	                                    </td>
	                                </tr>
	                            </table>
	                        </div>
	                        <hr>
	                        <!-- 정렬 바 끝 -->
	
	                        <!-- 상품 조회 영역 시작-->
	                        <table id="pro-select-tb" border="1">
	                            <thead>
	                                <tr height="30px">
	                                    <th width="5%">
	                                        <input type="checkbox" id="selectAll">
	                                    </th>
	                                    <th width="30%">
	                                        상품코드
	                                    </th>
	                                    <th width="30%">
	                                        상품명
	                                    </th>
	                                    <th width="25">
	                                        재고수량
	                                    </th>
	                                    <th width="10%">
	
	                                    </th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                            
	                            	<% for(Product p : list) { %>
	                                <tr>
	                                    <td>
	                                        <input type="checkbox" class="checkbox">
	                                    </td>
	                                    <td class="proCode"><%= p.getProCode() %></td>
	                                    <td><%= p.getProName() %></td>
	                                    <td><%= p.getStock() %></td>
	                                    <td>
	                                        <button class="btn btn-sm btn-update" onclick="updatePro(<%=p.getProCode()%>);">수정</button>
	                                    </td>
	                                </tr>
	                                <% } %>
	                            </tbody>
	                        </table>
	
	                        <button class="btn btn-sm btn-update" id="pro-delete-btn" style="width:80px; margin-top:10px;">상품삭제</button>
	                        
	                        <!----- 상품 삭제 Modal ----->
							  <div class="modal fade" id="deleteModal">
							    <div class="modal-dialog modal-sm">
							      <div class="modal-content">
							        
							        <!-- Modal body -->
							        <div class="modal-body">
							          정말로 삭제하시겠습니까?
							        </div>
							        
							        <!-- Modal footer -->
							        <div class="modal-footer">
							          <button type="submit" class="btn btn-update">삭제</button>
							          <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							        </div>
							        
							      </div>
							    </div>
							  </div>
							  <!----- 상품 삭제 Modal 끝 ----->
	                        
	                        <div class="pageination">
	                        	<nav aria-label="Page navigation example">
	                        		<ul class="pagination justify-content-center">
	                        		
	                        			<% if(currentPage != 1) { %>
	                        			<li class="page-item">
	                        				<a class="page-link" href="<%=contextPath%>/adlist.pr?cpage=<%=currentPage-1%>" aria-label="Previous">
	                        					<i class="fa-solid fa-angle-left"></i>
	                        				</a>
	                        			</li>
	                        			<% } %>
	                        			
	                        			<% for(int p=startPage; p<=endPage; p++) { %>
	                        			
		                        			<% if(p == currentPage) {%>
		                        			<li class="page-item active"><a class="page-link" href="<%=contextPath%>/adlist.pr?cpage=<%=p%>"><%=p%></a></li>
		                        			<% } else {%>
		                        			<li class="page-item">
		                        				<a class="page-link" href="<%=contextPath%>/adlist.pr?cpage=<%=p%>"><%=p%></a>
		                        			</li>
		                        			<% } %>
	                        			<% } %>
	                        			
	                        			<% if(currentPage != maxPage) { %>
	                        			<li class="page-item">
	                        				<a class="page-link" href="<%=contextPath%>/adlist.pr?cpage=<%=currentPage+1%>" aria-label="Next">
	                        					<i class="fa-solid fa-angle-right"></i>
	                        				</a>
	                        			</li>
	                        			<% } %>
	                        		</ul>
	                        	</nav>
	                        </div>
	                        <!-- 상품 조회 영역 끝-->
	                    </div>
	                </div>
	            </div>
	        </main>
	     </div>
      </div>
                
        <script>
            function dateAll(){
                // 클릭된 버튼만 lightgray 배경!!
                
            }

            $('#pro-delete-btn').click(function(){ // 상품 삭제 버튼 클릭 시
                
                if($(".checkbox:checked").length == 0){ // 체크된 상품이 없다면
                	
            		alert("삭제할 항목을 선택해 주세요.");
            		
            	}else{ // 체크된 상품이 있다면
            		
            		$('#deleteModal').modal();
            	}
            })
            
            function updatePro(no){ // 상품 수정 버튼 클릭 시
            	
            	location.href = "<%=contextPath%>/update.pr?no=" + no;
          
            }
            
            
        </script>
</body>
</html>