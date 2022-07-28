<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member m = (Member)session.getAttribute("pwdM");
%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

   <%@ include file="/views/common/menubar.jsp" %>
   		
   <div class="container">
        <div class="login_section">
            <br><br><br><br><br><br><br><br><br>
            
            <h2 class="h_font_weight">비밀번호 찾기</h2>
            <br>
            <h4 class="find_pwd_h">이메일 인증번호 발송</h4>
            <hr class="my-hr2">

            <table class="table">
                
                <tr>
                    <div>
                    	<%
                    		StringBuffer sendEmail = new StringBuffer();
                    		sendEmail.append(m.getEmail());	// 해당 회원의 이메일 문자열
                    		int end = sendEmail.indexOf("@");
                    		sendEmail.replace(2, end, "****");
                    	%>
                        <p style="padding: 15px 0;">
                            이메일 인증 (&nbsp;<%= sendEmail %>&nbsp;) <br>
                            가입시 등록한 이메일로 인증번호가 발송됩니다.
                        </p>
                    </div>
                </tr>
                <tr>&nbsp;  
                <tr>
                    <button type="button" class="btn btn_light_green btn-block btn-lg" data-toggle="modal" data-target="#send_email">메일 발송</button>
                </tr>
                
                <!-- 메일 발송 모달창 -->
                <div class="modal fade" id="send_email" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			        <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
			            <!--Content-->
			            <div class="modal-content modal_alert">
			
			                <!--Body-->
			                <div class="modal-body text-center modal_alert_child">
			                    <div>
			
			                        <h4 class="mt-1 mb-2">메일이 발송되었습니다.</h4>
			                        <br>
			                        <div class="text-center mt-4"> 
			                            <button class="btn btn_green btn_medium" onclick="next();">확인</button>
			                        </div>
			                        
			                        <script>
			                        	function next(){
			                        		location.href = "<%= contextPath %>/veriNum.me";
			                        	}
			                        </script>
			                        
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
                
            </table>


            <br><br><br><br><br><br><br><br><br>

        </div>
    </div>		
   		
   		
   		
   
   
   <%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>