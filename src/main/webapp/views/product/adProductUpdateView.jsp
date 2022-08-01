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
	                                        <%=p.getProImgPath().substring( p.getReqInfoImgPath().lastIndexOf('/')+1 )%>
	                                    </td>
	                                    <td>
	                                        <input type="file" name="proImg" id="proImg" style="display:none;">
	                                        <label for="proImg" class="btn-input">파일선택</label>
	                                    </td>
	                                </tr>
	
	                                <tr>
	                                    <td class="pro-info">* 상세이미지 : </td>
	                                    <td class="img">
	                                    	<%=p.getDetailImgPath().substring( p.getReqInfoImgPath().lastIndexOf('/')+1 )%>
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
	                                        <%=p.getReqInfoImgPath().substring( p.getReqInfoImgPath().lastIndexOf('/')+1 )%>
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
	                            <input data-toggle="modal" data-target="proUpdateModal" type="submit" value="저장" class="btn-input" style="border:none;">
	                            <a href="<%=contextPath%>/adlist.pr?cpage=1" class="btn btn-sm btn-input" style="background:#f2f2f2; color:black; vertical-align:middle; font-size:small;">취소</a>
	                        </div>
	                    </form>
	                    <!-- 테이블 영역 끝-->
	                </div>
	            </div>
	        </main>
		</div>
		
	</div>
    <script>
    $(function(){
    	
    	// -------- 상품의 기존 카테고리가 선택되어 있도록 --------- 동작!
	   $("#category option").each(function(){
			if($(this).val() == "<%=p.getCategory()%>"){
				$(this).attr("selected", true);
			}
		})
		// --------------------------------------------
		
	// ------------ 천 원 단위로 콤마 찍어서 반환 --------------- 동작!
    price();

    function price(){ // 천원 단위로 콤마 찍기
    	var price = <%=p.getPrice()%>;
    		$('input[type=number]').attr("placeholder", price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원" );
    	}
    	
    	if( $('input[type=file]').val() != null){ // 이미지 파일 업로드 시
    		$(this).parents('.img').text( $(this).val() );
    	}
    	
    })
    // -------------------------------------------------
    
    // ------------ 파일 input 요소에 값이 들어왔을 떄 ------------ 동작 x
    fileInputCheck();
    
    function fileInputCheck(){
    	if( $('input[type=file]').length != 0){ 
    		$(this).parent().eq(1).text( '파일 값 변경됨' ); 
    	}
    }
    // ---------------------------------------------------
    </script>
</body>
</html>