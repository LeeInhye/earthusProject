<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.us.product.model.vo.Cart, java.util.ArrayList, java.text.SimpleDateFormat, java.util.Date"%>
<%
	ArrayList<Cart> list = (ArrayList<Cart>)request.getAttribute("list");
	String orderProCode = (String)request.getAttribute("orderProCode");

%>

<!DOCTYPE html>
<html lang="zxx">

<head>


	
	
	<!-- ********** 내가 만든 스타일!!! 지우면 안돼!!! ********** -->
	<style>
	#product-info {
		width: 100%;
		border: 1px solid gainsboro;
		border-collapse: separate;
		border-radius: 15px;
	}
	.btn {
		border-radius: 30px;
		font-weight: bold;
		background-color: #A8BFAA;
		color: #F2F2F2;
	}
	.order_box {
		background-color: #F2F2F2;
		border-radius: 15px;
	}
	.shipping-memo, .shipping-memo * {
		width: 100%;
	}
	.custom-select{
		border: 1px solid #eeeeee;
		color:#6c757d;
		font-size:14px;
		height:40px;
	}
	</style>
<!-- ********** 내가 만든 스타일!!! 지우면 안돼!!! ********** -->

</head>

<body>

	<%@ include file="../common/menubar.jsp"%>

	<!--================Home Banner Area =================-->
	<!-- breadcrumb start-->
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item">
							<h2>주문하기</h2>
							<p>주문해 주셔서 감사합니다.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb end -->


	<!--================Checkout Area =================-->
	<section class="checkout_area padding_top">
		<div class="container">
			<form class="billing_details" id="order-form" action="<%= contextPath %>/payList.or" method="post">
				<div class="row">
					<div class="col-lg-8">
						<h3 style="padding: 0px; margin-bottom: 15px; font-weight: bold;">주문자 정보</h3>
						<div class="same-as-user">
							<input type="checkbox" id="same-as-user"> <span>주문자 정보와 동일</span>
						</div>

						<div class="col-md-12 form-group p_star">
							<input type="text" class="form-control" name="name" placeholder="이름 입력 *" required>
						</div>
						<div class="col-md-12 form-group p_star">
							<input type="tel" class="form-control" id="last" name="phone" placeholder="휴대폰 번호 입력 *" required>
							<!-- 정규표현식으로 올바른 휴대폰 번호 형식 지정 (010으로 시작, 11자리 숫자만) -->
						</div>
						<div class="col-md-12 form-group">
							<input type="text" class="form-control" id="company" name="email" placeholder="이메일 입력">
							<!-- 정규표현식으로 올바른 이메일 형식 지정 -->
						</div>
						<br>
						<h3 style="padding: 0px; margin-bottom: 15px; font-weight: bold;">배송 정보</h3>
						<div class="col-md-6 form-group ">
							<button type="button" class="form-control" style="border-radius: 5px;" onclick="execDaumPostCode();">우편번호 찾기</button>
						</div>
						<div class="col-md-6 form-group p_star">
							<input type="text" class="form-control" id="postCode" name="postCode" placeholder="우편번호 *" required>
						</div>
						<div class="col-md-12 form-group ">
							<input type="text" class="form-control" id="roadAddr" name="roadAddr" placeholder="도로명 주소 *" required>
						</div>
						<div class="col-md-12 form-group p_star">
							<input type="text" class="form-control" id="detailAddr" name="detailAddr" placeholder="상세 주소 *" required>
						</div>
						<div class="col-md-12 form-group">
							<select class="custom-select shipping-memo" name="shippingMemo">
								<option selected value="0">배송 메모를 선택해주세요.</option>
								<option value="1">경비실에 맡겨주세요.</option>
								<option value="2">현관문 앞에 놓아주세요.</option>
								<option value="3">배송 전에 미리 연락 바랍니다.</option>
							</select>
						
							<br><br><br>
							<h3 style="padding: 0px; margin-bottom: 15px; font-weight: bold;">포인트 적용</h3>
							<div class="col-md-12 form-group p_star">
								<input type="number" class="form-control" name="point" value="0" placeholder="사용할 포인트를 입력해주세요.">
							</div>
						</div>
					</div>

					<div class="col-lg-4">
						<div class="order_box" style="background-color:#F2F2F2">
							<h2 style="font-weight: bold;">주문서</h2>
								<ul class="list">
								<% int sum = 0; %>
									<% for(Cart c : list) { %>
										<% sum += c.getPrice() * c.getProQty(); %>
										<!-- 결제상품 목록 조회 -->
										<li>
										<a href="#"><%= c.getProName() %> <span class="last" class="price"><%= c.getPrice() * c.getProQty() %></span></a>
										<a id="proQty" style="display:none;"><%= c.getProQty() %></a>
										</li>
									<% } %>
								</ul>
								<ul class="list list_2">
									<li><a>배송비 <span>3000</span></a></li>
									<li><a>포인트사용 <span id="usedPoint">0</span></a></li>
									<li><a>총 결제 가격 <span id="totalPrice"><%= sum + 3000 %></span></a></li>
								</ul>
							
							<div class="payment_item">
								<div class="radion_btn">
									<input type="radio" id="f-option5" name="payment" value="CASH"> <label for="f-option5">무통장 입금</label>
									<div class="check"></div>
								</div>
							</div>
							<div class="payment_item active">
								<div class="radion_btn">
									<input type="radio" id="f-option6" name="payment" checked="checked" value="CARD"> <label for="f-option6">카드 결제</label>
									<div class="check"></div>
								</div>
							</div>
							<br>
							<div class="creat_account">
								<input type="checkbox" id="f-option4" required />
								<a style="color: #778C79;">이용 약관*</a> <label for="f-option4" style="padding:0px;">을 읽고 확인하였으며 동의합니다.</label>
							</div>
							
							<input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">
							<input type="hidden" name="userName" value="<%= loginUser.getUserName() %>">	
							<input type="hidden" name="userPhone" value="<%= loginUser.getPhone() %>">
							<input type="hidden" name="cardUid" value="">
							<input type="hidden" name="totalPrice" value="<%= sum + 3000%>">
							<input type="hidden" name="orderProCode" value="<%= orderProCode %>">
							<input type="hidden" name="proQty" value="">
							<button type="button" onclick="requestPay();" id="submit-btn" class="btn_3">결제 진행하기</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>

	<br>
	<br>
	<br>
	<br>
	<br>
	<!--================End Checkout Area =================-->

	<!-- =============== Footer Bar Area =============== -->
	<%@ include file="../common/footerbar.jsp"%>

	<!-- ========== Start Script Area ========== -->

	<!-- jQuery CDN -->
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<!-- Daum Post Code API -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- iamport.payment.js -->
  	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
	<script>
	
		// 다음 주소 API 관련 function
		function execDaumPostCode() {
			new daum.Postcode({
				oncomplete : function(data) {
					var roadAddr = ''; // 도로명주소

					if (data.userSelectedType === 'R') {
						roadAddr = data.roadAddress;
					} else {
						roadAddr = data.roadAddress;
					}
					$("#postCode").val(data.zonecode);
					$("#roadAddr").val(roadAddr);
				}
			}).open({
				autoClose : true
			});
		}

		
		// 올바른 핸드폰번호, 이메일만 넘겨지도록 정규식으로 검사하는 함수
		$(function() {
			$("input[name=phone]").change(function() {
				if (!/^010[0-9]{8}$/.exec($("input[name=phone]").val())) {
					alert("올바른 핸드폰 번호를 입력하세요.");
					$("input[name=phone]").val("");
				}
			})

			$("input[name=email]").change(
					function() {
						if (!/^[a-z0-9-_]+@[a-z0-9-_]+\.[a-z]{2,3}/.exec($("input[name=email]"))) {
							alert("올바른 이메일 형식을 입력하세요.");
							$("input[name=email]").val("");
						}
					})
		})
		
		
		// proQty input 요소에 ,로 연이은 proCode별 구매 상품 개수 넘기기
		$(function(){
			var proQty = "";
			$("#proQty").each(function(){
				proQty += $("#proQty").text() + ",";
				proQty.substring(0, proQty.lastIndexOf(","));
			})
			$("input[name=proQty]").val(proQty);
		})
		
		
		// 포인트 사용 input요소에 값 입력되면 입력값을 주문서의 포인트 사용란에 넣기
		$(function(){
			$("input[name=point]").change(function(){
				if( $(this).val() > <%= loginUser.getPoint() %> ){
					$(this).val("");
					alert("보유한 포인트를 초과하는 금액은 사용할 수 없습니다.");
				}else{
					$("#usedPoint").text( $(this).val() );			
					$("#totalPrice").text( <%= sum %> - 3000 -  $(this).val() );
					$("input[name=totalPrice]").val( <%= sum %> - 3000 -  $(this).val() );
				}
			})
		})
		
		// 주문자 정보와 동일 클릭 시 실행되는 함수 
		$(function(){
			$("#same-as-user").click(function(){
				$("input[name=name]").val( '<%= loginUser.getUserName() %>' );
				$("input[name=phone]").val( '<%= loginUser.getPhone() %>' );
				$("input[name=email]").val( '<%= loginUser.getEmail() %>' );
				$("input[name=postCode]").val( '<%= loginUser.getZonecode() %>' );
				$("input[name=roadAddr]").val( '<%= loginUser.getAddress() %>' );
				$("input[name=detailAddr]").val( '<%= loginUser.getAddrDetail() %>' );
			})
		})
		
		//============================================================
			
		
		// 결제하기 버튼 누르면 결제(카드 or 무통장) 요청하는 function
		function requestPay() {
			
			if( $("#f-option6").prop("checked") ){
				// 카드 결제 라디오버튼을 선택한 경우
				var IMP = window.IMP;
				IMP.init("imp03580136"); // 가맹점 식별코드
				
				//IMP.request_pay(param, callback) 결제창 호출
				IMP.request_pay({ // param
					pg: "nice",
					pay_method: "card",
					merchant_uid: "ORD" + <%= new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + (int)(Math.random() * 90000 + 10000) %> ,
					name: '어스어스 상품',
					amount: /* $("#totalPrice").text() */ 100,
					buyer_email: $("input[name=email]").val(),
					buyer_name: $("input[name=name]").val(),
					buyer_tel: $("input[name=phone]").val(),
					buyer_addr: $("input[name=roadAddr]").val() + $("input[name=detailAddr]").val(),
					buyer_postcode: $("input[name=postCode]").val()
				}, function (rsp) { // callback
				    if (rsp.success) { 
				  	  // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
				  	  $("input[name=cardUid]").val( rsp.merchant_uid );
				  	  $("#order-form").submit();
				
				    } else {
				      alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
				    }
				});
			}else{
				// 무통장 입금 선택한 경우
				$("#order-form").submit();
			}
			
			
	    }

	</script>
</body>

</html>