<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.us.order.model.vo.*"%>
<%
	ArrayList<Order> list = (ArrayList<Order>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
	<style>
		.explan{
		  width:70%;
		  margin:auto;
		  margin-top:200px;
		}
		#mybtn{
			background-color:rgb(168,191,170);
			border:0;
			color:white;
			width:100px;
			height:30px;
			border-radius:20px;
			float:right;
		}
		.table{
		  text-align:center;
		}
		#cancel, #exchange{
		  background-color:rgb(168,191,170);
		  border:0;
		  color:white;
		  width:80px;
		  height:30px;
		  border-radius:5px;
		  margin:5px;
		}
		#en-btn{
		  border:0;
		  border-radius:5%;
		  background-color:rgb(119,140,121);
		  color:white;
		  font-weight:bold;
		  width:200px;
		  height:40px;
		  margin-top:100px;
		}
		.re-info{width:70%; margin:auto;}
		.re-info table{
		  border:1px solid gray;
		  width:100%;
		}
		.re-info th{
		  width:20%;
		  height:40px;
		  background-color:rgba(128, 128, 128,0.2);
		}
		.re-info th, .re-info td{padding-left:5px;}
		#re1{
		  width:100%;
		  height:300px;
		  padding-top:50px;
		} 
		
		#re5{
		  width:45%;
		  height:300px;
		  padding-top:50px;
		}
		#re3{
		  width:45%;
		  height:300px;
		  padding-top:20px;
		}
		#re4{
		  width:45%;
		  height:300px;
		  float:right;
		  padding-top:20px;
		}
		#re2, #re6{
		  width:45%;
		  height:300px;
		  float:right;
		  padding-top:50px;
		}
	
		.list1 h4, .list2 h4, .list3 h4{font-weight:bold;}
		
	  </style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>

	<section class="explan">
		<h2>교환 / 반품 내역</h2>
		<br>
		<span style="font-size:small">
		  주문 취소는 상품준비중 상태까지만 접수 가능하며 <br>
		  배송 시작 이후에는 배송완료 후 교환/반품 신청만 가능합니다. <br>
		  문의사항이 있으시면 Q&A게시판을 이용해 주세요.
	
		</span>
		<button type="button" id="mybtn" onclick="location.href='<%=contextPath%>/myPage.mp'">마이페이지&gt;</button>
	
		<hr>
	</section>
	
	<section class="cart_area padding_top">
		<div class="cart_inner">
		  <div class="table-responsive">
			<table class="table" style="width:70%" align="center">
			  <thead>
				<tr>
				  <th scope="col">주문번호 / 주문일자</th>
				  <th scope="col">상품정보</th>
				  <th scope="col">주문금액(수량)</th>
				  <th scope="col">주문처리상태</th>
				</tr>
			  </thead>
			  <tbody>
				<%for(Order or : list){ %>
					<tr>
					  <td>
						<h5><%=or.getOrderNo() %></h5>
						<p style="font-size:small"><%=or.getOrderDate() %></p>
					  </td>
					  <td>
						<div class="media">
						  <div class="d-flex">
							<img src="" alt="" />
						  </div>
						  <div class="media-body">
							<p><%=or.getProName() %></p>
						  </div>
						</div>
					  </td>
					  <td>
						<h5><%=or.getPrice() %></h5>
						<h5><%=or.getQuantity() %>개</h5>
					  </td>
					  <td>
					  	<%if(or.getDelStatus() == 5) {%>
							<h5>교환</h5>
						<%}else{ %>
							<h5>반품</h5>
						<%} %>
					  </td>
					</tr>
  				<%} %>
			  </tbody>
			</table>
	</section>
	<div class="re-info">
  
	  <form id="re1" class="list1">
		<h4>교환/반품 선택</h4>
		<hr>
		<%if(list.get(0).getDelStatus() == 5){ %>
			<span style="font-size:larger;">교환</span>
		<%}else{ %>
			<span style="font-size:larger;">반품</span>
		<%} %>
	  </form>
  
	  <form id="re4" class="list2">
		<h4>보내실 곳</h4>
		<hr>
		<table border="1">
		  <tr>
			<th>지정 택배사</th>
			<td>cj대한통운(착불)</td>
		  </tr>
		  <tr>
			<th>판매자 이름</th>
			<td>Earth.Us</td>
		  </tr>
		  <tr>
			<th>전화번호</th>
			<td>02-2108-5900</td>
		  </tr>
		  <tr>
			<th>판매자 주소</th>
			<td>(08505) 서울시 금천구 가산디지털2로 115, 911호</td>
		  </tr>
		</table>
		<span style="font-size:x-small; color:red; float:right;">직접 반품 접수해 주시면 됩니다.</span>
	  </form>
  
	  <form id="re3" class="list3">
		<h4>회수지 정보</h4>
		<hr>
		<table border="1">
		  <tr>
			<th>이름</th>
			<td><%=list.get(0).getDelName() %></td>
		  </tr>
		  <tr>
			<th>휴대폰 번호</th>
			<td><%=list.get(0).getDelPhone() %></td>
		  </tr>
		  <tr>
			<th>회수지 주소</th>
			<td>(<%=list.get(0).getDelZoneCode() %>)<%=list.get(0).getDelAddress() %> <%=list.get(0).getDelAddrDetail() %></td>
		  </tr>
		</table>
	  </form>
  
	  <!-- 반품시에만 보이도록 -->
	  <%if(list.get(0).getDelStatus() == 6) {%>
		  <form id="re6" class="list3">
			<h4>반품시 환불금액</h4>
			<hr>
			<table border="1">
			  <tr>
				<th>주문금액</th>
				<td><%=list.get(0).getPaymentAmount()+3000 %>(배송비 포함)</td>
			  </tr>
			  <tr>
				<th>포인트 사용</th>
				<td><%=list.get(0).getPointsUsed() %></td>
			  </tr>
			  <tr>
				<th>환불금액</th>
				<td><%=list.get(0).getPaymentAmount()+3000-list.get(0).getPointsUsed() %></td>
			  </tr>
			</table>
			<span style="font-size:x-small; color:gray; float:right;">환불은 업무일 기준 2~3일 소요됩니다.</span>
		  </form>
  	  <%} %>
	  <form id="re5" class="list3">
		<h4>** 배송비 결제</h4>
		<hr>
		<table border="1">
		  <tr>
			<th>입금하실 계좌</th>
			<td>신한은행 1111-22-3333333 (얼스어스)</td>
		  </tr>
		  <tr>
			<th>교환 배송비</th>
			<td>3,000</td>
		  </tr>
		  <tr>
			<th>반품 배송비</th>
			<td>6,000</td>
		  </tr>
		</table>
	  </form>
  
	  
  
  
	  
	  <br><br>
  
	  <table id="pre" style="margin:auto;">
		<td>
		  <span>주의사항</span>
		  <ul>
			<li>- 접수 후 평일 기준 1~3일 내 택배 기사님이 연락 또는 방문을 드립니다.</li>
			<li>- 제주/도서산간 지역, 해외배송 상품, 귀책사유 상이 등은 추가 비용이 발생할 수 있습니다. (환불 금액에서 차감 또는 별도 청구)</li>
			<li>- 회수 상품 재포장 시, 어떠한 사유에서도 '현금' 은 동봉할 필요가 없습니다.</li>
			<li>- 환불 시에는 함께 받은 '사은품' 까지 모두 회수되어야 합니다. (단, 교환 시에는 함께 보내지 않아도 됨)</li>
			<li>- 배송비를 '한 번만' 결제한 경우, 반드시 묶음 포장(1박스)해야 합니다.</li>
			<li>- 같은 상품에서 여러 개 주문 후 일부만 취소를 원하는 경우, 전체 수량 취소 후 재구매를 해야 합니다.</li>
			<li>- 환불 시 적용됐던 적립금은 즉시 반환됩니다.</li>
			<li>- 가상계좌 방식으로 교환/환불 배송비를 결제하시는 경우, 1원 단위까지 정확히 입금하셔야 하며 입금 기한은 2일 이내입니다.</li>
		  </ul>
		</td>
	  </table>
	</div>
  
	<div align="center">
	  <button id="en-btn" onclick="history.back();">확인</button>
	</div>
	
	<br><br><br><br><br><br><br><br><br><br>
	<%@ include file="../common/footerbar.jsp" %>

</body>
</html>