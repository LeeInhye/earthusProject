<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	page import="com.us.product.model.vo.Product"
 %>
<%
	Product p = (Product)request.getAttribute("p");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정 - Earth.Us</title>
<style>
	input::placeholder {font-size:small;}
</style>
</head>
<body>
	
	<%@ include file="../common/adminMenubar.jsp" %>
	
	<div id="layoutSidenav">
	
		<div id="layoutSidenav_content">
	        <main>
	            <div class="container-fluid px-4">
	                <div class="container insertProduct">
	                    <h3 class="mt-4" style="font-weight:bold;">상품 > 상품 정보 수정</h3>
	                    <hr><br>
	                    
	                    <!-- 테이블 영역 시작-->
	                    <form class="form-group" action="<%=contextPath%>/update.pr" method="post">
	                        <div class="card mb-4" id="insert-pro-tb" style="border:none;">
	                            <table class="insert-pro-tb">
	                                <tr>
	                                    <td class="pro-info">
	                                        * 카테고리 : 
	                                    </td>
	                                    <td class="pro-val">
	                                        <select name="category" id="category">
	                                            <option value="1">Hair</option>
	                                            <option value="2">Body</option>
	                                            <option value="3">Kitchen</option>
	                                            <option value="4">Bath</option>
	                                        </select>
	                                    </td>
	                                    <td class="pro-btn"></td>
	                                    <td width="45%"></td>
	                                </tr>
	
	                                <tr>
	                                    <td class="pro-info">
	                                        * 상품명 : 
	                                    </td>
	                                    <td colspan="2">
	                                        <input type="text" class="form-control" name="proName" value="<%=p.getProName()%>">
	                                    </td>
	                                </tr>
	
	                                <tr>
	                                    <td class="pro-info">상품코드 : </td>
	                                    <td colspan="2">
	                                        <input type="text" class="form-control" name="proCode" value="<%=p.getProCode()%>" readonly>
	                                    </td>
	                                </tr>
	
	                                <tr>
	                                    <td class="pro-info">* 썸네일이미지 : </td>
	                                    <td class="img">
	                                        <%=p.getProImgPath().substring(22)%>
	                                    </td>
	                                    <td>
	                                        <input type="file" name="proImg" id="proImg" style="display:none;">
	                                        <label for="proImg" class="btn-input">파일선택</label>
	                                    </td>
	                                </tr>
	
	                                <tr>
	                                    <td class="pro-info">* 상세이미지 : </td>
	                                    <td class="img">
	                                    	<%=p.getDetailImgPath().substring(22)%>
	                                    </td>
	                                    <td>
	                                        <input type="file" name="detailImg" id="detailImg" style="display:none;">
	                                        <label for="detailImg" class="btn-input">파일선택</label>
	                                    </td>
	                                </tr>
	
	                                <tr>
	                                    <td class="pro-info">
	                                        * 판매가격 : 
	                                    </td>
	                                    <td colspan="2">
	                                        <input type="number" class="form-control" name="price" value="<%=p.getPrice()%>">
	                                    </td>
	                                </tr>
									
	                                <tr>
	                                    <td class="pro-info">* 필수표기정보 : </td>
	                                    <td>
	                                        <%=p.getReqInfoImgPath().substring(22)%>
	                                    </td>
	                                    <td>
	                                        <input type="file" name="reqInfoImg" id="reqInfoImg" style="display:none;">
	                                        <label for="reqInfoImg" class="btn-input">파일선택</label>
	                                    </td>
	                                </tr>
	                              	<input type="hidden" name="existProImg" id="existProImg" value="<%=p.getProImgPath()%>">
	                              	<input type="hidden" name="existDetailImg" id="existDetailImg" value="<%=p.getDetailImgPath()%>">
	                              	<input type="hidden" name="existReqInfoImg" id="existReqInfoImg" value="<%=p.getReqInfoImgPath()%>">
	                            </table>
	                        </div>
	
	                        <div id="enroll-btn-area">
	                            <input type="submit" value="저장" class="btn-input" style="border:none;">
	                            <a href="<%=contextPath%>/adlist.pr?cpage=1" class="btn btn-sm btn-input" style="background:#f2f2f2; color:black; vertical-align:middle; font-size:small;">취소</a>
	                        </div>
	                    </form>
	                    <!-- 테이블 영역 끝-->
	                </div>
	            </div>
	        </main>
		</div>
		
		  <!-- 상품 수정 버튼 클릭 시 modal -->
		  <div class="modal fade" id="proUpdateModal">
		    <div class="modal-dialog modal-sm">
		      <div class="modal-content">
		      
		        <!-- Modal body -->
		        <div class="modal-body">
		          상품 정보를 수정하시겠습니까?
		        </div>
		        
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn btn-medium btn-gray" data-dismiss="modal">취소</button>
		          <a href="" class="btn btn-medium btn-gray">확인</a>
		        </div>
		        
		      </div>
		    </div>
		  </div>
		
	</div>
    <script>
    
    $(function(){
    	<% for(int i=0; i<4; i++){ %> // 카테고리
    if( $('#category option:eq(<%=i%>)').val() == <%=p.getCategory()%> ){
    	$(this).prop("selected", true);
    }
    <%}%>

    price();

    function price(){ // 천원 단위로 콤마 찍기
    	var price = <%=p.getPrice()%>;
    		$('input[type=number]').attr("placeholder", price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원" );
    	}
    	
    	if( $('input[type=file]').val() != null){ // 이미지 파일 업로드 시
    		$(this).parents('.img').text( $(this).val() );
    	}
    	
    })
    
    function proUpdate(){
    	$(function(){
       
       $('#proUpdateModal').modal();

    	})
    }
    </script>
</body>
</html>