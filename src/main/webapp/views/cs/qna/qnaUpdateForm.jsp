<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.us.cs.qna.model.vo.Qna, com.us.common.model.vo.Attachment"%>
<%
	Qna q = (Qna)request.getAttribute("q");
	Attachment at = (Attachment)request.getAttribute("at");
%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

   <%@ include file="/views/common/menubar.jsp" %>
   
    <div class="container">
        <br><br><br><br><br><br><br><br><br>
        
        <h2 class="menu_sub_title">Q&A 작성</h2> <br>
        <h5 class="font_bold_gray">
            ※고객센터 운영시간(10:00 ~ 18:00) 이후 문의는 고객센터 운영시간 내에 순차적으로 답변드립니다.
        </h5>
        <hr class="my-hr2"> <br>

		<form action="<%= contextPath %>/update.qa" method="post" enctype="multipart/form-data" id="qnaUpdatetForm">
	       	<input type="hidden" name="qno" value="<%= q.getQnaNo() %>">
	       
	       <!-- 입력했던 내역 보이게 하기 -->
	        <div class="container qna_insert" style="width:90%;">
	            <h3 style="color:#778C79;"><b>&nbsp;&nbsp;&nbsp; <%= loginUser.getUserName() %>님</b></h3>
	            <hr class="my-hr2"> <br>
				
	            <input type="text" class="qna_insert_content" id="qnaTitle" name="qnaTitle" value="<%= q.getQnaTitle() %>" placeholder="제목을 입력해주세요." required>
	            <br><br>
	            <textarea id="qnaContent" name="qnaContent" class="qna_insert_content"
	             style="resize:none; border-radius: 5px; height: 300px; white-space: pre-line;"
	            placeholder="문의 내용을 입력해주세요. (20자 이상 150자 이하)" required><%= q.getQnaContent() %></textarea>
	            
	            <br>
	            <hr class="my-hr2">
				
	            <input type="checkbox" id="pwdCheck" style="vertical-align:bottom;">&nbsp; 
	            <b> &nbsp; 비밀글 &nbsp; </b> 
	            <input type="password" id="qnaPwd" name="qnaPwd" placeholder="비밀번호 숫자 네자리 입력" value="<%= q.getQnaPwd() %>">
	            <div id="outputPwd"></div>
	            <br><br>
	            
	            <script>
	            	$(document).ready(function(){
	            		// 비밀번호가 걸려있으면 자동 체크
	            		if(q.getQnaPwd() == null){
	            			q.setQnaOwd("");
	            		} else{
	            			$("#pwdCheck").prop("checked");
	            		}
	            		
	            		// 비밀글을 체크하고 비밀번호 네자리 입력해야함
	            		if( $("#pwdCheck").is(":checked") ){
	            			$("#qnaPwd").focusout(function(){
	            				
	            				regExpQna = /^[0-9]{4}$/;
	            				
	            				if( !regExpQna.test( $("#qnaPwd").val() )){
	            					$("#outputPwd").html("<span class='tb_enroll_star'>비밀번호 숫자 네자리를 입력해주세요.</span>");
	            				} else{
	            					$("#outputPwd").empty();
	            				}
	            			});
	            		}
	            	})
	            
	            </script>
	            
	            <!--  연락처를 null로 출력시키지 않고 빈 문자열로 출력시킴 -->
	            <% if( q.getQnaEmail() == null ) { %>
	            	<% q.setQnaEmail(""); %>
	            <% } %>
	            <% if( q.getQnaPhone() == null ) { %>
	            	<% q.setQnaPhone(""); %>
	            <% } %>
	            
	            
	            <p>답변 소식을 받을 연락처를 기재해주세요. (택1 필수)</p>
	            <br>

	            <input type="email" id="qnaEmail" name="qnaEmail" placeholder="이메일" value="<%= q.getQnaEmail() %>">
	            <br><br>
	            <input type="text" id="qnaPhone" name="qnaPhone" placeholder="전화번호" value="<%= q.getQnaPhone() %>">
	            <br><br>
	            
	            <p>첨부파일을 기재해주세요. (선택)</p>
	            
	            <!-- 첨부파일이 있을 경우 -->
	            <% if(at != null) { %>
	            	<%= at.getOriginName() %>
	            	<input type="hidden" name="originFileNo" value="<%= at.getFileNo() %>">
	            	
	            	<div class="qna_img">
                    	<img id="titleImg" src = "<%= contextPath %>/<%= at.getFilePath() + at.getChangeName() %>">
                	</div>
	            <% } else {%>
	            	<div class="qna_img">
                    	<img id="titleImg">
                	</div>
	            <% } %>
	            
	            
	            <input type="file" name="upfile" id="upfile" onchange="loadImg(this);">
                
	            <br><br>
	            <h7>* 사진의 크기는 10MB 이하의 jpg, png, gif파일로 첨부 가능합니다.</h7>
	
	
	            <br><br><br><br><br><br><br><br><br>
	
	            <p style="font-weight:300; color:gray;">
	                Earth.Us는 최대한 빠르고 정확하게 고객님께 답변드리도록 최선을 다하겠습니다.
	                <br>
	                대표전화 (02-1234-5678)로 편하게 문의하실 수 있습니다.
	            </p>
	
	            <br><br><br><br><br>
	            <div class="btn_two_center">
	                <button type="button" class="btn btn_gray btn-lg" onclick="history.back();">취소</button>
	                <button type="button" id="insertQnaBtn" class="btn btn_green btn-lg">수정</button>
	            </div>
	            
	            <script>
	            	$(document).ready(function(){
	            		
		            		var length = $("#qnaContent").val().length;
		            		
	            		$("#qnaContent").focusout(function(){
	            			length = $(this).val().length;
		            		if(length < 20 || length > 150){
		            			alert("문의는 20자 이상 150자 이하만 가능합니다.");
		            		}
		            	});
	            		
						$("#insertQnaBtn").click(function(){
							// 연락처를 남기지 않았을 경우
							if( ($("#qnaEmail").val() == "") && ($("#qnaPhone").val() == "") ){
								$("#insertQnaBtn").attr("data-toggle", "modal");
                                $("#insertQnaBtn").attr("data-target", "#nowrite_pe");

							} else if(length >= 20 && length <= 150 && ($("#outputPwd").text() == "") &&
                                       ($("#qnaTitle").val() != "") && ($("#qnaContent").val() != "")  ){ // 문의 내용 글자수 제한과 비밀글 조건 지키기
										$("#insertQnaBtn").removeAttr("data-toggle");
                            			$("#insertQnaBtn").removeAttr("data-target");
										$("#qnaUpdatetForm").submit();
							}
						});
						
						// 이미지 썸네일 부분 클릭시 이미지 파일 선택
						$("#titleImg").click(function(){
							$("#upfile").click();
						});
						
	            	})
						// 이미지 로드
						
					function loadImg(inputFile){
	                    if(inputFile.files.length == 1){    // 파일선택된 경우 => 파일 읽어들여서 미리보기
	                        
	                        // 파일을 읽어들일 FileReader 객체 생성
	                        const reader = new FileReader();
	                        // 파일을 읽어들일 메소드
	                        reader.readAsDataURL(inputFile.files[0]);
	                        // 파일 읽어들이기 완료됐을 때 실행할 함수 정의
	                        reader.onload = function(e){
	                            // e.target.result => 읽어들인 파일의 고유한 url
	                            // console.log(e.target.result);
	                            $("#titleImg").attr("src", e.target.result);
	                        }
	                        
	                    } else{ // 파일 취소됐을 경우 => 미리보기된 것도 사라지게
	                        $("#titleImg").attr("src", null);
	                    }
					}
	            		
	            </script>
	            
	            <br><br><br><br><br><br><br><br><br>
	
	        </div>
        </form>
        
    </div>

	<div class="modal fade" id="nowrite_pe" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
			<!--Content-->
			<div class="modal-content modal_alert">
	
				<!--Body-->
				<div class="modal-body text-center modal_alert_child">
	
					<h4 class="mt-1 mb-2">연락처를 입력해주세요.</h4>
					<br>
					<div class="text-center mt-4"> 
						<button class="btn btn_green btn_medium" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
   
   
   <%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>