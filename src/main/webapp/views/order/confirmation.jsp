<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/menubar.jsp" %>
    
<!DOCTYPE html>
<html lang="zxx">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>confirmation</title>
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

  <!-- 지우면 절대 안돼!!!!!! -->
  <style>
    .btn-conf{
      width:150px;
      height:40px;
      border-radius: 5px;
      font-weight: bold;
      font-size: 15px;
      background-color: #A8BFAA;
      color: #F2F2F2;
      border:none;
    }
    .btn-conf:hover{
      color:black;
      transition: 500ms;
    }
  </style>
  <!-- 제발 지우지 말기!!!!!!! -->

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
              <h2>결제 확인</h2>
              <p>Home <span>-</span> Order Confirmation</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- breadcrumb start-->

  <!--================ confirmation part start =================-->

  <%-- <% if(결제성공) %> --%>
  <section class="confirmation_part padding_top">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="confirmation_tittle">
            <span style="color:black; font-weight: bold; font-size:30px">성공적으로 결제되었습니다!</span>
            <br>
            <span style="color:#778C79">배송은 평균 공휴일 제외 2~3일 이내에 시작됩니다.
              <br>(택배사 사정에 따라 달라질 수 있습니다.)</span>
          </div>
        </div>
        <div class="col-lg-6 col-lx-4" align="center" style="margin:auto;">
          <div class="single_confirmation_details" style="background-color:#F2F2F2 ;">
            <h4 style="font-weight: bold;">주문 정보</h4>
            <table>
              <tr>
                <td width="100px;">주문 번호 </td>
                <td>12340567</td>
              </tr>
              <tr>
                <td>주문 일시 </td>
                <td>2022-07-26 11:08</td>
              </tr>
            </table>
            <br>
         	<button type="button" class="btn-conf">고객센터</button>
         	&nbsp;&nbsp;
         	<button teyp="button" class="btn-conf" style="background-color:#778C79;">마이 페이지</button>
          </div>
        </div>
    </div>
  </section>

  <%-- <% }else { %> --%>
    <section class="confirmation_part padding_top">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="confirmation_tittle">
              <span style="color:black; font-weight: bold; font-size:30px">결제에 실패하였습니다.</span>
              <br>
              <span style="color:#778C79">주문 처리에 실패하여 결제를 완료하지 못했습니다.
                <br>재시도에도 계속해서 오류가 발생하는 경우 고객센터로 문의 바랍니다.</span>
            </div>
          </div>
          <div class="col-lg-6 col-lx-4" align="center" style="margin:auto;">
            <button type="button" class="btn-conf">장바구니로</button>
            &nbsp;&nbsp;
            <button type="button" class="btn-conf" style="background-color:#778C79;">홈으로 돌아가기</button>
          </div>
      </div>
    </section>
    <br><br>
  <%-- <% } %> --%>
  <!--================ confirmation part end =================-->

  <!--::footer_part start::-->
  <%@ include file="../common/footerbar.jsp" %>
  <!--::footer_part end::-->

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
