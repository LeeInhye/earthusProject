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
            <h2 class="menu_sub_title menu_sub_margin">회원 탈퇴</h2> <br>
            <h5 class="font_bold_gray menu_sub_margin">
                회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.
            </h5>
            <h5 class="font_bold_gray menu_sub_margin">
                탈퇴한 아이디와 관련된 정보는 <b style="color: red; ">복구와 재사용이 불가능</b>합니다.  <br>
                회원정보 및 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.

            </h6>
            <div class="sub_sub_menu">
                <button type="button" class="btn btn_light_green go_mypage" onclick="location.href='<%= contextPath %>/myPage.mp';"> > &nbsp;&nbsp;마이페이지</button>    
            </div>
        </div>
        <br>
        <hr class="my-hr3"> <br>

        <br><br><br><br>

        
        <form action="<%= contextPath %>/delete.me" method="post" id="deleteMemForm">
            <div class="login_section">
                <h2 class="h_font_weight">본인 확인</h2>
                <hr class="my-hr2" style="width: 120%; margin-left: -10%;">
                <br><br>

                <table id="checkPwd">
                    <tr>
                        <th>비밀번호</th>
                        <td>
                            <input type="password" placeholder="현재 사용중인 비밀번호를 입력해주세요." id="curPwd" name="curPwd">
                            <input type="hidden" id="loginPwd" value="<%= loginUser.getUserPwd() %>">
                        </td>
                    </tr>
                    <tr>
                        <th>비밀번호 확인</th>
                        <td>
                            <input type="password" placeholder="다시 한번 입력해주세요." id="againPwd" name="againPwd">
                        </td>
                    </tr>
                    <tr>
                        <th></th>
                        <td>
                            <div id="outputPwd"></div>
                        </td>
                    </tr>

                </table>

                <br><br><br>

                <div>
                    <input type="checkbox" id="agree"> &nbsp; <b style="font-weight: 550;">안내 사항을 모두 확인하였으며, 이에 동의합니다.</b>
                </div>

                <br><br><br>

                <div class="btn_center">
                    <button type="button" id="deleteBtn" class="btn btn_green" style="width: 300px; height: 40px;">회원탈퇴</button>
                </div>
            </div>

            <script>
                $(document).ready(function(){
                	
                    $("#deleteBtn").click(function(){
                    	
                    	// 비밀번호 일치, 로그인한 회원의 비밀번호와 일치해야 한다
                        if( $("#curPwd").val() == $("#againPwd").val() ){
                        	$("#outputPwd").empty();
                            if( ($("#loginPwd").val() == $("#curPwd").val()) && $("#agree").is(":checked") ){
                            	// 정말 탈퇴할 지 묻는 모달창이 뜬다.
                            	$("#deleteBtn").removeAttr("data-toggle");
                            	$("#deleteBtn").removeAttr("data-target");
                            	$("#deleteBtn").attr("data-toggle", "modal");
                                $("#deleteBtn").attr("data-target", "#withdraw_check_point");
                            }
                            
                        } else{
                            $("#outputPwd").html("<span class='tb_enroll_star'>비밀번호가 다릅니다. 다시 확인해 주세요.</span>");
                        }
                    	
	                    // 체크박스 체크해야 페이지 넘어간다.
                        if( $("#agree").is(":checked") ){
                            
                        } else{
                            $("#deleteBtn").attr("data-toggle", "modal");
                            $("#deleteBtn").attr("data-target", "#disagree_withdraw");
                        }
                    });

                })
            </script>

			<!-- 안내사항 동의 모달창 -->
            <div class="modal fade" id="disagree_withdraw" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
                    <!--Content-->
                    <div class="modal-content modal_alert">

                        <!--Body-->
                        <div class="modal-body text-center modal_alert_child">
                            <div>

                                <h4 class="mt-1 mb-2">안내사항에 동의해주셔야</h4>
                                <h4 class="mt-1 mb-2">탈퇴가 가능합니다.</h4>
                                <div class="text-center mt-4"> 
                                    <button class="btn btn_green btn_medium" data-dismiss="modal">확인</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- 정말 탈퇴할 지 묻는 모달창 -->
            <div class="modal fade" id="withdraw_check_point" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		        <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
		            <!--Content-->
		            <div class="modal-content modal_alert">
		
		                <!--Body-->
		                <div class="modal-body text-center modal_alert_child">
		                    <div>
		
		                        <h4 class="mt-1 mb-2">현재 보유중인 포인트 : <%= loginUser.getPoint() %>원</h4>
		                        <h4 class="mt-1 mb-2">탈퇴시 보유중인 혜택이 모두 사라집니다.</h4>
		                        <h4 class="mt-1 mb-2">정말 탈퇴하시겠습니까?</h4>
		                        
		                        <div class="text-center mt-4"> 
		                            <button class="btn btn_gray btn_medium" data-dismiss="modal">취소</button>
		                            <button class="btn btn_green btn_medium" onclick="next();">확인</button>
		                        </div>
		                        
		                        <script>
		                        	function next(){
		                        		$("#deleteMemForm").submit();
		                        	}
		                        </script>
		                        
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
            

        </form>
        
        <br><br><br><br><br><br><br><br><br>
   
   </div>
   <%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>