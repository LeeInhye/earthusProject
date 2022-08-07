<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.us.product.model.vo.Cart, java.util.ArrayList" %>
<%
	ArrayList<Cart> list = (ArrayList<Cart>)request.getAttribute("list");
%>
<!doctype html>
<html lang="zxx">

<head>
  <!-- jQuery Script -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

  <!-- 내가 직접 설정한 스타일 : 꼭 복붙하기 -->
  <style>
    #display-price *{
      font-weight: bold;
      border: none;
    }
    .btn{
      border-radius: 10px;
      font-weight: bold;
      background-color: #A8BFAA;
      color:white;
    }
    .btn:hover{
      color:#404040;
      transition:500ms;
    }
    #checkout_btn{
      background-color: #778C79 ;
    }

  </style>
</head>

<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<!--================ START BANNER AREA =================-->
    <section class="breadcrumb contents_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h2>장바구니</h2>
                            <p>장바구니에 담은 상품을 확인하고 구매해보세요!</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
   	<!--================ END BANNER AREA =================-->

  <!--================Cart Area =================-->
  <section class="cart_area padding_top">
    <div class="container">
      <div class="cart_inner">
      	<form action="<%= contextPath %>/checkoutList.or" method="post">
      		<input type="hidden" name="fromCart" value="T">
	        <div class="table-responsive">
	          <table class="table">
	            <thead>
	              <tr>
	                <th width="100px" style="width:50px;"> <input type="checkbox" id="check-all" onclick="checkAll();"></th>
	                <th width="500px">상품</th>
	                <th width="200px">가격</th>
	                <th width="200px">수량</th>
	                <th width="150px">총 금액</th>
	              </tr>
	            </thead>
	
	            <tbody>
	            <% if(!list.isEmpty()){ %>
	            	<% for(Cart c : list) { %>
						<tr class="product" class="check-item">
					  		<td id="proCode">
						  		<input type="checkbox" name="check" value="<%=c.getProCode()%>">
						  	</td>
							<td>
							  	<div class="media">
								    <div class="d-flex">
								    </div>
								    <div class="media-body">
							      		<p><%= c.getProName() %></p>
								    </div>
							  </div>
							</td>
							<td id="price">
						  		<h5><%= c.getPrice() %></h5>
							</td>
							<td id="quantity">
						  		<div class="product_count">
								    <span class="input-number-decrement"> <i class="ti-angle-down"></i></span>
								    <input class="input-number"  name="proQty" type="text" value="<%= c.getProQty() %>">
								    <span class="input-number-increment"> <i class="ti-angle-up"></i></span>
						  		</div>
							</td>
						 	<td id="multipliedPrice">
								<h5><%= c.getPrice() * c.getProQty() %></h5>
						  	</td>
						</tr>
	              	<% } %>
	             <% }else { %>
	             	<tr>
	             		<th colspan="5">장바구니에 담긴 상품이 없습니다!</th>
	             	</tr>
	             <% } %>
	              <tr class="bottom_button">
	                <td colspan="2">
	                  <button class="btn" id="delete-checked" onclick="deleteChecked();">삭제</button>
	                </td>
	                <td colspan="4" align="right" style="color:gray; font-size:small">포인트를 적용한 실제 결제 금액은 결제페이지에서 확인할 수 있습니다.</td>
	              </tr>
	            </tbody>
	            <tfoot id="display-price" align="right" style="font-size:15px;">
	              <tr>
	                <td colspan="4">총 상품 금액</td>
	                <td id="totalPrice"></td>
	              </tr>
	              <tr>
	                <td colspan="4">배송비</td>
	                <td>3000원</td>
	              </tr>
	              <tr style="font-size:20px;">
	                <td colspan="4">총 주문 금액</td>
	                <td id="totalPriceWithDelivery"></td>
	              </tr>
	            </tfoot>
	          </table>
	          <div class="checkout_btn_inner float-right">
	          <% if(!list.isEmpty()) { %>
	          	<input type="hidden" id="userNo" name="userNo" value="<%= list.get(0).getUserNo() %>">
          	  <% } %>
	          	<input type="hidden" name="orderProCode" value="">
	            <a class="btn" href="<%=contextPath%>">계속 쇼핑하기</a>
	            <button class="btn" id="checkout_btn" onclick="orderChecked();">주문하기</button>
	          </div>
	        </div>
        </form>
      </div>
     </div>
  </section>
  
  <br><br><br><br><br><br><br><br><br>
  
  <!--================End Cart Area =================-->


  <!-- ============ Start Script Area ==============-->

  <script>
	
	// 상품 수량에 대한 함수 모음
    $(function(){
    	
      // 수량 증가 버튼 클릭 시 함수
      $(".input-number-increment").click(function(){
        if( Number($(this).siblings("input").val()) < 50 ){
          $(this).siblings("input").val( Number($(this).siblings("input").val()) + 1 )
          $(".input-number").change();
        }
      })

      // 수량 감소 버튼 클릭 시 함수
      $(".input-number-decrement").click(function(){
        if( Number($(this).siblings("input").val()) > 1 ){
          $(this).siblings("input").val( Number($(this).siblings("input").val()) - 1 )
          $(".input-number").change();
        }
      })

      // 1~10 이외의 값 입력 시 val()을 1로 바꾸는 함수
      $(".input-number").change(function(){
        if( !/^[0-9]+$/.test($(this).val()) ){
        	$(this).val("1");
        }
      })
    })
	
	// 수량이 변경되었을 때 (수량은 1 이상, 숫자여야만함),
	// 1) 상품 개수가 변경된 상품의 총 금액을 변경
	// 2) 바로 DB에 반영되도록 하는 AJAX 구문
	$(function(){
		$(".input-number").change(function(){
			console.log("change이벤트 발생");
			
			// 상품의 총 금액을 가격 * 금액으로 변경
			$(this).parent().parent().siblings("#multipliedPrice").children().text( Number($(this).parent().parent().siblings("#price").text()) * Number($(this).val()) );
			
			// ".input-number"의 value가 숫자일 때만 DB에 반영하기 위한 조건
			if( /^[0-9]+$/.test($(this).val()) ){
				// DB에 변경사항을 반영하기 위해 AJAX 구문 작성
				$.ajax({
					url:"<%=contextPath%>/update.ct",
					data:{
						userNo:$("#userNo").val(),
						proCode:$(this).parent().parent().siblings("#proCode").children().val(),
						proQty:$(this).val()
					},
					success:function(result){
						console.log("DB에 수량 변경 성공");
					},
					error:function(){
						alert("수량 변경에 실패하였습니다.");
					}
				})
			}
		})
	})
	
    // 현재 장바구니에 담긴 상품 개수 변화에 따라 총 상품 금액을 변경
    $(function(){
    	// input 요소에 변화가 생길 때마다 "체크된" 모든 금액*수량의 합 구해서 text()로  
    	$("input").change(function(){    		
    		var totalPrice = 0;
    		$("input[name=check]:checked").each(function(){
    			totalPrice += Number($(this).parent().siblings("#price").children("h5").text()) * Number($(this).parent().siblings("#quantity").children().children("input").val());
    		})
    		$("#totalPrice").text(totalPrice);
    		$("#totalPriceWithDelivery").text(totalPrice + 3000);
    	})
    	
    })
	
    // 전체체크박스에 대한 함수
    function checkAll(){
      if( $("#check-all").is(':checked') ){
        $("input[name='check']").prop('checked', true);
      }else {
        $("input[name='check']").prop('checked', false)
      }
    }
	
    // 선택 삭제에 대한 함수
    function deleteChecked(){
    	
		var deleteElement = "";
		
		// 체크된 상품에 순차적으로 접근해 해당 요소의 val()값을 ,로 연결해 하나의 문자열 만들기
		$("input[name=check]:checked").each(function(){
			deleteElement = deleteElement + ($(this).val()) + ",";
		})	
		  	
		// "value값, value값, ... value값," 와 같은 형태의 문자열이 만들어지므로
		// 마지막 ","을 삭제해야 "value값, ... value값" 형태로 WHERE PRO_CODE IN ( ? ) 안에 넣을 수 있음
		// => 이것을 "동적 SQL문"이라고 함!!
		deleteElement = deleteElement.substring(0, deleteElement.lastIndexOf(","));
				
		$.ajax({
			url:"<%=contextPath%>/delete.ct", // 서블릿주소
			data:{
				userNo:$("#userNo").val(),
				proCode:deleteElement // 삭제할 요소들 (3, 4, 5, ... 번호)
				},
			success:function(result){
				alert("선택한 상품 삭제에 성공하였습니다.");
				location.reload(); // = url재요청
			}, 
			error:function(){
				alert("선택한 상품 삭제에 실패하였습니다.");
			}
		})
    }
	
    $(function(){
	    // 전체체크 클릭 후 하나라도 체크 해제하면 전체체크도 해제되는 함수
	    $("input[name='check']").change(function(){ 
		// .check-review에 change이벤트가 발생했을 때 실행
		//	** document ready function은 문서의 요소가 '다 만들어지자마자' 실행되므로, 이 시점에 모든 checkbox는 체크되지 않은 상태
		// 		=> 따라서, 각 checkbox에 변화가 생길 때(change이벤트 발생할 때)마다 조건검사 해주어야 제대로 작동
			$("input[name='check']").each(function(){
				if(!$(this).prop('checked')){
					$("#check-all").prop('checked', false);
				}
			})
		})
    })
    
    
    // #checkout_btn 클릭하면 체크된 상품만 결제창에 넘기도록 체크 여부 검사, 체크된 Cart객체만을 ArrayList에 넣는 함수
    function orderChecked(){
    	var orderProCode = "";
    	$("input[name=check]:checked").each(function(){
    		orderProCode += $(this).val() + ","
    	})
    	orderProCode = orderProCode.substring(0, orderProCode.lastIndexOf(","));
    	$("input[name=orderProCode]").val( orderProCode );
    }
    
    
  </script>

  <!-- ============ End Script Area ==============-->


</body>

</html>
    