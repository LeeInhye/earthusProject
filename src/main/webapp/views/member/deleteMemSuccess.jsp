<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

   <%@ include file="/views/common/menubar.jsp" %>
   
   <br><br><br><br>
    <div class="container">
        
        
        <div class="qna_insert_success">
            <div class="qna_insert_img">
                <img src="<%= contextPath %>/resources/img/sub_logo.png" style="width: 100%; height: 100%;">
            </div>
        </div>

        <div class="enroll_padding qna_centered">
            <span style="color:rgb(119, 140, 121); font-weight: 900; font-size:35px;">✓</span>
            <span style="font-size: 25px;"><b> &nbsp;회원탈퇴가 안전하게 완료되었습니다.</b></span>
            <br><br><br>
            <p style="font-size: 17px;">
                그동안 얼스어스와 함께해 주셔서 감사합니다!
                <br><br>
                불편했던 부분이나 문제점이 있으셨다면 얼스어스에게 알려 주세요. <br>
                다시 만날 그 날을 기다리며 보다 더 나은 서비스로 찾아뵙겠습니다.
            </p>
            
            <br><br><br><br>
         
            <div class="btn_center">
                <button type="button" class="btn btn_green" style="width: 250px; height:40px;" onclick="location.href='<%= contextPath %>'">메인 화면으로</button>
            </div>
        </div>
		<br><br><br><br>

    </div>
   
   <%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>