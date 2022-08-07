<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.us.cs.model.vo.CsCategory"%>
<%
	ArrayList<CsCategory> cateList = (ArrayList<CsCategory>)request.getAttribute("cateList");
%>
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
                    <h3 class="mt-4" style="font-weight:bold">자주 묻는 질문 > 등록</h3>
		            <hr>
                    
                    <br><br>
                	
                	<form action="<%= contextPath %>/adEnroll.fq" method="post" id="faqEnrollForm">
	                    <div style="width: 90%" class="main_width  sumin_font_big">
	                        <div>
	                           <select name="csCate" class="form-select select_category">
	                           		<!-- db로부터 카테고리를 조회해와서 option요소들을 만들어야함 -->
		                            <% for(int i = 4; i < 9; i++) { %>
			                            <option value="<%= cateList.get(i).getCsNo() %>"><%= cateList.get(i).getCsName() %></option>
		                            <% } %>
	                           </select>
	                            
	                        </div>
	                        
	                        <br><br>  
	
	                        <h4><b>질문</b></h4>
	                        <input type="text" name="fTitle" required>
	
	                        <br><br><br>
	
	                        <h4><b>답변</b></h4>
	                        <textarea name="fContent" required></textarea>
	
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
		                		if( ($("input[name='fTitle']").val() == "") || ($("textarea[name='fContent']").val() == "") ) {
		                			$("#enrollBtn").attr("data-bs-toggle", "modal");
		                			$("#enrollBtn").attr("data-bs-target", "#blank");
		                		} else{
		                			$("#enrollBtn").removeAttr("data-bs-toggle");
		                			$("#enrollBtn").removeAttr("data-bs-target");
		                			$("#faqEnrollForm").submit();
		                		}
	                			
	                		});
	                	}) 
	                </script>
	                
	                <!-- 모달 -->
	                <div class="modal" id="blank" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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