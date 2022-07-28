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
            
            <h2 class="h_font_weight">아이디 찾기</h2>
            <br><br><br>

			<form action="<%= contextPath %>/findIdSuccess.me" method="post">
	            <table class="table">
	                <tr>
	                    <input type="text" placeholder="이름" id="findName" name="findName">
	                </tr>
	                <tr>
	                    <input type="email" placeholder="이메일" id="findEmail" name="findEmail">
	                </tr>
	                <tr>
	                	<br>
	                	<div id="outputFindId"></div>
	                	<input type="hidden" name="findId">
	                </tr>
	                <tr class="tb_blank">
	                    <button type="button" class="btn btn_green btn-block btn-lg" id="findIdBtn">아이디 찾기</button>
	                </tr>
	                
	
	                <!-- 아이디 찾기 ajax -->
	                <script>
	                    $(document).ready(function(){
	                        $("#findIdBtn").click(function(){
	                        	$.ajax({
	                        		url:"<%= contextPath %>/findId.me",
	                        		data:{
	                        			inputName:$("#findName").val(),
	                        			inputEmail:$("#findEmail").val()
	                        		},
	                        		success:function(result){
	                        			// 아이디를 못찾았을 경우
	                        			if(result == "FIDNN"){
	                        				$("#outputFindId").html("<p style='color:red; padding-bottom:10px;' align='left'>회원정보를 찾을 수 없습니다.</p>");
	                        			} else{	// 아이디를 찾았을 경우
	                        				$("input[name=findId]").val(result);
	                        				$("#outputFindId").empty();
	                        				$("#findIdBtn").attr("type", "submit");
	                        				$("#findIdBtn").click();
	                        			}
	                        		}, error:function(){
	                        			console.log("ajax 통신 실패");
	                        		}
	                        	});
	                        });
	                    });
	                </script>
	                
	                <tr>&nbsp;  <br><br><br><br></tr>
	                <tr>
	                    <button type="button" id="goFindPwdBtn" class="btn btn_light_green btn-block btn-lg">비밀번호 찾기</button>
	                </tr>
	                <tr>
	                    <button type="button" id="goLoginBtn" class="btn btn_light_green btn-block btn-lg">로그인 하기</button>
	                </tr>
	            </table>
			</form>

            <br><br><br><br><br><br><br><br><br>>

        </div>
    </div>
	
	
	<%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>