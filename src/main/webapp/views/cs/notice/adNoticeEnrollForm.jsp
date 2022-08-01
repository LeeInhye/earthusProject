<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

   <%@include file = "/views/common/adminMenubar.jsp" %>
   
   <div id="layoutSidenav">
       <div id="layoutSidenav_content">
            <main>
            	<div class="container-fluid px-4 btnHover notice_text">
		        <br>
                    <h3 class="mt-4" style="font-weight:bold">공지사항 > 등록</h3>
		            <hr>
                    
                    <br><br>
                	
                	<form action="<%= contextPath %>/adEnroll.no" method="post" id="noticeEnrollForm">
	                    <div style="width: 90%" class="main_width  sumin_font_big">
	                        <div>
	                           <select name="csCate" class="form-select select_category">
	                                <option value="10" selected>공지사항</option>
	                                <option value="11">배송안내</option>
	                                <option value="12">이벤트</option>
	                                <option value="13">채용공고</option>
	                           </select>
	                            
	                        </div>
	
	                        <br><br>  
	
	                        <h4><b>제목</b></h4>
	                        <input type="text" name="nTitle" required>
	
	                        <br><br><br>
	
	                        <h4><b>내용</b></h4>
	                        <textarea name="nContent" required></textarea>
	
	                        <br><br><br><br>
	
	                        <div class="btn_two_big_btn">
	                            <button type="button" class="btn btn_gray btn_big btn-lg" onclick="history.back();">취소</button>
	                            <button type="button" id="enrollBtn" class="btn btn_black btn_big btn-lg">등록</button>
	                        </div>
	                    </div>
	                </form>
	                
	                <!-- 제목, 내용 입력 안했을 때 모달창 -->
	                <script>
	                	$(document).ready(function(){
	                		$("#enrollBtn").click(function(){
		                		if( ($("input[name='nTitle']").val() == "") || ($("textarea[name='nContent']").val() == "") ) {
		                			$("#enrollBtn").attr("data-bs-toggle", "modal");
		                			$("#enrollBtn").attr("data-bs-target", "#blank");
		                		} else{
		                			$("#enrollBtn").removeAttr("data-bs-toggle");
		                			$("#enrollBtn").removeAttr("data-bs-target");
		                			$("#noticeEnrollForm").submit();
		                		}
	                			
	                		});
	                	}) 
	                </script>
	                
	                <!-- 모달 -->
	                <div class="modal fade" id="blank" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                    <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
	                        <!--Content-->
	                        <div class="modal-content modal_alert">
	                            
	                            <!--Body-->
	                            <div class="modal-body text-center modal_alert_child">
	                                <div>
	                
	                                    <h5 class="mt-1 mb-2">제목, 내용을 입력해주세요</h5>
	                                    <br>                                
	                                    <div class="text-center mt-4"> 
	                                        <button type="button" class="btn btn_black btn_medium" data-bs-dismiss="modal">확인</button>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>

                    <br><br><br>

                </div>
            </main>

        </div>
   </div>
   
   

</body>
</html>