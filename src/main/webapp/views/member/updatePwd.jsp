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
            
            <form action="<%= contextPath %>/updatePwd.me" method="post" id="updatePwdForm">
	            <h2 class="h_font_weight">비밀번호 찾기</h2>
	            <br>
	            <h3 class="find_pwd_h">비밀번호 변경</h3>
	            <h5 style="color:gray; padding:5px 0;">새로운 비밀번호를 등록해주세요.</h5>
	            <hr class="my-hr2">
	
	            <table class="table">
	                <tr>
	                    <input type="password" style="margin-bottom: 0;" placeholder="새 비밀번호 입력" id="newInputPwd" name="newInputPwd">
						<input type="hidden" name="inputId" value="<%= m.getUserId() %>">	                    
	                    <br>
	                   	<p class="sub_p" style="font-size: 13px;">첫글자는 영문으로, 영문/숫자/특수문자 중 2가지 이상 조합하여 8~16자로 입력하세요.</p>
	                   	<div id="outputNewPwd"></div>
	                </tr>
	                
	                <tr>
	                    <input type="password" placeholder="새 비밀번호 확인" id="checkUpdatePwd" name="checkUpdatePwd">
	                </tr>
	                <tr>
	                	<div id="outputUpdatePwd"></div>
	                </tr>
	                
	                <tr>&nbsp;  <br><br><br></tr>
	                <tr>
	                    <button type="button" class="btn btn_green btn-block btn-lg" id="checkBtn">확인</button>
	                </tr>
	                
	                <script>
	                	$(document).ready(function(){
							
	                		// 새로운 비밀번호 유효성 검사
	                		$("#newInputPwd").keyup(function(){
	                			regExpPwd = /^[a-zA-Z](?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?=[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{7,15}$/;
	                			
	                			if( !regExpPwd.test($("#newInputPwd").val()) ){		// 적합하지 않은 경우
	                				$("#outputNewPwd").html('<p style="color:red; padding-bottom:10px;" align="left">부적합한 비밀번호입니다.</p>');
	                			} else{
	                				$("#outputNewPwd").empty();
	                			}
	        
	                		});
	                		
	                		// 새로운 비밀번호 일치 검사
	                		$("#checkBtn").click(function(){
	                			if( $("#newInputPwd").val() == $("#checkUpdatePwd").val() ){	// 일치할 경우
	                				$("#outputUpdatePwd").empty();
	                				$("#updatePwdForm").submit();
	                			} else {	// 불일치할 경우
	                				$("#outputUpdatePwd").html('<p style="color:red; padding-bottom:10px;" align="left">비밀번호가 일치하지 않습니다.</p>');
	                			}
	                		});
	                		
	                	})
	                </script>
	                
	            </table>
	        </form>

            <br><br><br><br><br><br><br><br><br>

        </div>
    </div>
   
   
   <%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>