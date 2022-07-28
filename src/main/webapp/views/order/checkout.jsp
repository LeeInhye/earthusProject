<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/menubar.jsp" %>
    
<!DOCTYPE html>
<html lang="zxx">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>checkout</title>
  <link rel="icon" href="img/favicon.png">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <!-- animate CSS -->
  <link rel="stylesheet" href="css/animate.css">
  <!-- owl carousel CSS -->
  <link rel="stylesheet" href="css/owl.carousel.min.css">
  <!-- nice select CSS -->
  <link rel="stylesheet" href="css/nice-select.css">
  <!-- font awesome CSS -->
  <link rel="stylesheet" href="css/all.css">
  <!-- flaticon CSS -->
  <link rel="stylesheet" href="css/flaticon.css">
  <link rel="stylesheet" href="css/themify-icons.css">
  <!-- font awesome CSS -->
  <link rel="stylesheet" href="css/magnific-popup.css">
  <!-- swiper CSS -->
  <link rel="stylesheet" href="css/slick.css">
  <link rel="stylesheet" href="css/price_rangs.css">
  <!-- style CSS -->
  <link rel="stylesheet" href="css/style.css">
  
  <!-- jQuery CDN -->
  <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

  <!-- ********** 내가 만든 스타일!!! 지우면 안돼!!! ********** -->
  <style>
    #product-info{
      width:100%;
      border: 1px solid gainsboro;
      border-collapse: separate;
      border-radius: 15px;

    }
    .btn{
      border-radius: 30px;
      font-weight: bold;
      background-color: #A8BFAA;
      color: #F2F2F2;
    }
    .order_box{
      background-color: #F2F2F2;
      border-radius: 15px;
    }
    .shipping-memo, .shipping-memo *{
      width:100%;
    }
  </style>
  <!-- ********** 내가 만든 스타일!!! 지우면 안돼!!! ********** -->

</head>

