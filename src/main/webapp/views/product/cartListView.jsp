<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.us.product.model.vo.Cart, java.util.ArrayList" %>
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
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
                <th scope="col" style="width:50px;"> <input type="checkbox" id="check-all" onclick="checkAll();"></th>
                <th scope="col">상품</th>
                <th scope="col">가격</th>
                <th scope="col">수량</th>
                <th scope="col">총 금액</th>
              </tr>
            </thead>

            <tbody>
            	<% for(Cart c : list) { %>
	                <tr class="product" class="check-item">
	                  <td><input type="checkbox" name="check"></td>
	                  <td>
	                    <div class="media">
	                      <div class="d-flex">
	                        <img src="img/product/single-product/cart-1.jpg">
	                      </div>
	                      <div class="media-body">
	                        <p><%= c.getProName() %></p>
	                      </div>
	                    </div>
	                  </td>
	                  <td>
	                    <h5><%= c.getPrice() %>원</h5>
	                  </td>
	                  <td>
	                    <div class="product_count">
	                      <span class="input-number-decrement"> <i class="ti-angle-down"></i></span>
	                      <input class="input-number" type="text" value="<%= c.getProQty() %>">
	                    <span class="input-number-increment"> <i class="ti-angle-up"></i></span>
	                  </div>
	                </td>
	                <td>
	                  <h5><%= c.getPrice() * c.getProQty() %>원</h5>
	                </td>
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
                <td>xxxx원</td>
              </tr>
              <tr>
                <td colspan="4">배송비</td>
                <td>xxxx원</td>
              </tr>
              <tr style="font-size:20px;">
                <td colspan="4">총 주문 금액</td>
                <td>xxxx원</td>
              </tr>
            </tfoot>
          </table>
          <div class="checkout_btn_inner float-right">
            <a class="btn" href="<%=contextPath%>">계속 쇼핑하기</a>
            <a class="btn" id="checkout_btn" href="<%=contextPath%>/order.ct">주문하기</a>
          </div>
        </div>
      </div>
     </div>
  </section>
  
  <br><br><br><br><br><br><br><br><br>
  
  <!--================End Cart Area =================-->


  <!-- ============ Start Script Area ==============-->

  <script>

    $(function(){
      // 수량 증가 버튼 클릭 시 함수
      $(".input-number-increment").click(function(){
        if( Number($(".input-number").val()) < 10 ){
          $(".input-number").val( Number($(".input-number").val()) + 1 )
        }
      })

      // 수량 감소 버튼 클릭 시 함수
      $(".input-number-decrement").click(function(){
        if( Number($(".input-number").val()) > 1 ){
          $(".input-number").val( Number($(".input-number").val()) - 1 )
        }
      })

      // 1~10 이외의 값 입력 시 val()을 1로 바꾸는 함수
      $(".input-number").change(function(){
        if( !/[0-9]/.test($(".input-number").val()) || !/10/.test($(".input-number").val()) ){
          $(".input-number").val("1");
        }
      })
    })

    function checkAll(){
      if( $("#check-all").is(':checked') ){
        $("input[name='check']").prop('checked', true);
      }else {
        $("input[name='check']").prop('checked', false)
      }
    }

    function deleteChecked(){
      $("input[name='check']:checked").each(function(){
        $(this).parent().parent().remove();
      })
    }

    $(function(){
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
  </script>

  <!-- ============ End Script Area ==============-->



  <!-- jquery plugins here-->
  <!-- jquery -->
  <script src="js/jquery-1.12.1.min.js"></script>
  <!-- popper js -->
  <script src="js/popper.min.js"></script>
  <!-- bootstrap js -->
  <script src="js/bootstrap.min.js"></script>
  <!-- easing js -->
  <script src="js/jquery.magnific-popup.js"></script>
  <!-- swiper js -->
  <script src="js/swiper.min.js"></script>
  <!-- swiper js -->
  <script src="js/masonry.pkgd.js"></script>
  <!-- particles js -->
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.nice-select.min.js"></script>
  <!-- slick js -->
  <script src="js/slick.min.js"></script>
  <script src="js/jquery.counterup.min.js"></script>
  <script src="js/waypoints.min.js"></script>
  <script src="js/contact.js"></script>
  <script src="js/jquery.ajaxchimp.min.js"></script>
  <script src="js/jquery.form.js"></script>
  <script src="js/jquery.validate.min.js"></script>
  <script src="js/mail-script.js"></script>
  <script src="js/stellar.js"></script>
  <script src="js/price_rangs.js"></script>
  <!-- custom js -->
  <script src="js/custom.js"></script>
</body>

</html>
    