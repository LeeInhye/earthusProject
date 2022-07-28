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
            
            <h2 class="h_font_weight">회원 로그인</h2>
            <br><br><br>
            
            <form action="<%= contextPath %>/login.me" method="post">
            
	            <input type="text" placeholder="아이디" id="userId" name="userId">
	            <br>
	            <input type="password" placeholder="비밀번호" id="userPwd" name="userPwd">
	            <br>
	            <div class="ver_middle">
	            	<!-- 아이디 저장 보류 -->
	                <span id="saveId">
	                    <input type="checkbox" id="saveId"> &nbsp; 아이디 저장
	                </span>
	                
	               
	                    <!-- <script>
						        $(document).ready(function(){
								    var userId = getCookie("userId");//저장된 쿠기값 가져오기
								    $("#userId").val(userId); 
								     
								    if($("#userId").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
								                                           // 아이디 저장하기 체크되어있을 시,
								        $("#saveId").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
								    }
								     
								    $("#saveId").change(function(){ // 체크박스에 변화가 발생시
								        if($("#saveId").is(":checked")){ // ID 저장하기 체크했을 때,
								            var userId = $("#userId").val();
								            setCookie("userId", userId, 7); // 7일 동안 쿠키 보관
								        }else{ // ID 저장하기 체크 해제 시,
								            deleteCookie("userId");
								        }
								    });
								     
								    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
								    $("#userId").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
								        if($("#saveId").is(":checked")){ // ID 저장하기를 체크한 상태라면,
								            var userInputId = $("#userId").val();
								            setCookie("userId", userId, 7); // 7일 동안 쿠키 보관
								        }
								    });
								});
						 
								function setCookie(cookieName, value, exdays){
								    var exdate = new Date();
								    exdate.setDate(exdate.getDate() + exdays);
								    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
								    document.cookie = cookieName + "=" + cookieValue;
								}
								 
								function deleteCookie(cookieName){
								    var expireDate = new Date();
								    expireDate.setDate(expireDate.getDate() - 1);
								    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
								}
								 
								function getCookie(cookieName) {
								    cookieName = cookieName + '=';
								    var cookieData = document.cookie;
								    var start = cookieData.indexOf(cookieName);
								    var cookieValue = '';
								    if(start != -1){
								        start += cookieName.length;
								        var end = cookieData.indexOf(';', start);
								        if(end == -1)end = cookieData.length;
								        cookieValue = cookieData.substring(start, end);
								    }
								    return unescape(cookieValue);
								}
						     </script> -->
	                
	                
	                
	                
	                <span id="findIdPwd">
	                    <a href="<%= contextPath %>/goFindId.me">아이디 찾기</a> &ensp;
	                    <a href="<%= contextPath %>/goFindPwd.me">비밀번호 찾기</a>
	                </span>
	
	            </div>
	
	            <br><br><br><br><br>
	
	            <div class="btn_center">
	                <button class="btn btn_green btn-block btn-lg" id="loginBtn">로그인</button>
	                <br><br>
	                <button type="button" class="btn btn_light_green btn-block btn-lg" id='joinBtn'>회원가입</button> 
	            </div>
	            
	            
	            
	            <script>
	            	$(document).ready(function(){
	            		
	            		// 회원가입 페이지로 이동
	            		$("#joinBtn").click(function(){
	            			location.href = "<%= contextPath %>/enrollForm_1.me";
	            		});
	            		
	            	})
	            </script>
            
            </form>
        </div>

    </div>
	
	
	<br><br><br><br><br><br><br><br><br>
	
 	
	<%@ include file="/views/common/footerbar.jsp" %>
	

</body>
</html>