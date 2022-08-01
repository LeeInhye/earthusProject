<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	String maxProCode = (String)request.getAttribute("maxProCode");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 > 등록</title>
</head>
<body>

	<%@ include file = "../common/adminMenubar.jsp" %>
	
	<div id="layoutSidenav">
	
		 <!-- 여기부터! -->
      <div id="layoutSidenav_content">
          <main>
              <div class="container-fluid px-4">
                  <div class="container insertProduct">
                      <h3 class="mt-4" style="font-weight:bold;">상품 > 등록</h3>
                      <hr><br>
                      <!-- 테이블 영역 시작-->
                      <form class="form-group" action="<%=contextPath%>/insert.pr" method="post">
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
                                          <input type="text" class="form-control" name="proName" placeholder="상품명을 입력하세요." required>
                                      </td>
                                  </tr>

                                  <tr>
                                      <td class="pro-info">상품코드 : </td>
                                      <td colspan="2">
                                          <input type="text" class="form-control" name="proCode" value="<%= Integer.parseInt(maxProCode) + 1 %>" readonly>
                                      </td>
                                  </tr>
                                  
                                  <tr>
                                      <td class="pro-info">
                                          * 상품간단설명 : 
                                      </td>
                                      <td colspan="2">
                                          <textarea class="form-control" name="proInfo" rows="2" style="resize:none; font-size:small;" placeholder="상품의 간단한 설명을 입력하세요."></textarea>
                                      </td>
                                  </tr>
                                  
                                  <tr>
                                     <td class="pro-info">* 썸네일이미지 : </td>
                                     <td class="img" id="proImg-path">
                                        
                                     </td>
                                     <td>
                                          <input type="file" name="proImg" id="proImg" style="width:0.1px; height:0.1px;" required>
                                          <label for="proImg" class="btn-input">파일선택</label>
                                     </td>
                                  </tr>

                                  <tr>
                                      <td class="pro-info">* 상세이미지 : </td>
                                      <td class="img" id="detailImg-path">
                                        
                                     </td>
                                      <td>
                                          <input type="file" name="detailImg" id="detailImg" style="width:0.1px; height:0.1px" required>
                                          <label for="detailImg" class="btn-input">파일선택</label>
                                      </td>
                                  </tr>

                                  <tr>
                                      <td class="pro-info">
                                          * 판매가격 : 
                                      </td>
                                      <td colspan="2">
                                          <input type="number" class="form-control" name="price" placeholder="판매 가격을 입력하세요. 단위 : 원" required>
                                      </td>
                                  </tr>

                                  <tr>
                                      <td class="pro-info">	
                                          * 재고수량 : 
                                      </td>
                                      <td class="pro-val">
                                          <input type="number" class="form-control" name="stock" id="stock" required>
                                      </td>
                                      <td class="pro-btn"></td>
                                  </tr>

                                  <tr>
                                      <td class="pro-info">* 필수표기정보 : </td>
                                      <td class="img" id="reqInfoImg-path">
                                        
                                     </td>
                                      <td>
                                          <input type="file" name="reqInfoImg" id="reqInfoImg"  style="width:0.1px; height:0.1px" required>
                                          <label for="reqInfoImg" class="btn-input">파일선택</label>
                                      </td>
                                  </tr>
                              </table>
                          </div>

                          <div id="enroll-btn-area">
                              <input onclick="return check();" type="submit" class="btn-input" value="등록" style="border:none;">
                              <a href="" class="btn btn-sm btn-input" style="background:#f2f2f2; color:black; vertical-align:middle;">취소</a>
                          </div>
                      </form>
                      <!-- 테이블 영역 끝-->
                  </div>
              </div>
          </main>
	</div>
  
       <script>
       
       	// ---------- file input 값이 null일 때 modal 발생 ---------- 작동!
       	function check(){
       		$(function(){
       			if( $('input[type=file]').val() == null ){
       				
       				$('#fileCheckModal').modal();
       				return false;
       			}
       		})
       	}
       	
       	// ----------------- 이미지 파일 선택 시 파일 경로 보여줌 --------------- 작동, 근데 fakepath
       	$(document).ready(function() {
       	    $('#proImg').on('change', function() {
       	        $('#proImg-path').text($(this).val());
       	    });
       	 	$('#detailImg').on('change', function() {
    	        $('#detailImg-path').text($(this).val());
    	    });
       	 	$('#reqInfoImg').on('change', function() {
    	        $('#reqInfoImg-path').text($(this).val());
    	    });
       	});
       	// -----------------------------------------------------
       </script>
	

</body>
</html>