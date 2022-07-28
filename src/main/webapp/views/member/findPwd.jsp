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
            
            <form action="<%= contextPath %>/verification.me" method="post" id="findPwdForm">
	            <h2 class="h_font_weight">비밀번호 찾기</h2>
	            <br>
	            <h3 class="find_pwd_h">아이디 입력</h3>
	            <h5 style="color:gray; padding:5px 0;">비밀번호를 찾고자 하는 아이디를 입력해주세요.</h5>
	            <hr class="my-hr2">
	
	            <table class="table">
	                <tr>
	                    <input type="text" placeholder="아이디" name="findId" id="findId">
	                </tr>
	                <tr>
	                    <input type="text" placeholder="이름" name="findName" id="findName">
	                </tr>
	                <tr>
	                    <div id="outputFindPwd"></div>
	                </tr>
	                <tr>
	                    <div id="molaId">
	                        아이디를 모르시나요? &nbsp;
	                        <a href="<%= contextPath %>/goFindId.me">아이디찾기</a>
	                    </div>
	                </tr>
	                <tr>&nbsp;  <br><br><br></tr>
	                <tr>
	                    <button type="button" class="btn btn_light_green btn-block btn-lg" id="verificationBtn">다음</button>
	                </tr>
	                
	                <script>
                        $(document).ready(function(){
                            $("#verificationBtn").click(function(){
                                $.ajax({
                                	url:"<%= contextPath %>/findPwd.me",
                                    data:{
                                        inputId:$("#findId").val(),
                                        inputName:$("#findName").val()
                                    },
                                    success:function(result){
                                    	if(result == "FPWDNN"){		// 해당 회원정보가 없을 경우
                                    		$("#outputFindPwd").html("<p style='color:red; padding-bottom:10px;' align='left'>회원정보를 찾을 수 없습니다.</p>");
                                    	} else{ 	// 해당 회원정보가 있을 경우
                                    		$("#outputFindPwd").empty();
                                    		$("#findPwdForm").submit();
                                    	}
						
                                    }, error:function(){
                                        console.log("비번찾기 ajax 통신 실패");
                                    }

                                    })
                                });

                            });

                    </script>
	                
	            </table>
			</form>

            <br><br><br><br><br><br><br><br><br>

        </div>
    </div>
	
	<%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>