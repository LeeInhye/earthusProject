<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>

	<%@ include file="/views/common/menubar.jsp" %>
	
	<div class="container">
        <br><br><br><br><br><br><br><br><br>
        <div>
            <h2 class="menu_sub_title">회원가입</h2>
            <div class="sub_sub_menu">
                <span class="cur_sub_menu no_cur_sub_menu">01 약관동의 > </span>
                <span class="cur_sub_menu"> 02 정보입력 </span>
                <span class="cur_sub_menu cur_sub_menu_arrow">></span>
                <span class="cur_sub_menu no_cur_sub_menu"> 03 가입완료 </span>
            </div>
        </div>
        <br>
        <hr class="my-hr2"> <br>

        <br>

        <form action="<%= contextPath %>/insert.me" method="post">
            <table class="table tb_enroll_centered tb_enroll_member">
                <tr class="first_tr">
                    <th style="background:white; border-top:0; font-size: 18px;">기본정보</th>
                    <td style="text-align: right; border-top: 0">
                        <span class="tb_enroll_star">* &nbsp;</span>
                        표시는 반드시 입력하셔야 하는 항목입니다.
                    </td>
                </tr>

                <tr>
                    <th>
                        <span class=tb_enroll_star>*</span> &nbsp; 아이디
                    </th>
                    <td>
                        <input type="text" id="inputId" name="inputId" required>
                        &nbsp;
                        <button type="button" class="btn btn-sm btn_gray" id="idCheckBtn">중복 확인</button>
                        <input type="hidden" name="checkId_status" value="">
                        <br>
                      	<p class="sub_p">첫글자는 영문 소문자로, 영문 소문자/숫자를 포함해 4~12자로 입력하세요.</p>
                        <div id="outputCheckId"></div>
                        <input type="hidden" name="outputId_status" val="">
                        
                        <script>
	                        $(document).ready(function(){
		                        // 나증에 DB넣고 확인하기
		                        
		                        // 아이디 유효성 검사
		                        $("#inputId").on("focusout", function(event){
		                        	
	                        		regExpId = /^[a-z][a-z0-9]{3,11}$/g;
	                        		
		                        	if(!regExpId.test($("#inputId").val())){	// 유효한 아이디가 아닐 때
		                        		$("#outputCheckId").html("<span class='tb_enroll_star'>부적합한 아이디입니다.</span>");
		                        		$("#outputCheckId").show();
		                        		$("input[name=outputId_status").val('');
		                        	} else{ // 유효한 아이디일 때
	                                    // $("#outputCheckId").empty();
	                                    $("input[name=outputId_status").val('Y');
	                                }
	                            });
	                        
                                // 중복확인 버튼 클릭시 아이디 중복 체크
                                $("#idCheckBtn").click(function(){
                                    // 비동기식 방식으로 url 요청
                                    $.ajax({
                                        url:"<%= contextPath %>/checkId.me",
                                        data:{inputId:$("#inputId").val()},
                                        success:function(result){
                                        	$("#inputId").focus();
                                        	
                                            if(result == "IDNY"){
                                                $("input[name=checkId_status").val('Y');    // 중복확인 완료상태
                                                
                                             	// 두가지 검사가 끝나고 사용가능한 아이디이면
                                                if( ($("input[name=checkId_status").val() == 'Y') && ($("input[name=outputId_status").val() == 'Y') ){
                                                	$("#outputCheckId").html("<span class='font_green'>사용 가능한 아이디입니다.</span>");
                                                }
                                            } else{
                                            	$("input[name=checkId_status").val(''); 
                                                $("#outputCheckId").html("<span class='tb_enroll_star'>이미 존재하는 아이디입니다.</span>");
                                            }
                                        }, error:function(){
                                            console.log("ajax 통신 실패");
                                        }
                                    });
                                });
                                
                                
                                
                            })
	                               
                        </script>
                        
                    </td>
                </tr>
                <tr>
                    <th>
                        <span class="tb_enroll_star">* &nbsp;</span>
                        <span>비밀번호</span>
                    </th>
                    <td>
                        <input type="password" id="inputPwd" name="inputPwd" required>
                        <br>
                      	<p class="sub_p">첫글자는 영문으로, 영문/숫자/특수문자 중 2가지 이상 조합하여 8~16자로 입력하세요.</p>
                      	<div id="outputPwd"></div>
                    </td>
                </tr>
                <tr>
                    <th>
                        <span class="tb_enroll_star">* &nbsp;</span>
                        <span> 비밀번호 확인</span>
                    </th>
                    <td>
                        <input type="password" id="inputCheckPwd" name="inputCheckPwd" required>
                        <div id="outputCheckPwd"></div>
                    </td>
                </tr>
                
                <script>
                    $(document).ready(function(){
                        // 비번 유효성 검사
                        $("#inputPwd").focusout(function(){
                        	regExpPwd = /^[a-zA-Z](?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?=[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{7,15}$/;
                        	
                        	if(!regExpPwd.test($("#inputPwd").val())){
                        		$("#outputPwd").html("<span class='tb_enroll_star'>부적합한 비밀번호입니다.</span>");
                        	} else{
                        		$("#outputPwd").html("<span class='font_green'>사용 가능한 비밀번호입니다.</span>");
                        	}
                        	
                        });

                        // 비번 일치 검사
                        $("#inputCheckPwd").focusout(function(){
                        	if($("#inputPwd").val() != $("#inputCheckPwd").val()){
                        		$("#outputCheckPwd").html("<span class='tb_enroll_star'>비밀번호가 일치하지 않습니다.</span>")
                        	} else{
                        		$("#outputCheckPwd").html("<span class='font_green'>비밀번호가 일치합니다.</span>");
                        	}
                        })

                    });
                </script>
                
                
                <tr>
                    <th>
                        <span class="tb_enroll_star">* &nbsp;</span>
                        <span> 이름</span>
                    </th>
                    <td>
                        <input type="text" id="inputName" name="inputName" required>
                        <div id="outputName"></div>
                    </td>

                    <script>
                        $(document).ready(function(){
                            // 이름 value에 따른 html 변경
                            $("#inputName").focusout(function(){
                                
                                if( $("#inputName").val().length != 0 ){
                                    $("#outputName").empty();
                                }
                                
                            });
                        });
                    </script>

                </tr>
                <tr>
                    <th>
                        <span class="tb_enroll_star">* &nbsp;</span>
                        <span> 이메일</span>
                    </th>
                    <td>
                        <input type="email" id="inputEmail" name="inputEmail" required>
                        &nbsp;
                        <button type="button" class="btn btn-sm btn_gray" id="emailCheckBtn">중복 확인</button><br>
                        <input type="hidden" name="checkEmail_status" value="">
                        <div id="outputCheckEmail"></div>
                        <input type="hidden" name="outputEmail_status" value="">
                    </td>
                    
                    <script>
                        $(document).ready(function(){
                        	// 이메일 유효성 검사
                        	$("#inputEmail").focusout(function(){
                        		regExpEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/ig;
                        		
                        		if(!regExpEmail.test($("#inputEmail").val())){	// 유효한 이메일이 아닐 때
	                        		$("#outputCheckEmail").html("<span class='tb_enroll_star'>부적합한 이메일입니다.</span>");
	                        		$("#outputCheckEmail").show();
	                        		$("input[name=outputEmail_status").val('');
	                        	} else{ // 유효한 이메일일 때
                                    $("input[name=outputEmail_status").val('Y');
                                }
                        	});
                        	
                        	
                            // 이메일 중복 확인
                            $("#emailCheckBtn").click(function(){
                                    // 비동기식 방식으로 url 요청
                                    $.ajax({
                                        url:"<%= contextPath %>/checkEmail.me",
                                        data:{inputEmail:$("#inputEmail").val()},
                                        success:function(result){
                                        	$("#inputEmail").focus();
                                        	
                                            if(result == "EMNY"){	// 중복된 이메일이 없을 경우
                                                $("input[name=checkEmail_status").val('Y'); 
                                            
                                             // 두가지 검사가 끝나고 사용가능한 이메일이면
                                                if( ($("input[name=checkEmail_status").val() == 'Y') && ($("input[name=outputEmail_status").val() == 'Y') ){
                                                	$("#outputCheckEmail").html("<span class='font_green'>사용 가능한 이메일입니다.</span>");
                                                }
                                            } else{
                                            	$("input[name=checkEmail_status").val('');
                                                $("#outputCheckEmail").html("<span class='tb_enroll_star'>이미 존재하는 이메일입니다.</span>");
                                            }
                                        }, error:function(){
                                            console.log("ajax 통신 실패");
                                        }
                                    });
                            });

                        })
                    </script>
                </tr>
               
                <tr>
                    <th>
                        <span class="tb_enroll_star">* &nbsp;</span>
                        <span> 휴대폰번호</span>
                    </th>
                    <td>
                        <input type="text" placeholder="-없이 입력하세요" id="inputPhone" name="inputPhone" required>
                        &nbsp;
                        <button type="button" class="btn btn-sm btn_gray" id="phoneCheckBtn">중복 확인</button><br>
                        <input type="hidden" name="checkPhone_status" value="">
                        <div id="outputCheckPhone"></div>
                        <input type="hidden" name="outputPhone_status" value="">
                    </td>
                    
                    <script>
                        $(document).ready(function(){
                        	// 전화번호 유효성검사
                        	$("#inputPhone").focusout(function(){
                        		regExpPhone = /^\d{11}$/;
                        		
                        		if(!regExpPhone.test($("#inputPhone").val())){	// 유효한 전화번호가 아닐 때
	                        		$("#outputCheckPhone").html("<span class='tb_enroll_star'>부적합한 전화번호입니다.</span>");
	                        		$("#outputCheckPhone").show();
	                        		$("input[name=outputPhone_status").val('');
	                        	} else{ // 유효한 전화번호일 때
                                    $("input[name=outputPhone_status").val('Y');
                                }
                        	});
                        	 
                        	
                        	
                            // 전화번호 중복 확인
                            $("#phoneCheckBtn").click(function(){
                                    // 비동기식 방식으로 url 요청
                                    $.ajax({
                                        url:"<%= contextPath %>/checkPhone.me",
                                        data:{inputPhone:$("#inputPhone").val()},
                                        success:function(result){
                                        	$("#inputPhone").focus();
                                        	
                                            if(result == "PHNY"){	// 중복된 전화번호가 없을 경우
                                                $("input[name=checkPhone_status").val('Y'); 
                                            
                                             	// 두가지 검사가 끝나고 사용가능한 전화번호이면
                                                if( ($("input[name=checkPhone_status").val() == 'Y') && ($("input[name=outputPhone_status").val() == 'Y') ){
                                                	$("#outputCheckPhone").html("<span class='font_green'>사용 가능한 전화번호입니다.</span>");
                                                }
                                            } else{
                                            	$("input[name=checkPhone_status").val('');
                                                $("#outputCheckPhone").html("<span class='tb_enroll_star'>이미 존재하는 전화번호입니다.</span>");
                                            }
                                        }, error:function(){
                                            console.log("ajax 통신 실패");
                                        }
                                    });
                                });
                            
                            
                        })
                    </script>
                </tr>
                
                <tr>
                    <th>
                        <span>&emsp; 주소</span>
                    </th>
                    <td class="enroll_addr">
                        <input type="text" id="zonecode" name="zonecode" style="width:40%;" placeholder="우편번호"> 
                        &nbsp;
                        <button class="btn btn-sm btn_gray" id="addrBtn">우편번호 찾기</button>
                        <br>
                        <input type="text" id="address" name="address" placeholder="주소"><br>
                        <input type="text" id="addr_extra" name="addr_extra" placeholder="참고항목"><br>
                        <input type="text" id="addr_detail" name="addr_detail" placeholder="상세주소">
                    </td>
                </tr>
                
                <!-- 주소 찾기 API -->
                <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                <script>
                	$(document).ready(function(){
                		$("#addrBtn").click(function(){
						    new daum.Postcode({
						        oncomplete: function(data) {
						            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
						            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
						            
						            var addr = "";	// 주소 변수
						            var extraAddr = "";	// 참고항목 변수
						            
						            // 사용자가 주소 선택
						            if(data.userSelectedType === 'R'){	// 사용자가 도로명 주소 선택했을 경우
						            	addr = data.roadAddress;
						            } else{	// 사용자가 지번 주소 선택
						            	addr = data.jibunAddress;
						            }
						            
						            // 사용자가 선택한 주소가 도로명 타입일 때 참고항목 조함
									if(data.userSelectedType === 'R'){
										// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname) ){
					                    	extraAddr += data.bname;
					                    }
										
										// 건물명이 있고, 공동주택일 경우 추가
										if(data.buildingName !== '' && data.apartment === 'Y' ){
											extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
										}
										
										// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
										if(extraAddr !== ''){
											extraAddr = '(' + extraAddr + ')';
										}
										
										// 조합된 참고항목을 해당 필드에 넣는다.
										document.getElementById("addr_extra").value = extraAddr;
										
									} else{
										document.getElementById("addr_extra").value = '';
									}
						            
						            // 우편번호와 주소 정보를 해당 필드에 넣는다.
						            document.getElementById("zonecode").value = data.zonecode;
						            document.getElementById("address").value = addr;
						            
						            // 커서를 상세주소 필드로 이동
						            document.getElementById("addr_detail").focus();
						        }
						    }).open();
                			
                		});
                	})
				</script>
                
            </table>
        


            <br><br><br><br>


            <table class="table tb_enroll_centered tb_enroll_member">
                <tr class="first_tr">
                    <th style="background:white; border-top:0; font-size: 18px;">부가정보</th>
                    
                </tr>

                <tr>
                    <th>
                        <span>&emsp; 생년월일</span>
                    </th>
                    <td>
                        <input type="date" name="birthday">
                    </td>
                </tr>
                <tr>
                    <th>
                        <span>&emsp; 성별</span>
                    </th>
                    <td>
                        <input type="radio" name="gender" value="N"> 선택안함 &emsp;
                        <input type="radio" name="gender" value="M"> 남자   &emsp;
                        <input type="radio" name="gender" value="F"> 여자
                    </td>
                </tr>
                
            </table>

	        <br><br><br>
	        <div class="btn_two_center btn_center">
	            <button class="btn btn_gray" onclick="history.back();">이전단계</button>
	            <button type="button" class="btn btn_green" id="nextBtn">다음단계</button>
	        </div>
        
        </form>
        
        <script>
            $(document).ready(function(){
            	
            	$("#nextBtn").click(function(){
            		
                    let str = "<span class='tb_enroll_star'>필수 입력 사항입니다.</span>";
                    
	               	// 필수사항 미입력
                    // 아이디 미입력시
                    if( $("#inputId").val().length == 0 ){
                        $("#inputId").attr("style", "border:2px solid red;");
                        $("#outputCheckId").html(str);
                    }
                    
                    // 비밀번호 미입력시
                    if( $("#inputPwd").val().length == 0 ){
                        $("#inputPwd").attr("style", "border:2px solid red;");
                        $("#outputPwd").html(str);
                    }
                    
                    // 비밀번호 확인 미입력시
                    if( $("#inputCheckPwd").val().length == 0 ){
                        $("#inputCheckPwd").attr("style", "border:2px solid red;");
                        $("#outputCheckPwd").html(str);
                    }
                    
                    // 이름 미입력시
                    if( $("#inputName").val().length == 0 ){
                        $("#inputName").attr("style", "border:2px solid red;");
                        $("#outputName").html(str);
                    }
                    
                    // 이메일 미입력시
                    if( $("#inputEmail").val().length == 0 ){
                        $("#inputEmail").attr("style", "border:2px solid red;");
                        $("#outputCheckEmail").html(str);
                    }
                    
                    // 전화번호 미입력시
                    if( $("#inputPhone").val().length == 0 ){
                        $("#inputPhone").attr("style", "border:2px solid red;");
                        $("#outputCheckPhone").html(str);
                    }
                    
                    console.log($("input[name=checkId_status").val());
                    console.log($("input[name=checkEmail_status").val());
                    console.log($("input[name=checkPhone_status").val());
                    
                    // 중복확인을 모두 마쳐야 button submit 가능
                    if( ($("input[name=checkId_status").val() == 'Y') && ($("input[name=checkEmail_status").val() == 'Y') && ($("input[name=checkPhone_status").val() == 'Y') ){
                    	$("#nextBtn").prop("type", "submit");
                    }
                    
                });
                    
                    
            })
        </script>
        

        <br><br><br>
        
        
	</div>
	
	<%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>