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
	              <!--   <span id="saveId">
	                    <input type="checkbox" id="saveId"> &nbsp; 아이디 저장
	                </span>
	                 -->
	               	
	                	<!-- <script>
	                		// 쿠키 생성
	                		function setCookie(cookieName, exdays){
	                			var exdate = new Date();
	                			exdate.setDate(exdate.getDate() + exdays);
	                			var cookieValue = escape(value) + ((exdays==null)?"":"; expires=" + exdate.toGMTString());
	                			document.cookie = cookieName + "=" + cookieValue;
	                		}
	                		
	                		// 쿠키 삭제
	                		function deleteCookie(cookieName){
	                			var expireDate = new Date();
	                			expireDate.setDate(expireDate.getDate() - 1);
	                			document.cookie = cookieName + "=" + "; expires=" + expireDate.toGMTString();
	                		}
	                		
	                		// 쿠키 얻기
	                		function getCookie(cookieName){
	                			cookieName = cookieName + "=";
	                			var cookieData = document.cookie;
	                			var start = cookieData.indexOf(cookieName);
	                			var cookieValue = "";
	                			
	                			if(start != -1){
	                				start += cookieName.length;
	                				var end = cookieDate.indexOf(";", start);
	                				if(end == -1){
	                					end = cookieDate.length;
	                				}
	                				cookieValue = cookieData.substring(start, end);
	                			}
	                			return unescape(cookieValue);
	                		}
	                		
	                		
	                		jQuery(function(){
	                			var cookieId = getCookie("userId");
	                			if(cookieId){
	                				jQuery("#saveId").attr("checked", true);
	                				jQuery("#userId").val(cookieId);
	                			}
	                			
	                			// 저장
	                			var saveId = jQuery("#saveId");
	                			if(saveId[0].checked){
	                				setCookie("cookieId", cookieId.val(), 7);
	                			} else{
	                				deleteCookie("cookieId");
	                			}
	                		});
	                	
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