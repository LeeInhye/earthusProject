<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

   <%@ include file="/views/common/menubar.jsp" %>
   
   <div class="container">
        <div class="login_section">
            <br><br><br><br><br><br><br><br><br>
            
            <h2 class="h_font_weight">본인인증</h2>
            <br>
            <h3 class="find_pwd_h">인증번호 입력</h4>
            <h5 style="color:gray; padding:5px 0;">수신된 메일의 인증번호를 입력해주세요.</h5>
            <hr class="my-hr2">

            <table class="table">
                <tr>
                    <br>
                    <input type="text" placeholder="인증번호 입력" name="ranNum" id="ranNum">
                    <div id="outputRan"></div>
                </tr>
                
                <tr>&nbsp; <br><br>
                <tr>
                    <div id="findPwdBtn">
                        <button type="button" class="btn btn_light_green btn-lg" onclick="history.back();">이전</button>
                        <button type="button" class="btn btn_light_green btn-lg" id="nextBtn">다음</button>
                    </div>
                    
                    <script>
                    	$(document).ready(function(){
                    		$("#nextBtn").click(function(){
                    			if($("#ranNum").val() == ""){	// 빈 문자열이면 인증번호 틀린거
                    				$("#outputRan").html('<p style="color:red; padding-bottom:10px;" align="left">인증번호가 틀렸습니다. 다시 입력해주세요.</p>');
                    				$("#nextBtn").removeAttr("data-toggle");
                    				$("#nextBtn").removeAttr("data-target");
                    			
                    			} else{		// 아무 숫자 입력하면 통과
                    				$("#outputRan").empty();
                    				$("#nextBtn").attr("data-toggle", "modal");
                    				$("#nextBtn").attr("data-target", "#auth_email");
                    			}
                    		});
                    	})
                    
                    
                    </script>
                    
                </tr>
            </table>
            
            <div class="modal fade" id="auth_email" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		        <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
		            <!--Content-->
		            <div class="modal-content modal_alert">
		
		                <!--Body-->
		                <div class="modal-body text-center modal_alert_child">
		                    <div>
		
		                        <h4 class="mt-1 mb-2">인증되었습니다.</h4>
		                        <br>
		                        <div class="text-center mt-4"> 
		                            <button class="btn btn_green btn_medium" onclick="nextBtn();">확인</button>
		                        </div>
		                        
		                        <script>
		                        	function nextBtn(){
		                        		location.href = "<%= contextPath %>/goUpdatePwd.me";
		                        	}
		                        </script>
		                        
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>


            <br><br><br><br><br><br><br><br><br>

        </div>
    </div>
   
   <%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>