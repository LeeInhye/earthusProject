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

	<%@ include file="/views/common/menubar.jsp"%>
	
	<div class="container" style="height:960px;">
         <br><br><br><br><br><br><br><br><br>
         
        <div>
            <h2 class="menu_sub_title">회원가입</h2>
            <div class="sub_sub_menu">
                <span class="cur_sub_menu no_cur_sub_menu"> 01 약관동의 > 02 정보입력</span>
                <span class="cur_sub_menu cur_sub_menu_arrow"> > </span>
                <span class="cur_sub_menu">03 가입완료</span>
            </div>
        </div>
        <br>
        <hr class="my-hr2"> <br>
        
        <div class="enroll_success">
            <div class="enroll_padding">
                <p style="color:rgb(119, 140, 121); font-size:100px; text-align:center;">✓</p>
                <h3>회원가입이 <b>완료</b>되었습니다.</h3>
                <br>
                <h5><b><%= m.getUserName() %></b>님의 회원가입을 축하합니다.</h5>
                <br>
                <hr class="my-hr2">                
                
                <br>
                <div class="btn_center">
                    <button class="btn btn_gray" id="goHomeBtn">홈으로</button>
                    &emsp;&emsp;
                    <button class="btn btn_green" id="goLoginBtn">로그인</button>
                </div>
                
                <script>
					$(document).ready(function(){
						// 홈으로 버튼
						$("#goHomeBtn").click(function(){
							location.href = "<%= contextPath %>";
						});
						
						// 로그인 페이지로 가는 버튼
						$("#goLoginBtn").click(function(){
							location.href = "<%= contextPath %>/goLogin.me"
						})
						
					});
				</script>
                
            </div>
        </div>
	</div>
	
	<%@ include file="/views/common/footerbar.jsp"%>
</body>
</html>