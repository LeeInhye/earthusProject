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

<style>
.modal-body {
	text-align:center !important;
		height:100px !Important;
}
.modal-footer{
	text-align:center;
	border-top:none !important;
}
.btn-s-modal {
	display:inline-block;
	width:100%;
	background:#778c79 !important;
	color:#f2f2f2 !important;
	text-align:center;
	height:40px;
}
.modal-content {
	background:lightgray !important;
	line-height: 100px;
}
.btn-update:hover {
	background:#f2f2f2 !important;
	color:#404040 !important;
}


</style>
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
	                                    	<button type="button" oncick="searchPro();" class="btn btn-sm btn-update" style="margin-left:20px; width:100px; height:40px;">조회
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
	                                        <input type="checkbox" class="checkbox" value="<%=p.getProCode()%>">
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
	
	                        <button class="btn btn-sm btn-update" id="pro-delete-btn" style="width:85px; margin-top:10px;">상품삭제</button>
	                        
							  <!----- 삭제할 항목을 선택해 주세요 Modal ----->
							  <div class="modal fade" id="deteteModal1">
							    <div class="modal-dialog modal-sm">
							      <div class="modal-content">
							        
							        <!-- Modal body -->
							        <div class="modal-body">
							          삭제할 항목을 선택해 주세요.
							        </div>
							        
							        <!-- Modal footer -->
							        <div class="modal-footer">
							          <button type="button" class="btn btn-s-modal" data-dismiss="modal">확인</button>
							        </div>
							        
							      </div>
							    </div>
							  </div>
							  <!----- 상품 삭제 Modal 끝 ----->
							  
	                        <!----- 정말로 삭제하시겠습니까? Modal ----->
							  <div class="modal fade" id="deleteModal2">
							    <div class="modal-dialog modal-sm">
							      <div class="modal-content">
							        
							        <!-- Modal body -->
							        <div class="modal-body">
							          정말로 삭제하시겠습니까?
							        </div>
							        
							        <!-- Modal footer -->
							        <div class="modal-footer">
							          <button type="button" onclick="deletePro();" class="btn btn-no-modal" style="display:inline-block;width:45%;background:#778c79;color:#f2f2f2;">삭제</button>
							          <button type="button" class="btn btn-ok-modal" style="display:inline-block;width:45%;background:#f2f2f2;color:#404040;" data-bs-dismiss="modal">취소</button>
							        </div>
							        
							      </div>
							    </div>
							  </div>
							  <!----- 정말로 삭제하시겠습니까? Modal 끝 ----->
							  
	                        
	                        <!------- 페이징 처리 ------>
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
	                        <!------- 페이징 처리 끝 ------>
	                        
	                    </div>
	                </div>
	            </div>
	        </main>
	     </div>
      </div>
      <!-- 상품 조회 영역 끝-->
                
        <script>
            function dateAll(){
                // 클릭된 버튼만 lightgray 배경!!
                
            }
            
            // ---------- 전체 체크 체크박스 jQuery ----------- 동작!
            $('#selectAll').click(function(){
            	
	            if( $('#selectAll').is(":checked") ){
	            	
	            	$('.checkbox').prop("checked", true);
	            }else{
	            	$('.checkbox').prop("checked", false);
	            }
            })
            // ------------------------------------------
            
            
            // ------------- 상품 삭제 버튼 클릭 시 -------------- 동작 o
            $('#pro-delete-btn').click(function(){
                
                if($(".checkbox:checked").length == 0){ // 체크된 상품이 없다면
                	
            		$('#deleteModal1').modal('show');
            		
            	}else{ // 체크된 상품이 있다면
            		
            		$('#deleteModal2').modal('show');
            	}
            })
            
            function proCodeArr(){
            	
            	let arr = [];
            	$(".checkbox").each(function(){
            		if( $(this).is(":checked") ){
			           arr.push($(this).val()); // 체크된 체크박스 값 뽑기
            		}
            	})
            	return arr;
            }
            
            function sendArr(no){
            	location.href = "<%=contextPath%>/delete.pr?no="+ no;
            }
            
           	function deletePro(){
            	
            	let no = proCodeArr();
            	
            	sendArr(no);
            	
            }
            
            
            // --------------------------------------------
            
            // ------------- 상품 수정 버튼 클릭 시 --------------  동작 O
            function updatePro(no){
            	
            	location.href = "<%=contextPath%>/updateForm.pr?no=" + no;
          
            }
            // --------------------------------------------
            
            // ------------- 상품 카테고리,키워드로 검색 ---------------
            function searchPro(){
            	
            	let categoryNo = "";
            	// 선택된 카테고리의 번호 담기 ()
            	$("#category:option").each(function(){
            		if( $(this).is(":chekced") ){
            			category = category + $(this).val();
            		}
            	})
            	
            	$.ajax({
            		
            		url:"<%=contextPath%>/search.pr",
            		data:{
            			
            			 }
            		
            	})
            	
            }
        </script>
</body>
</html>