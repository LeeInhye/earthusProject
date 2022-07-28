<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member m = (Member)session.getAttribute("m");
%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

	<%@ include file="/views/common/menubar.jsp" %>	
	
	<div class="container" style="height:960px;">
        <br><br><br><br><br><br>
        
        <div class="enroll_success">
            <div class="enroll_padding">
                <p style="color:rgb(119, 140, 121); font-size:100px; text-align:center;">✓</p>
                <br>
                <h4><b><%= m.getUserName() %></b>님의 아이디는 <br></h4>
                <h4><b><%= m.getUserId() %></b> 입니다.</h4>
                <br>
                <hr class="my-hr2">                
                
                <br>
                <div class="btn_center">
                    <button class="btn btn-lg btn_light_green btn-block">비밀번호 찾기</button>
                    
                    <button class="btn btn-lg btn-block btn_light_green">로그인 하기</button>
                </div>
            </div>
        </div>
    </div>
	
	<%@ include file="/views/common/footerbar.jsp" %>	

</body>
</html>