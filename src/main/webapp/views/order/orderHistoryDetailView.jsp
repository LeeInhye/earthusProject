<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.us.order.model.vo.*"%>
<%
	ArrayList<Order> olist = (ArrayList<Order>)session.getAttribute("olist");
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
		.o-info{
		  padding-top:100px;
		  padding-left:17%;
		  font-weight:bold;
		}
		#q-btn,#r-btn{
		  background-color:rgb(168,191,170);
		  border:0;
		  color:white;
		  width:80px;
		  height:30px;
		  border-radius:5px;
		  margin:5px;
		}
		#del-info, #pay-info{
		  width:45%;
		  height:400px;
		  padding-left:15%;
		  padding-top:50px;
		}
		#or-info{
		  width:45%;
		  height:400px;
		  float:right;
		  padding-right:15%;
		  padding-top:50px;
		}
		#del-info>table{
		  border:1px solid gray;
		  width:100%;
		  height:160px;
		}
		#pay-info>table{
		  border:1px solid gray;
		  width:100%;
		  height:200px;
		}
		#or-info>table{
		  border:1px solid gray;
		  width:100%;
		  height:240px;
		}
		.info h4{font-weight:bold;}
		#del-info th, #pay-info th, #or-info th{
		  background-color:rgba(128, 128, 128,0.2);
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
	</style>
