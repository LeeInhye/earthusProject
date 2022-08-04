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
        .explan>span{
          font-size:xx-large;
          font-weight:bold;
        }
        #mybtn{
            background-color:rgb(168,191,170);
            border:0;
            color:white;
            width:100px;
            height:30px;
            border-radius:20px;
            float:right;
          margin-top:20px;
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
        #or-info, #re-info{
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
        #re-info>table{
          border:1px solid gray;
          width:100%;
          height:80px;
        }
        .info h4{font-weight:bold;}
        #del-info th, #pay-info th, #or-info th, #re-info th{
          background-color:rgba(128, 128, 128,0.2);
          width:30%;
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
        .info th, .info td{padding-left:5px;}
    </style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
    <section class="explan">
        <span>취소 내역</span>
        <button id="mybtn">마이페이지&gt;</button>
    
        <hr>
      </section>
    
      <section class="o-info">
      </section>
    
      <section class="cart_area">
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
                    <td rowspan="3" class="on">
                      <h5><%=or.getOrderNo() %></h5>
                      <p style="font-size:small"><%=or.getOrderDate() %></p>
                    </td>
                    <td>
                      <div class="media">
                        <div class="d-flex">
                          <img src="img/product/single-product/cart-1.jpg" alt="" />
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
                      <h5><%=or.getDelStatus() %></h5>
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
              <th>주문번호</th>
              <td><%=list.get(0).getOrderNo() %></td>
            </tr>
            <tr>
              <th>결제일</th>
              <td><%=list.get(0).getOrderDate() %></td>
            </tr>
            <tr>
              <th>주문처리상태</th>
              <td>주문취소</td>
            </tr>
            <tr>
              <th>주문자</th>
              <td><%=list.get(0).getOrdrrName() %></td>
            </tr>
            <tr>
              <th>주문자 휴대폰 번호</th>
              <td><%=list.get(0).getOrdrrPhone() %></td>
            </tr>
            <tr>
              <th>주문자 주소</th>
              <%if(list.get(0).getZoneCode() != null){ %>
              <td>(<%=list.get(0).getZoneCode() %>)<%=list.get(0).getAddress() %> <%=list.get(0).getAddrDetail() %></td>
              <%}else{ %>
              <td>(<%=list.get(0).getDelZoneCode() %>)<%=list.get(0).getDelAddress() %> <%=list.get(0).getDelAddrDetail() %></td>
              <%} %>
            </tr>
          </table>
        </div>
      
        <div id="del-info">
          <h4>배송지 정보</h4>
          <hr>
          <table border="1">
            <tr>
              <th>수령인</th>
              <td><%=list.get(0).getDelName() %></td>
            </tr>
            <tr>
              <th>휴대폰 번호</th>
              <td><%=list.get(0).getDelPhone() %></td>
            </tr>
            <tr>
              <th>주소</th>
              <td>(<%=list.get(0).getDelZoneCode() %>)<%=list.get(0).getDelAddress() %> <%=list.get(0).getDelAddrDetail() %></td>
            </tr>
            <tr>
              <th>배송메모</th>
              <td><%=list.get(0).getShpMemo() %></td>
            </tr>
          </table>
        </div>
      
        <div id="re-info">
          <h4>환불 정보</h4>
          <hr>
          <table border="1">
            <tr>
              <th>결제수단</th>
              <td><%=list.get(0).getPayment() %></td>
            </tr>
            <tr>
              <th>환불금액</th>
              <td><%=list.get(0).getPaymentAmount()+3000 %>(배송비포함)</td>
            </tr>
          </table>
        </div>
        
        <div id="pay-info">
          <h4>결제 정보</h4>
          <hr>
          <table border="1">
            <tr>
              <th>총 주문금액</th>
              <td><%=list.get(0).getPaymentAmount()+3000 %></td>
            </tr>
            <tr>
              <th>포인트 사용</th>
              <td>- <%=list.get(0).getPointsUsed() %></td>
            </tr>
            <tr>
              <th>배송비</th>
              <td>+ 3,000</td>
            </tr>
            <tr>
              <th>결제금액</th>
              <td><%=list.get(0).getPaymentAmount()+3000-list.get(0).getPointsUsed() %></td>
            </tr>
            <tr>
              <th>결제수단</th>
              <td><%=list.get(0).getPayment() %></td>
            </tr>
          </table>
        </div>
      </div>
    
      <div align="center">
        <button id="en-btn" onclick="history.back()">확인</button>
      </div>
      
      <script>
      	$(function(){
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