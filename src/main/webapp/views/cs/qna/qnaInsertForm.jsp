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
	             style="resize:none; border-radius: 5px; height: 300px; white-space: pre-line;"
	            placeholder="문의 내용을 입력해주세요. (20자 이상 150자 이하)" required></textarea>
	            
	            <br>
	            <hr class="my-hr2">
				
				
	            <input type="checkbox" id="pwdCheck" style="vertical-align:bottom;">&nbsp; 
	            <b> &nbsp; 비밀글 &nbsp; </b> 
	            <input type="password" id="qnaPwd" name="qnaPwd" placeholder="비밀번호 숫자 네자리 입력" disabled>
	            <div id="outputPwd"></div>
	            <br><br>
	            
	            <script>
	            	$(document).ready(function(){
	            		// 체크박스 체크하면 input 비활성화 해제
						$("#pwdCheck").change(function(){
							if( $("#qnaPwd").is(":disabled") ) {
								$("#qnaPwd").prop("disabled", false);
							} else {
								$("#qnaPwd").val("");
								$("#qnaPwd").prop("disabled", true);
							}
							
						})
	            		
	            		
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
	            
	            
	            <p>답변 소식을 받을 연락처를 기재해주세요. (택1 필수)</p>
	            <br>
	            <!-- 해당 회원의 이메일과 번호 placeholder로 -->
	            <input type="email" id="qnaEmail" name="qnaEmail" placeholder="이메일">
	            <br><br>
	            <input type="text" id="qnaPhone" name="qnaPhone" placeholder="전화번호">
	            <br><br>
	            
	            
	            <p>첨부파일을 기재해주세요. (선택)</p>
	            <div class="qna_img">
                    <img id="titleImg">
                </div>
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
							console.log(($("#qnaTitle").val().length) * ($("#qnaContent").val().length));
							// 제목, 내용 미입력시 뜨는 모달
							if( ($("#qnaTitle").val().length) * ($("#qnaContent").val().length) == 0){
								$("#insertQnaBtn").attr("data-toggle", "modal");
                                $("#insertQnaBtn").attr("data-target", "#noContent");
							} else if( ($("#qnaEmail").val() == "") && ($("#qnaPhone").val() == "") ){
								// 연락처를 남기지 않았을 경우
								$("#insertQnaBtn").attr("data-toggle", "modal");
                                $("#insertQnaBtn").attr("data-target", "#nowrite_pe");
                                $("#insertQnaBtn").click();
							} else if(length >= 20 && length <= 150 && ($("#outputPwd").text() == "") ){ // 문의 내용 글자수 제한과 비밀글 조건 지키기
										$("#insertQnaBtn").removeAttr("data-toggle");
                            			$("#insertQnaBtn").removeAttr("data-target");
										$("#qnaInsertForm").submit();
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
	
	<!-- 연락처 미입력 모달 -->
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
	
	<!-- 제목, 내용 미입력 모달 -->
	<div class="modal fade" id="noContent" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
			<!--Content-->
			<div class="modal-content modal_alert">
	
				<!--Body-->
				<div class="modal-body text-center modal_alert_child">
	
					<h4 class="mt-1 mb-2">제목, 내용을 입력해주세요.</h4>
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