<body>

  <!--================Home Banner Area =================-->
  <!-- breadcrumb start-->
  <section class="breadcrumb breadcrumb_bg">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8">
          <div class="breadcrumb_iner">
            <div class="breadcrumb_iner_item">
              <h2>주문하기</h2>
              <p>Home <span>-</span> Order</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- breadcrumb start-->


  <!--================Checkout Area =================-->
  <section class="checkout_area padding_top">
    <div class="container">
      <form class="billing_details">
        <div class="row">
          <div class="col-lg-8">
            <h3 style="padding:0px; margin-bottom:15px; font-weight: bold;">주문 상품 정보</h3>
      
            <table id="product-info">
              <tbody>
                <tr>
                  <td rowspan="3" width="30%">
                      <img src="img/product/single-product/cart-1.jpg" style="border-radius:15px;">
                  </td>
                  <td colspan="3" height="10px" style="font-size: large;">상품명</td>
                </tr>
                <tr>
                  <td colspan="3" height="10px" style="color: lightslategrey; font-size:small">개수</td>
                </tr>
                <tr>
                  <td colspan="3" height="10px" style="font-weight:bold">가격</td>
                </tr>
              </tbody>
            </table>

            <br><br><br>

            <h3 style="padding:0px; margin-bottom:15px; font-weight: bold;">주문자 정보</h3>
            <div class="same-as-user">
              <input type="checkbox" name="same-as-user" />
              <span>주문자 정보와 동일</span>
            </div>
                        
              <div class="col-md-12 form-group p_star">
                <input type="text" class="form-control" name="name" placeholder="이름 입력 *" required>
              </div>
              <div class="col-md-12 form-group p_star">
                <input type="phone" class="form-control" id="last" name="phone" placeholder="휴대폰 번호 입력 *" required>
                <!-- 정규표현식으로 올바른 휴대폰 번호 형식 지정 (010으로 시작, 11자리 숫자만) -->
              </div>
              <div class="col-md-12 form-group">
                <input type="text" class="form-control" id="company" name="email" placeholder="이메일 입력">
                <!-- 정규표현식으로 올바른 이메일 형식 지정 -->
              </div>
              <br>
              <h3  style="padding:0px; margin-bottom:15px; font-weight: bold;">배송 정보</h3>
              <div class="col-md-6 form-group ">
                <button type="button" class="form-control" style="border-radius:5px;" onclick="execDaumPostCode();">우편번호 찾기</button>
              </div>
              <div class="col-md-6 form-group p_star">
                <input type="text" class="form-control" id="postCode" name="postCode" placeholder="우편번호 *" required>
              </div>
              <div class="col-md-12 form-group ">
                <input type="text" class="form-control" id="roadAddr" name="roadAddr" placeholder="도로명 주소 *"  required>
              </div>
              <div class="col-md-12 form-group p_star">
                <input type="text" class="form-control" id="detailAddr" name="detailAddr" placeholder="상세 주소 *" required>
              </div>
              <div class="col-md-12 form-group">
                <select class="form-control shipping-memo" name="shippinMemo">
                  <option>배송 메모를 선택해주세요.</option>
                  <option value="1">경비실에 맡겨주세요.</option>
                  <option value="2">현관문 앞에 놓아주세요.</option>
                  <option value="3">배송 전에 미리 연락 바랍니다.</option>
                </select>
              </div>
            </div>

            <div class="col-lg-4">
              <div class="order_box">
                <h2 style="font-weight:bold;">주문서</h2>
                <ul class="list">
                  <li>
                    <a href="#">상품
                      <span>합계</span>
                    </a>
                  </li>
                  <li>
                    <a href="#">상품명
                      <span class="last">총액</span>
                    </a>
                  </li>
                  <li>
                    <a href="#">Fresh Tomatoes
                      <span class="last">$720.00</span>
                    </a>
                  </li>
                  <li>
                    <a href="#">Fresh Brocoli
                      <span class="last">$720.00</span>
                    </a>
                  </li>
                </ul>
                <ul class="list list_2">
                  <li>
                    <a href="#">상품 총 금액
                      <span>$2160.00</span>
                    </a>
                  </li>
                  <li>
                    <a href="#">배송비
                      <span>$50.00</span>
                    </a>
                  </li>
                  <li>
                    <a href="#">포인트사용
                      <span>$27.00</span>
                    </a>
                  </li>
                  <li>
                    <a href="#">총합
                      <span>$2210.00</span>
                    </a>
                  </li>
                </ul>
                <div class="payment_item">
                  <div class="radion_btn">
                    <input type="radio" id="f-option5" name="selector" />
                    <label for="f-option5">무통장 입금</label>
                    <div class="check"></div>
                  </div>
                </div>
                <div class="payment_item active">
                  <div class="radion_btn">
                    <input type="radio" id="f-option6" name="selector" checked="checked" />
                    <label for="f-option6">카드 결제</label>
                    <div class="check"></div>
                  </div>
                </div>
                <div class="creat_account">
                  <input type="checkbox" id="f-option4" name="selector" required/>
                  <a href="#" style="color:#778C79;">이용 약관*</a>
                  <label for="f-option4" style="padding:0px;">을 읽고 확인하였으며 동의합니다.</label>
                </div>
                <a class="btn" href="#" align="right">결제 진행하기</a>
              </div>
            </div>
          </div>
       </form>
     </div>
   </div>
  </section>

  <br><br><br><br><br><br><br><br><br>
  <!--================End Checkout Area =================-->
  
  <!-- =============== Footer Bar Area =============== -->
  <%@ include file="../common/footerbar.jsp" %>

  <!-- ========== Start Script Area ========== -->
  
  <!-- Daum Post Code API -->
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
    function execDaumPostCode(){
      new daum.Postcode({
        oncomplete: function(data){
          
          console.log(data);

          var roadAddr = ''; // 도로명주소

          if(data.userSelectedType === 'R'){
            roadAddr = data.roadAddress;
          }else{
            roadAddr = data.roadAddress;
          }


          $("#postCode").val(data.zonecode);
          $("#roadAddr").val(roadAddr);
          
        }
      }).open({autoClose:true});


    }
    
  </script>



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