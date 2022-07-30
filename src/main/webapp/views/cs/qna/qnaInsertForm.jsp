<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

		<form action="<%= contextPath %>/insert.qa" method="post" enctype="multipart/form-data" id="qnaInsertForm">
	        <div class="container qna_insert" style="width:90%;">
	            <h3 style="color:#778C79;"><b> &nbsp;&nbsp;&nbsp; <%= loginUser.getUserName() %>님</b></h3>
	            <hr class="my-hr2"> <br>
				
	            <input type="text" class="qna_insert_content" id="qnaTitle" name="qnaTitle" placeholder="제목을 입력해주세요." required>
	            <br><br>
	            <textarea id="qnaContent" name="qnaContent" class="qna_insert_content"
	             style="resize:none; border-radius: 5px; height: 300px; white-space: pre;"
	            placeholder="문의 내용을 입력해주세요. (20자 이상 150자 이하)" required></textarea>
	            
	            <br>
	            <hr class="my-hr2">
				
				
	            <input type="checkbox" style="vertical-align:bottom;">&nbsp; 
	            <b> &nbsp; 비밀글 &nbsp; </b> 
	            <input type="password" id="qnaPwd" name="qnaPwd" placeholder="비밀번호 네자리 입력">
	            <br><br>
	            
	            <p>답변 소식을 받을 연락처를 기재해주세요. (택1 필수)</p>
	            <br>
	            <!-- 해당 회원의 이메일과 번호 placeholder로 -->
	            <input type="email" id="qnaEmail" name="qnaEmail" placeholder="이메일">
	            <br><br>
	            <input type="text" id="qnaPhone" name="qnaPhone" placeholder="전화번호">
	            <div id="outputqna" style="text-align: left;"></div>
	            <br><br>
	            
	            <p>첨부파일을 기재해주세요. (선택)</p>
	            <input type="file" name="upfile" id="upfile">
	            <br><br>
	            <h7>* 사진의 크기는 10MB 이하의 jpg, png, gif파일로 첨부 가능합니다.</h7>
	
	            <br><br><br><br><br>
	
	            <p style="font-weight:300; color:gray;">
	                Earth.Us는 최대한 빠르고 정확하게 고객님께 답변드리도록 최선을 다하겠습니다.
	                <br>
	                대표전화 (02-1234-5678)로 편하게 문의하실 수 있습니다.
	            </p>
	
	            <br><br><br><br><br>
	            <div class="btn_two_center">
	                <button type="button" class="btn btn_gray btn-lg" onclick="history.back();">취소</button>
	                <button type="button" id="insertQnaBtn" class="btn btn_green btn-lg">등록</button>
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
								$("#outputqna").html("<span class='tb_enroll_star'>연락처를 하나 남겨주세요.</span>");
							} else if(length >= 20 && length <= 150){
								$("#outputqna").empty();
								$("#qnaInsertForm").submit();
							}
						});
	            		
	            	})
	            </script>
	            
	            <br><br><br><br><br><br><br><br><br>
	
	        </div>
        </form>
        
    </div>
   
   
   <%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>