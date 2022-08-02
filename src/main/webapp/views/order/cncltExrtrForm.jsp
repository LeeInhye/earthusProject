<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.us.order.model.vo.*"%>
<%
	ArrayList<Order> celist = (ArrayList<Order>)request.getAttribute("celist");
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
		.cancel, #exchange{
		  background-color:rgb(168,191,170);
		  border:0;
		  color:white;
		  width:80px;
		  height:30px;
		  border-radius:5px;
		  margin:5px;
		}
	</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<section class="explan">
		<h2>취소 / 교환 / 반품</h2>
		<br>
		<span style="font-size:small">
		  주문 취소는 상품준비중 상태까지만 접수 가능하며 <br>
		  배송 시작 이후에는 배송완료 후 교환/반품 신청만 가능합니다. <br>
		  문의사항이 있으시면 Q&A게시판을 이용해 주세요.
	
		</span>
		<button id="mybtn">마이페이지 &gt;</button>
	
		<hr>
	</section>
	
	  <!--================Cart Area =================-->
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
					<th scope="col">취소/교환/반품</th>
				  </tr>
				</thead>
				<tbody>
					<%for(Order or : celist){ %>
					  <tr>
						<td class="on">
							<h5><%=or.getOrderNo() %></h5>
							<p style="font-size:small"><%=or.getOrderDate() %></p>
						</td>
						<td>
						  <div class="media">
							<div class="d-flex">
							  <img src="<%=or.getProImgPath() %>" alt="" />
							</div>
							<div class="media-body">
							  <h5><%=or.getProName() %></h5>
							</div>
						  </div>
						</td>
						<td>
						  <h5><%=or.getPrice() %></h5><br>
						  <h5><%=or.getQuantity() %>개</h5>
						</td>
						<td>
							<%if(or.getDelStatus() == 1){ %>
							  <h5>상품준비중</h5>
							<%}else if(or.getDelStatus() == 2){%>
								<h5>배송중</h5>
							<%}else if(or.getDelStatus() == 3){%>
								<h5>배송완료</h5>
							<%}else {%>
								<h5>주문취소</h5>
							<%} %>
						</td>
						<td>
						  <div class="p-btn">
							<button id="cancel<%=or.getProCode()%>" class="cancel">취소</button> <br>
							<button id="exchange">교환/반품</button>
						  </div>
						</td>
					  </tr>
					<%} %>
				</tbody>
			  </table>
			</div>
		  </div>
	</section>
	
	<script>
		$(function(){
		  $(".cancel").click(function(){
			if(confirm("정말 취소하시겠습니까?") == true){
			  alert("취소되었습니다.");
			}else{
			  return;
			}
		  })
		  
		  
			$(".on").each(function() {
			  var rows = $(".on:contains('" + $(this).text() + "')");
			  if (rows.length > 1) {
			    rows.eq(0).attr("rowspan", rows.length);
			    rows.not(":eq(0)").remove();
			  }
			});
		})
		

	</script>
	
	<br><br><br><br><br><br><br><br><br><br>
	<%@ include file="../common/footerbar.jsp" %>

</body>
</html>