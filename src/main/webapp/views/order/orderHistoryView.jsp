<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                  <tr>
                    <td style="display:block">
                      <a href="">
                        <div class="media">
                          <div class="d-flex">
                            <img src="img/product/single-product/cart-1.jpg" alt="" />
                          </div>
                          <div class="media-body">
                            <h5>고체치약 외 3건</h5>
                          </div>
                        </div>
                      </a>
                    </td>
                    <td>
                      <h5>2022.07.07</h5>
                    </td>
                    <td>
                      <div class="product_count">
                        <h5><a href="" style="color:black;">22070711</a></h5>
                      </div>
                    </td>
                    <td>
                      <h5>23,000</h5>
                    </td>
                    <td>
                      <h5>상품준비중</h5>
                    </td>
                  </tr>
                  
                </tbody>
              </table>
              
            </div>
          </div>
      </section>
		<br><br><br><br><br><br><br><br><br><br>
	<%@ include file="../common/footerbar.jsp" %>
</body>
</html>