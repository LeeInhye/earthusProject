<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member m = (Member)request.getAttribute("m");
	int mNo = (int)request.getAttribute("mNo");
%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

   <%@include file = "/views/common/adminMenubar.jsp" %>
   
   <div id="layoutSidenav">
       <div id="layoutSidenav_content">
       		<main>
		        <div class="container-fluid px-4 btnHover">
		        <br>
                    <h3 class="mt-4" style="font-weight:bold">회원정보수정</h3>
                    <hr>
   
				   <% if(m == null) { %>
				   		location.href = "<%= contextPath %>/goLogin.me";
				   	<% } else { %>
		   
		   		<form action="<%= contextPath %>/adUpdate.me" method="post">
				   <div class="container update_form">
				
				        <br>
							
				        <table class="table tb_update_member tb_enroll_centered">
				            <tr class="first_tr">
				                <th style="background:white; font-size: 23px;">기본정보</th>
				                <td style="text-align: right; border-top: 0; vertical-align: bottom;">
				                    <span class="tb_enroll_star">* &nbsp;</span>
				                     표시는 반드시 입력하셔야 하는 항목입니다.
				                </td>
				            </tr>
				            
				            <input type="hidden" name="mNo" value="<%= mNo %>">
								
				            <!-- 여기엔 value로 원래 회원정보 값들을 입력해두자 -->
				            <tr>
				                <th>
				                        <span class=tb_enroll_star>*</span> &nbsp; 아이디
				                </th>
				                <td>
				                    <!-- 아이디 변경 불가 -->
				                    <input type="text" name="userId" value="<%= m.getUserId() %>" readonly>
				                </td>
				            </tr>
				            
		
				            <tr>
				                <th>
				                    <span class=tb_enroll_star>*</span> &nbsp;     비밀번호</span>
				                </th>
				                <td >
				                	<div>
				                    <input type="password" placeholder="새로운 비밀번호를 입력해주세요." name="inputPwd" id="inputPwd" >
				                    <p class="font_lighter_gray" style="margin: 0;">첫글자는 영문으로, 영문/숫자/특수문자 중 2가지 이상 조합</p>
									<div id="outputPwd"></div>
									</div>
								</td>
		
				            </tr>
				            <tr>
				                <th>
				                    <span class=tb_enroll_star>*</span> &nbsp;     비밀번호 확인</span>
				                </th>
				                <td>
				                    <input type="password" placeholder="다시 한번 입력해주세요." name="inputCheckPwd" id="inputCheckPwd">
									<div id="outputCheckPwd"></div>
				                </td>
				            </tr>
		
							<script>
								$(document).ready(function(){
									
									// 비밀번호 유효성검사
									$("#inputPwd").keyup(function(){
										regExpPwd = /^[a-zA-Z](?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?=[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{7,15}$/;
										
										if(!regExpPwd.test($("#inputPwd").val())){
											$("#outputPwd").html("<span class='tb_enroll_star'>부적합한 비밀번호입니다.</span>");
										} else{
											$("#outputPwd").html("<span class='font_green'>사용 가능한 비밀번호입니다.</span>");
										}
										
									});
									
									// 비밀번호 일치 확인
									$("#inputCheckPwd").focusout(function(){
										if($("#inputPwd").val() != $("#inputCheckPwd").val()){
											$("#outputCheckPwd").html("<span class='tb_enroll_star'>비밀번호가 일치하지 않습니다.</span>")
										} else{
											$("#outputCheckPwd").html("<span class='font_green'>비밀번호가 일치합니다.</span>");
										}
									});
		
		                   		});
		
							</script>
				            
				            <tr>
				                <th>
				                    <span class="tb_enroll_star">* &nbsp;</span>
				                    <span> 이름</span>
				                </th>
				                <td>
				                    <input type="text" name="userName" id="userName" value="<%= m.getUserName() %>" required>
									<div id="outputName"></div>
				                </td>
		
								<script>
									$(document).ready(function(){
										
										// 이름 유효성 검사
										$("#userName").keyup(function(){
											regExpName = /^[가-힣]{2,8}$/;
											if( !regExpName.test($("#userName").val()) ){
												$("#outputName").html("<span class='tb_enroll_star'>부적합한 이름입니다.</span>");
											} else{
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
				                    <input type="email" id="inputEmail" name="inputEmail" style="width:51%;" value="<%= m.getEmail() %>">
				                    &nbsp;
				                    <button type="button" id="emailCheckBtn" class="btn-sm btn_gray">중복 확인</button>
				                    
									<!-- 이메일 중복 확인 상태 -->
									<input type="hidden" name="checkEmail_status" value="">
									<div id="outputCheckEmail"></div>
									<!-- 유효한 이메일 상태 -->
									<input type="hidden" name="outputEmail_status" value="">
									<!-- 이메일 변경 상태 -->
									<input type="hidden" name="changeEmail_status" value="N">
		
				                </td>
		
								<script>
									$(document).ready(function(){
										
										// 이메일 유효성 검사
			                        	$("#inputEmail").keyup(function(){
			                        		regExpEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/ig;
			                        		
			                        		if(!regExpEmail.test($("#inputEmail").val())){	// 유효한 이메일이 아닐 때
				                        		$("#outputCheckEmail").html("<span class='tb_enroll_star'>부적합한 이메일입니다.</span>");
				                        		$("#outputCheckEmail").show();
				                        		$("input[name=outputEmail_status").val('');
				                        	} else{ // 유효한 이메일일 때
			                                    $("input[name=outputEmail_status").val('Y');
			                                }
			                        	});
										
										// 이메일 변경안했으면 중복확인 안해도 통과
										if( $("input[name=changeEmail_status]").val() == "N" ){
											$("iput[name=checkEmail_status]").val("Y");
										}
										
										$("#inputEmail").change(function(){		// 이메일을 변경했다면
											$("input[name=changeEmail_status]").val("Y");
											$("#outputCheckEmail").html("<span class='tb_enroll_star'>중복 확인 필수</span>");
											$("input[name=checkEmail_status]").val("");		// 중복확인 해야함
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
				                    <input type="text" placeholder="-없이 입력하세요" id="inputPhone" name="inputPhone" value="<%= m.getPhone() %>" required style="width:51%;">
			                        &nbsp;
			                        <button type="button" class="btn-sm btn_gray" id="phoneCheckBtn">중복 확인</button><br>
			                        <!-- 전화번호 중복 확인 상태 -->
			                        <input type="hidden" name="checkPhone_status" value="">
			                        <div id="outputCheckPhone"></div>
									<!-- 유효한 전화번호 상태 -->
			                        <input type="hidden" name="outputPhone_status" value="">
									<!-- 전화번호 변경 상태 -->
									<input type="hidden" name="changePhone_status" value="N">
				                </td>
				                
				                <script>
		                        $(document).ready(function(){
		                        	// 전화번호 유효성검사
		                        	$("#inputPhone").keyup(function(){
		                        		regExpPhone = /^\d{11}$/;
		                        		
		                        		if(!regExpPhone.test($("#inputPhone").val())){	// 유효한 전화번호가 아닐 때
			                        		$("#outputCheckPhone").html("<span class='tb_enroll_star'>부적합한 전화번호입니다.</span>");
			                        		$("#outputCheckPhone").show();
			                        		$("input[name=outputPhone_status").val('');
			                        	} else{ // 유효한 전화번호일 때
		                                    $("input[name=outputPhone_status").val('Y');
		                                }
		                        	});
		                        	
									// 전화번호 변경안했으면 중복확인 안해도 통과
									if( $("input[name=changePhone_status]").val() == "N" ){
										$("iput[name=checkPhone_status]").val("Y");
									}
		                        	
		                        	$("#inputPhone").change(function(){		// 전화번호를 변경했다면
										$("input[name=changePhone_status]").val("Y");
										$("#outputCheckPhone").html("<span class='tb_enroll_star'>중복 확인 필수</span>");
										$("input[name=checkPhone_status]").val("");		// 중복확인 해야함
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
				                    <input type="text" id="zonecode" name="zonecode" style="width:40%;" 
				                    value=<% if(m.getZonecode() == null) { %>
				                    				"" placeholder="우편번호"
				                    		<% } else { %>
				                    			"<%= m.getZonecode() %>"
				                    		<% } %>
				                    > 
		                        &nbsp;
		                        <button type="button" class="btn-sm btn_gray" id="addrBtn">우편번호 찾기</button>
		                        <br>
		                        <input type="text" class="addr" id="address" name="address" 
		                        value=<% if(m.getAddress() == null) { %>
				                    				"" placeholder="도로명/지번 주소"
				                    		<% } else { %>
				                    			"<%= m.getAddress() %>"
				                    		<% } %>
				                    > 
		                        <br>
		                        <input type="text" class="addr" id="addr_extra" name="addr_extra" 
		                        value=<% if(m.getAddrExtra() == null) { %>
				                    				"" placeholder="참고 항목"
				                    		<% } else { %>
				                    			"<%= m.getAddrExtra() %>"
				                    		<% } %>
				                    > 
		                        <br>
		                        <input type="text" class="addr" id="addr_detail" name="addr_detail" 
		                        value=<% if(m.getAddrDetail() == null) { %>
				                    				"" placeholder="상세 주소"
				                    		<% } else { %>
				                    			"<%= m.getAddrDetail() %>"
				                    		<% } %>
				                    > 
				
				                </td>
				                
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
				                
				            </tr>
				
				        </table>
				
				
				
				        <br><br><br>
				        <div class="btn_center">
				            <button type="button" class="btn btn_black" style="width: 30%;" id="updateBtn">회원정보 수정</button>
				        </div>
				
				    </div>
				</form>
				
				
				<script>
		            $(document).ready(function(){
		            	
		            	$("#updateBtn").click(function(){
		            		
		                    let str = "<span class='tb_enroll_star'>필수 입력 사항입니다.</span>";
		                    
			               	// 필수사항 미입력
		                    // 아이디는 readonly 되어있음
		                    
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
		                    if( $("#userName").val().length == 0 ){
		                        $("#userName").attr("style", "border:2px solid red;");
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
		                    
		                    console.log($("input[name=changeEmail_status]").val());
		                    console.log($("input[name=checkEmail_status").val());
		                    console.log($("input[name=changePhone_status]").val());
		                    console.log($("input[name=checkPhone_status").val());
		                    
		                    // 이메일, 전화번호를 변경하지 않았으면 바로 submit가능
		                    if( ($("input[name=changeEmail_status").val() == "N") && ($("input[name=changePhone_status]").val() == "N") && ( $("#inputPwd").val() != "") ){
		                    	$("#updateBtn").prop("type", "submit");
		                    }
		                    
		                    // 중복확인을 모두 마쳐야 button submit 가능
		                    if( ($("input[name=checkEmail_status").val() == 'Y') && ($("input[name=checkPhone_status").val() == 'Y') && ( $("#inputPwd").val() != "") ){
		                    	$("#updateBtn").prop("type", "submit");
		                    }
		                    
		                });
		                    
		                    
		            })
		        </script>
				
			   
			<% } %>
       			</div>
       		</main>
       </div>
   </div>
   
   

</body>
</html>