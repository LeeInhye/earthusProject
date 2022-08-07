<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.us.cs.faq.model.vo.Faq, java.util.ArrayList, com.us.cs.model.vo.CsCategory"%>
<%
	Faq f = (Faq)request.getAttribute("f");
	String fNo = (String)request.getAttribute("fNo");
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
                    <h3 class="mt-4" style="font-weight:bold">자주 묻는 질문 > 조회, 수정</h3>
		            <hr>
                    
                    <br><br>
                	
                	<form action="<%= contextPath %>/adUpdate.fq" method="post" id="faqUpdateForm">
                		<input type="hidden" name="fNo" value="<%= fNo %>">
	                    <div style="width: 90%" class="main_width  sumin_font_big">
	                        <div>
	                           <select name="csCate" class="form-select select_category">
	                                <!-- db로부터 카테고리를 조회해와서 option요소들을 만들어야함 -->
		                            <% for(int i = 4; i < 9; i++) { %>
			                            <option value="<%= cateList.get(i).getCsNo() %>"><%= cateList.get(i).getCsName() %></option>
		                            <% } %>
	                           </select>
	                            
	                        </div>
	                        
	                        <!-- 선택했던 카테고리가 selected되게 -->
	                        <script>
								$(function(){
									$("#faqUpdateForm option").each(function(){
										if( $(this).val() == "<%= f.getCsCategory() %>" ){
											$(this).attr("selected", true);
										}
									})
								})
							</script>
	
	                        <br><br>  
	
	                        <h4><b>제목</b></h4>
	                        <input type="text" name="fTitle" value="<%= f.getFaqTitle() %>" required>
	
	                        <br><br><br>
	
	                        <h4><b>내용</b></h4>
	                        <textarea name="fContent" required><%= f.getFaqContent() %></textarea>
	
	                        <br><br><br><br>
	
	                        <div class="btn_two_big_btn">
	                            <button type="button" class="btn btn_gray btn_big btn-lg" onclick="location.href='<%= contextPath %>/adList.fq?fpage=1';">목록으로</button>
	                            <button type="button" id="enrollBtn" class="btn btn_black btn_big btn-lg">
	                            수정</button>
	                        </div>
	                    </div>
	                    
		                <!-- 제목, 내용 입력 안했을 때 모달창 -->
		                <script>
		                	$(document).ready(function(){
		                		$("#enrollBtn").click(function(){
			                		if( ($("input[name=fTitle]").val().length) * ($("textarea[name=fContent]").val().length) != 0) {
			                			$("#enrollBtn").removeAttr("data-bs-toggle");
			                			$("#enrollBtn").removeAttr("data-bs-target");
			                			$("#enrollBtn").prop("type", "submit");
			                			
			                		} else{
			                			$("#enrollBtn").attr("data-bs-toggle", "modal");
			                			$("#enrollBtn").attr("data-bs-target", "#blank");
			                		}
		                			
		                		});
		                	}) 
		                </script>
	                </form>
	                
	                
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