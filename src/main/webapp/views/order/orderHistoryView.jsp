<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.us.order.model.vo.*"%>
<% 
ArrayList<Order> list = (ArrayList<Order>)session.getAttribute("list");
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
    </style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
    <section class="explan">
        <h2>주문 내역</h2>
        <br>
        <span style="font-size:small">
          주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.<br>
          취소/교환/반품은 마이페이지의 취소/교환/반품 메뉴에서 가능합니다.
    
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
                    <th scope="col">상품정보</th>
                    <th scope="col">주문일자</th>
                    <th scope="col">주문번호</th>
                    <th scope="col">주문금액</th>
                    <th scope="col">주문처리상태</th>
                  </tr>
                </thead>
                <tbody>
                  	<%if(list.isEmpty()){ %>
                  		<tr>
                  			<td colspan="5" align="center">
	                			<h3>주문내역이 없습니다.</h3>
	                		</td>
                  		</tr>
                  	<%}else { %>
                  		<%for(Order or : list){ %>
		                  <tr>
		                    <td style="display:block">
		                      <a href="">
		                        <div class="media">
		                          <div class="d-flex">
		                            <img src="" alt="" />
		                          </div>
		                          <% if(or.getProCount() == 1) {%>
			                          <div class="media-body">
			                            <h5><%= or.getProName() %></h5>
			                          </div>
		                          <%}else{ %>
		                          	  <div class="media-body">
		                          	  	<input type="hidden" value="<%=or.getProCode()%>">
			                            <h5><%= or.getProName() %> 외 <%=or.getProCount()-1 %>건</h5>
			                          </div>
		                          <%} %>
		                        </div>
		                      </a>
		                    </td>
		                    <td>
		                      <h5><%= or.getOrderDate() %></h5>
		                    </td>
		                    <td>
		                      <div class="product_count">
		                        <h5>
		                        <a href="<%=contextPath %>/historyDetail.or?oNo=<%= or.getOrderNo() %>" style="color:black;"><%= or.getOrderNo() %></a>
		                        </h5>
		                      </div>
		                    </td>
		                    <td>
		                      <h5><%=or.getPaymentAmount() %></h5>
		                    </td>
		                    <td>
		                      <% if(or.getDelStatus() == 1){ %>
		                      	<h5>상품준비중</h5>
		                      	<%} %>
		                    </td>
		                  </tr>
                  	<%} %>
                  <%} %>
                </tbody>
              </table>
              
            </div>
          </div>
      </section>
      <script>
      $(function(){
  		$(".table>tbody>tr").on("click", "td(:third-child)", function() {
  			console.log($(this).children().eq(1).text());
  			location.href = "<%= contextPath %>/historyDetail.or?oNo=" + $(this).children().eq(1).text();
  			})
  			
  		});
      </script>
		<br><br><br><br><br><br><br><br><br><br>
	<%@ include file="../common/footerbar.jsp" %>
</body>
</html>