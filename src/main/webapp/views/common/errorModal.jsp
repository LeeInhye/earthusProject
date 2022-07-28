<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

	<%@ include file="/views/common/menubar.jsp"%>
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

	<!-- session에서 정한 모달창과 모달 메세지가 출력된다. -->	
	<script>
		$(document).ready(function(){
			$("#<%= modalId %>").modal("show");
		});
	</script>
	            <div class="modal fade" id="<%= modalId %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			        <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
			            <!--Content-->
			            <div class="modal-content modal_alert">
			
			                <!--Body-->
			                <div class="modal-body text-center modal_alert_child">
			                    <div>
			                        <h4 class="mt-1 mb-2"><%= modalMsg %></h4>
			
			                        <br>
			                        <div class="text-center mt-4"> 
			                        	<!--  확인버튼 클릭시 이전 페이지로 이동 -->
			                            <button class="btn btn_green btn_medium" id="modalBtn" onclick="history.back();">확인</button>
			                        </div>
			                        
			                        
			                        
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>


	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	
	<%@ include file="/views/common/footerbar.jsp"%>

</body>
</html>