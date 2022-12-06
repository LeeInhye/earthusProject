<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.us.product.model.vo.*"%>
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
						<input type="hidden" name="userNo" value="<%=loginUser.getUserNo()%>">
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
						     			<input type="checkbox" class="product" name="pCode" value="<%= wi.getProCode() %>">
									</td>
									<td>
								 		<div class="media">
											<div class="d-flex">
										  		<img width="250" height="250" src="<%=contextPath%>/<%= wi.getProImgPath() %>">
											</div>
											<div class="media-body">
										  		<p><%= wi.getProName() %></p>
											</div>
								  		</div>
									</td>
									<td id="price" colspan="2" align="center">
								  		<h5><%= wi.getPrice() %></h5>
									</td>
									<td align="center">
								  		<h5><%= wi.getWishDate() %></h5>
									</td>
								</tr>
							<%} %>
						<%} %>
						
						<tr class="bottom_button">
							<td>
						  		<button class="del-btn" onclick="deleteProduct();">선택삭제</button>
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td>
						  		<div class="cupon_text float-right">
							    	<button class="ca-btn" onclick="goCart();">선택 상품 장바구니로 이동</button>
						  		</div>
							</td>
						</tr>
					  
					</tbody>
				</table>
				<div class="modal" id="cartModal">
					<div class="modal-dialog">
					    <div class="modal-content">
					        
					        <div class="modal-body" align="center">
				        		<br><br>
				            	<h5 class="modal-title">선택한 상품이 장바구니에 담겼습니다.</h5>
				            	<br><br>
				            	<button id="y-btn" onclick="location.reload();">확인</button>
					        </div>
					    </div>
					</div>
				</div>
			</div>
		</div>
	    
	</section>
    
	<script>
		
		// 전체선택 시 모든 체크박스 check
		$(function(){
			$("#checkAll").click(function(){
				if($("#checkAll").prop("checked")){
				  $(".product").prop("checked", true);
				}else{
				  $(".product").prop("checked", false);
				}
			})
			
			$(".product").click(function(){
				$("#checkAll").prop("checked", false);
			})
		
		})
		  
		// ajax로 상품 삭제용 function
		function deleteProduct(){
			var checkDel = "";
			// 현재 클래스가 product인 요소들에 순차적으로 접근(each)하면서 현재 체크박스가 checked 상태인 
			// 요소들의 value값들을 , 로 연이어서 문자열만들기 
				
			// 체크한 상품 삭제
			$("input:checkbox[name=pCode]:checked").each(function(){
			  		checkDel = checkDel + ($(this).val()) + ",";
			})
			  	
			checkDel = checkDel.substring(0,checkDel.lastIndexOf(","));
					
			$.ajax({
				url:"<%=contextPath%>/delWish.pr",
				data:{
					userNo:$("#lsuccess").val(),
					pCode:checkDel},
				success:function(){
					location.reload();
					
				}, error:function(){
					console.log("위시리스트 삭제용 ajax 통신 실패");
				}
			})
		 	
		}
		
		function goCart(){
			
			$.ajax({
				url:"<%=contextPath%>/insertCart.pr",
		 		data:{
		 			userNo:$("#lsuccess").val(),
		 			pCode:$("input:checkbox[name=pCode]:checked").val()},
		 		success:function(){
		 			$('#cartModal').modal('show');
		 		}, error:function(){
					console.log("카트 이동용 ajax 통신 실패");
				}
			})
		}
		
	</script>
	
	<br><br><br><br><br><br><br><br><br><br>
	<%@ include file="../common/footerbar.jsp" %>
</body>
</html>