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
            
            <h2 class="h_font_weight">비밀번호 찾기</h2>
            <br>
            <h5 style="color:gray; padding:5px 0;">비밀번호가 정상적으로 변경되었습니다.</h5>

            <br><br>
            <button class="btn btn_green btn-block btn-lg" onclick="goLogin();">로그인</button>

			<script>
				function goLogin(){
					location.href = "<%= contextPath %>/goLogin.me";
				}
			</script>

            <br><br><br><br><br><br><br><br><br>

        </div>
    </div>
   
   <%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>