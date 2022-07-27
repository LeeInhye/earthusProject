<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

	<%@ include file="/views/common/menubar.jsp" %>

	<br><br><br>

	<div class="container">
        <br><br><br><br><br><br>
        <div>
            <h2 class="menu_sub_title">회원가입</h2>
            <div class="sub_sub_menu">
                <span class="cur_sub_menu">01 약관동의</span>
                <span class="cur_sub_menu cur_sub_menu_arrow"> > </span>
                <span class="cur_sub_menu no_cur_sub_menu"> 02 정보입력 > 03 가입완료</span>
            </div>
        </div>
        <br>
        <hr class="my-hr2"> <br>
        
        <!-- 이 체크박스 선택시 아래 두개의 체크박스가 자동 체크되도록 구현 -->
        <input type="checkbox" name="selectAll"> 이용약관, 개인정보수집 및 이용에 모두 동의합니다.
        <br><br>
        <input type="checkbox" name="agreeRule" value="agreeRule1"> 이용약관 동의 <span style="color:red;">(필수)</span>
        <br><br>
        <div class="cs_rule cs_rule_box" style="overflow:auto;">
            <br>
            <div class="cs_rule" style="height:100%">
            	<p>
제1조(목적)
	
표준약관 제10023호
	
이 약관은 구디 아카데미가 운영하는 Earth.Us 사이버 몰(이하 "몰"이라 한다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 
사이버몰과 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.
	
※ 「PC통신등을 이용하는 전자거래에 대해서도 그 성질에 반하지 않는한 이 약관을 준용합니다」
	             </p>
            </div>
        </div>

        <br><br>
        <input type="checkbox" name="agreeRule" value="agreeRule2"> 개인정보 수집 및 이용 동의 <span style="color:red;">(필수)</span>
        <br><br>
        <div class="cs_rule cs_rule_box" style="overflow:auto;">
            <br>
            <div class="cs_rule" style="height:100%">
                <p>
[ 개인정보처리방침 ]

Earth.Us는 이용자의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 다음과 같이 개인정보 처리방침을 수립·공개하며, 
본 개인정보 처리방침을 홈페이지 첫 화면에 공개함으로써 이용자들이 언제나 용이하게 보실 수 있도록 조치하고 있습니다. 
개인정보 처리방침은 정부의 법률 및 지침 변경이나 회사의 내부 방침 변경 등으로 인하여 수시로 변경될 수 있고, 
이에 따른 개인정보 처리방침의 지속적인 개선을 위하여 필요한 절차를 정하고 있습니다. 
이용자들께서는 사이트 방문 시 수시로 확인하시기 바랍니다.

Earth.Us의 개인정보 처리방침은 다음과 같은 내용을 담고 있습니다.
                </p>
            </div>
        </div>
        
        
        <script>
        
        	$(document).ready(function(){
        		$("input[name='selectAll']").click(function(){
	        		// 전체 선택 체크박스 체크시 두개의 체크박스가 체크되고
	        		if( $("input[name='selectAll']").is(":checked") ){
	        			$("input[name='agreeRule']").prop("checked", true);
	        		} else{	// 전체 선택 체크박스 해제시 두개의 체크박스 체크가 해제된다.
	        			$("input[name='agreeRule']").prop("checked", false);
	        		}
        		});
        		
        		$("input[name='agreeRule']").click(function(){
        			var count = $("input[name='agreeRule']").length;
        			var checked = $("input[name='agreeRule']:checked").length;
        			
        			// 체크한 체크박스의 개수와 전체 체크박스 개수가 같으면 전체 선택 체크박스가 체크된다.
        			if(count != checked){
        				$("input[name='selectAll']").prop("checked", false);
        			} else{
        				$("input[name='selectAll']").prop("checked", true);
        			}
        			
        		});
        	});
        
        </script>
        

        <br><br><br>
        <div class="btn_center btn_two_center">
            <button class="btn btn_gray" onclick="history.back();">이전단계</button>
            <button id="btn_next" class="btn btn_green">다음단계</button>
        </div>
        
        <!-- 모달 -->
        <div class="modal fade" id="CS_rule_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
                    <!--Content-->
                    <div class="modal-content modal_alert">
                        
                        <!--Body-->
                        <div class="modal-body text-center modal_alert_child">
                            <div>

                                <h4 class="mt-1 mb-2">이용약관 및 개인정보 처리방침에</h4>
                                <h4 class="mt-1 mb-2">동의하셔야 가입이 가능합니다.</h4>
                                
                                <div class="text-center mt-4"> 
                                    <button class="btn btn_green btn_medium" data-dismiss="modal">확인</button>
                                </div>
                             </div>
                         </div>
                      </div>
                  </div>
             </div>
        
        <script>
        $(function(){
        	$("#btn_next").click(function(){
            	const checkboxes = document.getElementsByName("agreeRule");
        		
            	// 두개의 체크박스가 다 체크되어있으면
                if(checkboxes[0].checked == true && checkboxes[1].checked == true){
                	// 모달창 속성을 지우고 다음 페이지로 이동
                	$("#btn_next").removeAttr("data-toggle");
                	$("#btn_next").removeAttr("data-target");
                	location.href="<%= contextPath %>/enrollForm_2.me"
                } else{	// 둘 다 체크되어있지 않으면 모달창 출력
                	$("#btn_next").attr("data-toggle", "modal");
                	$("#btn_next").attr("data-target", "#CS_rule_modal");
                }
        	});
        })
           
        </script>
        
        
        
        <br><br><br><br>
    </div>

        <%@ include file="/views/common/footerbar.jsp" %>
	

</body>
</html>