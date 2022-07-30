<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.us.product.model.vo.WishList"%>
<%
ArrayList<WishList> list = (ArrayList<WishList>)request.getAttribute("list");
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
        .del-btn{
          background-color:rgb(168,191,170);
          color:white;
          border:0;
          width:80px;
          height:30px;
          border-radius:5px;
        }
        .ca-btn{
          background-color:rgb(119,140,121);
          color:white;
          border:0;
          width:200px;
          height:30px;
          border-radius:5px;
        }
        table input{accent-color:rgb(119,140,121);}
      </style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
    <section class="explan">
        <br>
        <span>위시리스트</span>
        <button id="mybtn" onclick="location.href='<%=contextPath%>/myPage.mp';">마이페이지&gt;</button>
    
        <hr>
      </section>
    
      <!--================Cart Area =================-->
      <section class="cart_area padding_top">
         <div class="cart_inner">
          	<div class="table-responsive">
            	<table class="table" style="width:70%" align="center">
	                <thead>
	                  <tr align="center">
	                    <th scope="col" width="20px;"><input type="checkbox" id="checkAll"></th>
	                    <th scope="col">상품정보</th>
	                    <th scope="col" colspan="2">가격</th>
	                    <th scope="col"  width="15%;">찜한날짜</th>
	                  </tr>
	                </thead>
	                <tbody>
	                <% if(list.isEmpty()) {%>
	                	<tr>
	                		<td colspan="5" align="center">
	                			<h3>찜한 상품이 없습니다.</h3>
	                		</td>
	                	</tr>
	                <% }else { %>
		                <%for(WishList wi : list) { %>
		                  <tr>
		                    <td align="center">
		                      <input type="checkbox" class="product" >
		                    </td>
		                    <td>
		                      <div class="media">
		                        <div class="d-flex">
		                          <%= wi.getProImgPath() %>
		                        </div>
		                        <div class="media-body">
		                          <p><%= wi.getProName() %></p>
		                        </div>
		                      </div>
		                    </td>
		                    <td colspan="2" align="center">
		                      <h5><%= wi.getPrice() %></h5>
		                    </td>
		                    <td align="center">
		                      <h5><%= wi.getWishDate() %></h5>
		                    </td>
		                  <%} %>
	                  <%} %>
	                  
	                  <!-- 삭제기능 아직 -->
	                  <tr class="bottom_button">
	                    <td>
	                      <button class="del-btn">선택삭제</button>
	                    </td>
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                    <td>
	                      <div class="cupon_text float-right">
	                        <button class="ca-btn">선택 상품 장바구니로 이동</button>
	                      </div>
	                    </td>
	                  </tr>
	                  
	                </tbody>
            	</table>
            </div>
          
      </section>
    
      <script>
        $(function(){
          $("#checkAll").click(function(){
            if($("#checkAll").prop("checked")){
              $(".product").prop("checked", true);
            }else{
              $(".product").prop("checked", false);
            }
          })
    
          for(let i=0; i<".product".length; i++){
            if($(".product")[i].prop("checked", false)){
              $("#checkAll").prop("checked", false);
            }
          }
    
          $(".del-btn").click(function(){
            $(".product:checked").parent().parent().remove();
          })
          
        })
        
        
      </script>
	
</body>
</html>