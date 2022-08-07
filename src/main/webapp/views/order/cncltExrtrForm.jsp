<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.us.order.model.vo.*, com.us.common.model.vo.PageInfo"%>
<%
	ArrayList<Order> celist = (ArrayList<Order>)request.getAttribute("celist");

	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
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
		.cancel, .exchange, #detail{
		  background-color:rgb(168,191,170);
		  border:0;
		  color:white;
		  width:80px;
		  height:30px;
		  border-radius:5px;
		  margin:5px;
		}
		#y-btn {
		  border:0;
		  border-radius:5px;
		  background-color:rgb(119,140,121);
		  color:white;
		  width:90px;
		  height:40px;
		}
		#n-btn{
		  border:0;
		  border-radius:5px;
		  background-color:rgba(64,64,64,0.5);
		  color:white;
		  width:90px;
		  height:40px;
		}
		.dis-btn{
			background-color:rgb(242,242,242);
			color:black;
			border:0;
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
		<button type="button" id="mybtn" onclick="location.href='<%=contextPath%>/myPage.mp'">마이페이지&gt;</button>
	
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
					  <tr class="tt" myattr="<%=or.getOrderNo() %>">
						<td class="on">
							
							<h5><%=or.getOrderNo() %></h5>
							<p style="font-size:small"><%=or.getOrderDate() %></p>
						</td>
						<td>
						  <div class="media">
							<div class="d-flex">
							 <img width="250" height="250" src="<%=contextPath %>/<%=or.getProImgPath() %>"/>
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
						  <div class="p-btn">
						  <%if((or.getDelStatus() == 1)){ %>
						  	<button id="cancel<%=or.getProCode()%>" class="cancel" type="button" data-toggle="modal" data-target="#cancelModal">취소</button> <br>
						  	<button id="exchange" class="exchange" type="button" data-toggle="modal" data-target="#impoExrtrModal">교환/반품</button> <br>
						  	<button id="detail" type="button" data-toggle="modal" data-target="#nopelModal">내역조회</button>
						  <%}else if((or.getDelStatus() == 2)){ %>
						  	<button id="cancel<%=or.getProCode()%>" class="cancel" type="button" data-toggle="modal" data-target="#impoCancelModal1">취소</button> <br>
						  	<button id="exchange" class="exchange" onclick="location.href='<%=contextPath%>/request.or?exNo=<%=or.getOrderNo()%>&pCo=<%=or.getProCode()%>';">교환/반품</button> <br>
						  	<button id="detail" type="button" data-toggle="modal" data-target="#nopelModal">내역조회</button>
						  <%}else if((or.getDelStatus() == 3)){ %>
						  	<button id="cancel<%=or.getProCode()%>" class="cancel" type="button" data-toggle="modal" data-target="#impoCancelModal2">취소</button> <br>
						  	<button id="exchange" class="exchange" onclick="location.href='<%=contextPath%>/request.or?exNo=<%=or.getOrderNo()%>&pCo=<%=or.getProCode()%>';">교환/반품</button> <br>
						  	<button id="detail" type="button" data-toggle="modal" data-target="#nopelModal">내역조회</button>
						  <%}else if((or.getDelStatus() == 4) || (or.getDelStatus() == 5) || (or.getDelStatus() == 6)) {%>
							<button id="cancel<%=or.getProCode()%>" class="cancel dis-btn" type="button" data-toggle="modal" data-target="#cancelModal" disabled>취소</button> <br>
							<button id="exchange" class="exchange dis-btn" onclick="location.href='<%=contextPath%>/request.or?exNo=<%=or.getOrderNo()%>&pCo=<%=or.getProCode()%>';" disabled>교환/반품</button> <br>
							<%if(or.getDelStatus() == 4) {%>
							  <button id="detail" onclick="location.href='<%=contextPath%>/canDetail.or?cNo=<%=or.getOrderNo() %>'">내역조회</button>
							<%}else{ %>
							  <button id="detail" onclick="location.href='<%=contextPath%>/exrtrDetail.or?erNo=<%=or.getOrderNo() %>&pNo=<%=or.getProCode()%>'">내역조회</button>
							<%} %>
						  <%} %>
						  </div>
						</td>
					  </tr>
					<%} %>
				</tbody>
			  </table>
			</div>
		  </div>
	</section>
	
	<div class="modal" id="impoCancelModal1">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-body" align="center">
		        	<br><br>
		        	<span style="font-size:large;">배송이 시작되었습니다.<br>교환/반품만 가능합니다.</span> <br><br><br>
		        	<input type="hidden" value="" id="cancelOrNo">
		        	<button type="button" class="btn" id="y-btn" data-dismiss="modal">확인</button>
		        	
		      </div>
		    </div>
		  </div>
	</div>
	
	<div class="modal" id="impoCancelModal2">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-body" align="center">
		        	<br><br>
		        	<span style="font-size:large;">배송이 완료되었습니다.<br>교환/반품만 가능합니다.</span> <br><br><br>
		        	<input type="hidden" value="" id="cancelOrNo">
		        	<button type="button" class="btn" id="y-btn" data-dismiss="modal">확인</button>
		        	
		      </div>
		    </div>
		  </div>
	</div>
	
	<div class="modal" id="impoExrtrModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-body" align="center">
		        	<br><br>
		        	<span style="font-size:large;">배송완료 후 신청 가능합니다.</span> <br><br><br>
		        	<button type="button" class="btn" id="y-btn" data-dismiss="modal">확인</button>
		        	
		      </div>
		    </div>
		  </div>
	</div>
	
	<div class="modal" id="cancelModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-body" align="center">
		        	<br><br>
		        	<span style="font-size:large;">정말 취소하시겠습니까?</span> <br><br><br>
		        	<button type="button" class="btn" id="y-btn" name="can" value="4" onclick="goCancel(4);">확인</button> &nbsp;&nbsp;
		        	<button type="button" class="btn" id="n-btn" data-dismiss="modal">취소</button>
		        	
		      </div>
		    </div>
		  </div>
	</div>
	
	<div class="modal" id="nopeModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-body" align="center">
		        	<br><br>
		        	<span style="font-size:large;">취소/교환/반품 내역만 조회 가능합니다.</span> <br><br><br>
		        	<button type="button" class="btn" id="y-btn" data-dismiss="modal">확인</button>
		        	
		      </div>
		    </div>
		  </div>
	</div>
	
	<!-- 페이징바 영역 -->
    <nav class="blog-pagination justify-content-center d-flex">
        <ul class="pagination">
        	<% if(currentPage != 1) {%>
                <li class="page-item">
                    <button onclick="location.href='<%=contextPath%>/CncltExrtr.or?cpage=<%= pi.getCurrentPage()-1 %>';" class="page-link" aria-label="Previous">
                        <i class="ti-angle-left"></i>
                    </button>
                </li>
            <% } %>
            
            <% for(int p=startPage; p<=endPage; p++) { %>
 			<% if(p == currentPage){ %>
                    <li class="page-item active">
                        <button class="page-link" disabled><%= p %></button>
                    </li>
 			<% }else { %>
                    <li class="page-item">
                        <button class="page-link" onclick="location.href='<%=contextPath%>/CncltExrtr.or?cpage=<%= p %>';"><%= p %></button>
                    </li>
			<% } %>
			<% } %>

            <% if(currentPage != maxPage) { %>
                <li class="page-item">
                    <button onclick="location.href='<%=contextPath%>/CncltExrtr.or?cpage=<%= pi.getCurrentPage()+1 %>';" class="page-link" aria-label="Next">
                        <i class="ti-angle-right"></i>
                    </button>
                </li>
            <% } %>
        </ul>
    </nav>
    <!-- 페이징바 영역 끝 -->
	
	<script>
		function goCancel(num){
			location.href= '<%=contextPath%>/cancel.or?orderNo=' + $('#cancelOrNo').val() + '&can=' + num;
		}
		
		  $(function(){
			  $(".cancel").click(function(){
				  //$("#cancelOrNo").val($(this).parents("tr").siblings().eq(0).children(".on").children("h5").text());
				  $("#cancelOrNo").val($(this).parents(".tt").attr("myattr"));
			  })
		  })
		  
			$(".on").each(function() {
			  var rows = $(".on:contains('" + $(this).text() + "')");
			  if (rows.length > 1) {
			    rows.eq(0).attr("rowspan", rows.length);
			    rows.not(":eq(0)").remove();
			  }
			});
		

	</script>
	
	<br><br><br><br><br><br><br><br><br><br>
	<%@ include file="../common/footerbar.jsp" %>

</body>
</html>