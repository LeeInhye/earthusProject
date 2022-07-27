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
            
            <h3><b>회원 로그인</b></h3>
            <br><br><br>
            
            <form action="<%= contextPath %>/login.me" method="post">
            
	            <input type="text" placeholder="아이디" id="userId" name="userId">
	            <br>
	            <input type="password" placeholder="비밀번호" id="userPwd" name="userPwd">
	            <br>
	            <div class="ver_middle">
	                <span id="saveId">
	                    <input type="checkbox" id="saveId"> &nbsp; 아이디 저장
	                </span>
	                
	                <script>
	                	$(document).ready(function(){
	                		
	                		// 저장된 쿠키값이 있으면 가져와서 id value로 넣어준다. 없을 시 공백
	                		var key = getCookie("key");
	                		$("#userId").val(key);
	                		
	                		// 이 전 id를 저장하여 페이지 로딩시 id input 칸에 저장된 id가 있다면
	                		// 아이디 저장을 체크한 상태로 둔다.
	                		if( $("#userId").val() != "" ){
	                			$("#saveId").attr("checked", true);
	                		}
	                		
	                		// 체크박스에 변화가 있을 때
	                		$("#saveId").change(function(){
	                			if( $("#saveId").is(":checked") ){	// 아이디 저장이 체크되어 있으면
	                				setCookie( "key", $("#userId").val(), 14 );	// 2주 동안 쿠키 보관
	                			} else{		// 체크 해제시
	                				deleteCookie("key");
	                			}
	                		});
	                		
	                		// 체크한 상태에서 id 입력시 쿠키 저장
	                		$("#userId").keyup(function(){		// 새로 아이디 입력하는 경우
	                			if( $("#saveId").is(":checked") ){	// 체크되어 있으면
	                				setCooke("key", $("#userId").val(), 14 );	// 새로 쿠키 보관
	                			}
	                		});
	                	});
	                	
	                	// 쿠키 저장
	                	function setCookie(cookieName, value, exdays){
	                		var exdate = new Date();
	                		exdate.setDate(exdate.getDate() + exdays);
	                		// escape() : 문자열을 네트워크를 통해 누구나 ASCII 글자로 접속할 수 있도록 인코딩한다.
	                		var cookieVal = escape(value) + 
	                						((exdays == null) ? "" : "; expires=" + exdate.toUTCString());
	                		document.cookie = cookieName + "=" + cookieVal;
	                	}
	                	
	                	// 쿠키 삭제
	                	function deleteCookie(cookieName){
	                		var expireDate = new Date()
	                		expireDate.setDate(expireDate.getDate() - 1);
	                		document.cookie = cookieName + "= ; expire=" + expireDate.toUTCString();
	                	}
	                	
	                	// 쿠키 가져오기
	                	function getCookie(cookieName){
	                		cookieName = cookieName + "=";
	                		var cookieData = document.cookie;
	                		var start = cookieData.indexOf(cookieName);
	                		var cookieVal = "";
	                		
	                		if(start != -1){	// 쿠키가 존재하면
	                			start += cookie.length;
	                			var end = cookieData.indexOf(";", start);
	                			if(end == -1){	// 쿠키 value의 마지막 위치 인덱스 번호 설정
	                				end = cookieData.length;	
	                			}
	                			cookieVal = cookieData.substring(start, end);
	                		}
	                		
	                		return unescape(cookieVal);
	                	}
	                	
	                </script>
	                
	                
	                
	                <span id="findIdPwd">
	                    <a href="">아이디 찾기</a> &ensp;
	                    <a href="">비밀번호 찾기</a>
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
						// 로그인 버튼
						$("#loginBtn").click(function(){
							if(loginUser == null){	// 해당 회원이 조회되지 않으면 모달창 출력
								// 버튼 타입 변경
								$("#loginBtn").attr("data-toggle", "modal");
			                	$("#loginBtn").attr("data-target", "#login_fail");
							} else{	// 로그인 성공시
								$("#loginBtn").removeAttr("data-toggle");
								$("#loginBtn").removeAttr("data-target");	
							}
						});
	            		
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