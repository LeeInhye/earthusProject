<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
                
                <% Member m = (Member)request.getAttribute("m"); %>
                <h4><b><%= m.getUserName() %></b>님의 아이디는 <br></h4>
                <h4><b><%= m.getUserId() %></b> 입니다.</h4>
                <br>
                <hr class="my-hr2">                
                
                <br>
                <div class="btn_center">
                    <button type="button" class="btn btn-lg btn_light_green btn-block" id="goFindPwdBtn">비밀번호 찾기</button>
                    <button type="button" class="btn btn-lg btn-block btn_light_green" id="goLogin">로그인 하기</button>
                </div>
                
                <script>
                	$(document).ready(function(){
                		// 비밀번호 찾기 페이지로 이동
                		$("#goFindPwdBtn").click(function(){
                			location.href = "<%= contextPath %>/goFindPwd.me";
                		});
                		
                		// 로그인 페이지로 이동
                		$("#goLogin").click(function(){
                			location.href = "<%= contextPath %>/goLogin.me";
                		});
                		
                	})
                </script>
                
            </div>
        </div>
    </div>
	
	<%@ include file="/views/common/footerbar.jsp" %>	

</body>
</html>