</head>
<body>
	
	<%@ include file="../common/menubar.jsp" %>
	
	<section class="explan">
		<h2>주문별 상세 내역</h2>
		<br>
		<span style="font-size:small">
		  고객님의 주문별 상세 내역입니다.<br>
		  취소/교환/반품은 마이페이지의 취소/교환/반품 메뉴에서 가능합니다.
	
		</span>
		<button type="button" id="mybtn" onclick="location.href='<%=contextPath%>/myPage.mp'">마이페이지&gt;</button>
	
		<hr>
	  </section>
	  
	  <section class="o-info">
		<span>주문번호 : <%=olist.get(0).getOrderNo() %></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span>주문일자 : <%=olist.get(0).getOrderDate() %></span>
	  </section>
	
	  <!--================Cart Area =================-->
	  <section class="cart_area">
		  <div class="cart_inner">
			<div class="table-responsive">
			  <table class="table" style="width:70%" align="center">
				<thead>
				  <tr>
					<th scope="col">상품정보</th>
					<th scope="col">주문금액(수량)</th>
					<th scope="col">주문처리상태</th>
					<th scope="col"></th>
				  </tr>
				</thead>
				<tbody>
				<% for(Order or : olist){ %>
				  <tr>
					<td>
					  <div class="media">
						<div class="d-flex">
						  <img width="250" height="250" src="<%=contextPath %>/<%=or.getProImgPath() %>" />
						</div>
						<div class="media-body">
						  <h5><%=or.getProName() %></h5>
						</div>
					  </div>
					</td>
					<td>
					  <h5><%=or.getPrice() %></h5>
					  <h5><%=or.getQuantity() %>개</h5>
					</td>
					<td>
						<%if(or.getDelStatus() == 1) {%>
						  <h5>상품준비중</h5>
						<%}else if(or.getDelStatus() == 2) {%>
						  <h5>배송중</h5>
						<%}else if(or.getDelStatus() == 3) {%>
						  <h5>배송완료</h5>
						  <%}else if(or.getDelStatus() == 4) {%>
						  <h5>주문취소</h5>
						  <%}else if(or.getDelStatus() == 5) {%>
						  <h5>교환</h5>
						<%}else {%>
						  <h5>반품</h5>
						<%} %>
					</td>
					<td>
					  <button id="q-btn" onclick="href='<%=contextPath%>';">상품 문의</button><br>
					  <button id="r-btn" onclick="href='<%=contextPath%>';">리뷰 작성</button>
					</td>
				  </tr>
				  <%} %>
				</tbody>
			  </table>
			  
			</div>
		  </div>
	  </section>
	
	  <div class="info">
		<div id="or-info">
		  <h4>주문 정보</h4>
		  <hr>
		  <table border="1">
			<tr>
			  <th width="120">주문번호</th>
			  <td><%=olist.get(0).getOrderNo()%></td>
			</tr>
			<tr>
			  <th>결제일</th>
			  <td><%=olist.get(0).getOrderDate() %></td>
			</tr>
			<tr>
			  <th>주문처리상태</th>
			  <td>
			  <%if(olist.get(0).getDelStatus() == 1) {%>
					상품준비중
			  <%}else if(olist.get(0).getDelStatus() == 2) {%>
					배송중
			  <%}else if(olist.get(0).getDelStatus() == 3) {%>
					배송완료
			  <%}else {%>
					주문취소
			  <%} %>
			  </td>
			</tr>
			<tr>
			  <th>주문자</th>
			  <td><%=olist.get(0).getOrdrrName() %></td>
			</tr>
			<tr>
			  <th>주문자 휴대폰 번호</th>
			  <td><%=olist.get(0).getOrdrrPhone() %></td>
			</tr>
			<tr>
			  <th>주문자 주소</th>
			  <%if(olist.get(0).getZoneCode() != null){ %>
			  <td>(<%=olist.get(0).getZoneCode() %>) <%=olist.get(0).getAddress() %> <%=olist.get(0).getAddrDetail() %></td>
			  <%}else{ %>
			  <td>(<%=olist.get(0).getDelZoneCode() %>) <%=olist.get(0).getDelAddress() %> <%=olist.get(0).getDelAddrDetail() %></td>
			  <%} %>
			</tr>
		  </table>
		</div>
	  
		<div id="del-info">
		  <h4>배송지 정보</h4>
		  <hr>
		  <table border="1">
			<tr width="80">
			  <th width="80">수령인</th>
			  <td><%=olist.get(0).getDelName() %></td>
			</tr>
			<tr>
			  <th>휴대폰 번호</th>
			  <td><%=olist.get(0).getDelPhone() %></td>
			</tr>
			<tr>
			  <th>주소</th>
			  <td>(<%=olist.get(0).getDelZoneCode() %>) <%=olist.get(0).getDelAddress() %> <%=olist.get(0).getDelAddrDetail() %></td>
			</tr>
			<tr>
			  <th>배송메모</th>
			  <%if(olist.get(0).getShpMemo() != null) {%>
			  	 <%if(olist.get(0).getShpMemo() == "0"){%>
				   <td>요청사항 없음</td>
				  <%}else if(olist.get(0).getShpMemo() == "1"){%>
					   <td>경비실에 맡겨주세요.</td>
				  <%}else if(olist.get(0).getShpMemo() == "2"){%>
					   <td>현관문 앞에 놓아주세요.</td>
				  <%}else if(olist.get(0).getShpMemo() == "3"){%>
					   <td>배송 전에 미리 연락 바랍니다.</td>
				  <%} %>
			  <%}else{ %>
			  	<td>요청사항 없음</td>
			  <%} %>
			</tr>
		  </table>
		</div>
		
		<div id="pay-info">
		  <h4>결제 정보</h4>
		  <hr>
		  <table border="1">
			<tr>
			  <th width="80">총 주문금액</th>
			  <td><%=olist.get(0).getPaymentAmount() %></td>
			</tr>
			<tr>
			  <th>포인트 사용</th>
			  <%if(olist.get(0).getPointsUsed() != 0) {%>
			  <td>- <%=olist.get(0).getPointsUsed() %></td>
			  <%}else { %>
			  <td>0</td>
			  <%} %>
			</tr>
			<tr>
			  <th>배송비</th>
			  <td>+ 3,000</td>
			</tr>
			<tr>
			  <th>결제금액</th>
			  <td><%=olist.get(0).getPaymentAmount()+3000-olist.get(0).getPointsUsed() %></td>
			</tr>
			<tr>
			  <th>결제수단</th>
			  <td><%=olist.get(0).getPayment() %></td>
			</tr>
		  </table>
		</div>
	  </div>
	
	  <div align="center">
		<button id="en-btn">확인</button>
	  </div>
	  
	  <script>
	  	$(function(){
	  		$("#en-btn").click(function(){
	  			history.back();
	  		})
	  	})
	  </script>
	
	
	
	<br><br><br><br><br><br><br><br><br><br>
	<%@ include file="../common/footerbar.jsp" %>
</body>
</html>