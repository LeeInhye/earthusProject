<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	page import="com.us.product.model.vo.Product"
%>
<%
	Product p = (Product)session.getAttribute("p");
	StringBuilder sbPrice = new StringBuilder(p.getPrice());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= p.getProName() %> - Earth.Us</title>

<style>
    .hide {display:none;}
    .show {display:table-row;}
    .green {
    	background:#778C79;
    }
    .input-number {
		border:none;
		text-align:center;
	}
	.btn_2 {
		background : #778C79 !important;
		color:#f2f2f2 !important;
	}
	.fa fa-heart-o {
		font-size:large;
	}
	
	// 상품 문의 답변상태 - 답변대기중
	.waiting {
		font-weight:bold;
		/*color:#778C79;*/
		color:#a8bfaa;
	}
	
	// 상품 문의 답변상태 - 답변완료
	.completion {
		font-weight:bold;
	}
</style>

</head>
<body>

<%@ include file="/views/common/menubar.jsp" %>
<!-- font awesome -->
<script src="https://use.fontawesome.com/e3cb36acfb.js"></script>
<!-- swiper CSS -->
 <link rel="stylesheet" href="<%= contextPath %>/resources/css/u_css_sumin/price_rangs.css">
 
 <!--================상품 상세 조회 영역=================-->
  <div class="product_image_area section_padding">
    <div class="container">
      <div class="row s_product_inner justify-content-center">
      
      <!------ 썸네일 영역 (좌측) ------->
        <div class="col-lg-6 col-xl-6 "> 
          <div class="product_slider_img">
            <div id="vertical">
              <div data-thumb="<%= contextPath %>/<%= p.getProImgPath() %>">
                <img src="<%= contextPath %>/<%= p.getProImgPath() %>" />
              </div>
            </div>
          </div>
        </div>
      <!------ 썸네일 영역 끝 ------>
      
      <!------ 상품 설명란 (우측) ------>
        <div class="col-lg-6 col-xl-4">
          <div class="s_product_text">
            <h3><%= p.getProName() %></h3>
            <h5 style="color:rgb(119,140,121)">원</h5>
            <ul class="list">
              <li>
                <hr>
                <span><%= p.getProInfo() %></span>
                <br><br>
                <span>배송비</span><span style="float:right">+3,000원</span><br><br>
                
                <!----- 수량 변경 버튼 ----->
                <div class="product_count" style="width:35%;">
                  <span class="inumber-decrement"> <i class="ti-minus"></i></span>
                  <input class="input-number" type="type" value="1" min="0" max="10" style="border:none; text-align:center;">
                  <span class="number-increment"> <i class="ti-plus"></i></span>
                  <script></script>
                </div>
                <br>
                <script>
                	$(function(){
                		price();
                		amount();
                		
                		function price(){ // 상품 1개당 가격, 천단위 콤마 찍기
	               			var num = <%= Integer.parseInt(p.getPrice()) %>;
	               			
	               			$('.s_product_text>h5').text( num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '원' );
	                		}
                		
                		/*function amount(){ // 작동 x 
                			
	                		var amount = $(".input-number").val();
	             			// '-' 클릭 시 수량 - 1
	             			$('.inumber-decrement').click(function(){
	             				$(this).siblings('input').val() = 1 + amount;
	             			}
	             			// '+' 클릭 시 수량 + 1
	             			$('.number-increment').click(function(){
	             				$(this).siblings('input').val() = 1 - amount;
	             			})
                		}
                		*/
                		
                	})
                </script>
                <!----- 수량 변경 버튼 끝 ----->
                
                <span>최종 금액</span><span style="float:right"><%= sbPrice.reverse() %>원</span>
                <br><br>
              </li>
            </ul>
            
            <!------- 바로결제/장바구니/찜 시작 ------->
            <div class="card_area d-flex justify-content-between align-items-center">
              <a href="#" class="btn_3 font_bold_gray">바로결제</a>
              <a href="#" class="btn_3" style="background:#A8BFAA;" data-toggle="modal" data-target="#myModal">장바구니</a>
                
                <!------- 장바구니 Modal ------->
                <div class="modal" id="myModal">
                  <div class="modal-dialog">
                    <div class="modal-content">

                      <!-- Modal body -->
                      <div class="modal-body" style="text-align:center; padding:50px 0px; line-height:30px;">
                        상품이 장바구니에 담겼습니다.<br>
                        장바구니로 이동하시겠습니까?
                      </div>
                      
                      <!-- Modal footer -->
                      <div class="modal-footer" style="display:inline-block; text-align:center;">
                        <button type="button" class="btn btn_2" id="goToCart" data-dismiss="modal">확인</button>
                        <button type="button" class="btn btn_2" data-dismiss="modal">취소</button>
                      </div>
                      <script>
                        $(function(){ // 장바구니로 이동
                          $('#goToCart').click(function(){
							location.href = "#";
                          })
                        })
                      </script>
             		<!------- 장바구니 Modal 끝 ------->
             		
                    </div>
                  </div>
                </div>
                <!-- 장바구니 끝 -->

              <a href="#" class="like_us" onclick="likeUs();"><i class="fa fa-heart-o" style="font-size:large;"></i></a>
              <script>
                function likeUs(){
                  	if(logInUser != null){ // 로그인 한 회원만 찜 가능
                  		
                  		
                  		
                  	}else{
                  		alert("로그인된 회원만 이용 가능합니다.");
                  		location.href="<%=contextPath%>/views/member/goLogIn.jsp";
                  	}
                  	
                  // 상품이 위시리스트에 담겨 있지 않을 때
                    $('.like_us i').css('color',"#f2f2f2");
                    $('.like_us i').parent().css('background',"#778C79"); 

                  // 상품이 위시리스트에 이미 담겨 있을 때
                  // 위시리스트에 해당 상품 delete 후 스타일 원상복구
                  //   $('.like_us i').css('color', "");
                  //   $('.like_us i').parent().css('background', ""); 
                }
                  
              </script>
              <!--바로결제/장바구니/찜 끝-->
              
            </div>
          </div>
        </div>
        <!--썸네일 우측 상품 설명란 끝-->
        
      </div>
    </div>
  </div>
  <!--================End Single Product Area =================-->

  <!--================Product Description Area =================-->
  <section class="product_description_area">
    <div class="container">
      <hr><br>
      
      <!----- 상품 상세 조회 네비게이션 ----->
      <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
          <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home"
            aria-selected="true">상세정보</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
            aria-selected="false">필수표기정보</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact"
            aria-selected="false">상품 문의(상품문의수)</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review"
            aria-selected="false">리뷰(리뷰수)</a>
        </li>
      </ul>
      <!----- 상품 상세 조회 네비게이션 끝 ----->

      <!--상세정보-->
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
          <br><br>
          <h4>상세정보</h4>
          <br><hr><br>
          <p>
            <img src="<%= contextPath %>/<%= p.getProImgPath() %>">
          </p>
        </div>

        <!--필수표기정보-->
        <div class="tab-pane fade" role="tabpanel" id="profile" aria-labelledby="profile-tab">
          <div class="table-responsive">
            <br><br>
            <h4>필수표기정보</h4>
            <br><hr><br>
            <p>
              <img src="<%= contextPath %>/<%= p.getReqInfoImgPath() %>">
            </p>
          </div>
        </div>

        <!--상품 문의-->
        <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
          <div class="row">
            <table id="pro-qna-tb" width="80%" align="center">
              <thead>
                <tr>
                  <th width="5%" >No</th>
                  <th width="15%">상태</th>
                  <th width="50%">제목</th>
                  <th width="15%">작성자</th>
                  <th width="15%">작성일</th>
                </tr>
              </thead>
              <tbody>
                  <tr>
                    <td>1</td>
                    <td  id="waiting">답변대기중</td>
                    <td align="left" id="proQnaTitle">비밀글입니다.5 &nbsp;<i class="fa fa-lock" aria-hidden="true"></i></td>
                    <td>아무개</td>
                    <td>SYSDATE</td>
                  </tr>
                  <tr class="pro-qna-detail hide">
                    <td colspan="5">
                      <p>문의 내용2문의 내용2문의 내용2문의 내용2>문의 내용2문의 내용2문의 내용2문의 내용2</p>
                    </td>
                  </tr>


                  <tr data-toggle="collapse" data-target="#demo">
                    <td>2</td>
                    <td id="completion">답변완료</td>
                    <td align="left" id="proQnaTitle">비밀글입니다.4 &nbsp;<i class="fa fa-lock" aria-hidden="true"></i></td>
                    <td>아무개</td>
                    <td>SYSDATE</td>
                  </tr>
                  <tr class="pro-qna-detail">
                    <td colspan="5">
                      <div class="container">
                        <div id="demo" class="collapse">
                          <p>문의 내용2문의 내용2문의 내용2문의 내용2>문의 내용2문의 내용2문의 내용2문의 내용2</p>
                          <div class="pro-qna-a">
                         <p><b>관리자</b> &nbsp;&nbsp;2022-07-20</p>
                          안녕하세요. Earth.Us입니다 :) <br>
                          현재 구매하시는 고체 치약 200정은 2022년 7월 3일 제조로 유통기한은 제조일 기준 2년입니다. <br>
                          개봉하실 경우, 최대한 빨리 사용해주실 것을 권장합니다!
                          </div>
                        </div>
                      </div>

                    </td>

                  </tr>



                  <tr>
                    <td>3</td>
                    <td id="proQnaStatus">답변완료</td>
                    <td align="left" id="proQnaTitle">공개글입니다.3 &nbsp;</td>
                    <td>아무개</td>
                    <td>SYSDATE</td>
                  </tr>
                  <tr class="pro-qna-detail hide">
                    <td colspan="5">
                      <p>문의 내용2문의 내용2문의 내용2문의 내용2 <br>문의 내용2문의 내용2문의 내용2문의 내용2</p>
                      <div class="pro-qna-a">
                        <p><b>관리자</b> &nbsp;&nbsp;2022-07-20</p>
                        안녕하세요. Earth.Us입니다 :) <br>
                        현재 구매하시는 고체 치약 200정은 2022년 7월 3일 제조로 유통기한은 제조일 기준 2년입니다. <br>
                        개봉하실 경우, 최대한 빨리 사용해주실 것을 권장합니다!
                      </div>
                    </td>
                  </tr>

                  <tr>
                    <td>4</td>
                    <td id="proQnaStatus">답변완료</td>
                    <td align="left" id="proQnaTitle">비밀글입니다.2 &nbsp;<i class="fa fa-lock" aria-hidden="true"></i></td>
                    <td>아무개</td>
                    <td>SYSDATE</td>
                  </tr>
                  <tr class="pro-qna-detail hide">
                    <td colspan="5">
                      <p>문의 내용2문의 내용2문의 내용2문의 내용2 <br>문의 내용2문의 내용2문의 내용2문의 내용2</p>
                      <div class="pro-qna-a">
                        <p><b>관리자</b> &nbsp;&nbsp;2022-07-20</p>
                        안녕하세요. Earth.Us입니다 :) <br>
                        현재 구매하시는 고체 치약 200정은 2022년 7월 3일 제조로 유통기한은 제조일 기준 2년입니다. <br>
                        개봉하실 경우, 최대한 빨리 사용해주실 것을 권장합니다!
                      </div>
                    </td>
                  </tr>

                  <tr>
                    <td>5</td>
                    <td id="proQnaStatus">답변완료</td>
                    <td align="left" id="proQnaTitle">비밀글입니다.1 &nbsp;<i class="fa fa-lock" aria-hidden="true"></i></td>
                    <td>아무개</td>
                    <td>SYSDATE</td>
                  </tr>
                  <tr class="pro-qna-detail hide">
                    <td colspan="5">
                      <p>문의 내용2문의 내용2문의 내용2문의 내용2 <br>문의 내용2문의 내용2문의 내용2문의 내용2</p>
                      <div class="pro-qna-a">
                        <p><b>관리자</b> &nbsp;&nbsp;2022-07-20</p>
                        안녕하세요. Earth.Us입니다 :) <br>
                        현재 구매하시는 고체 치약 200정은 2022년 7월 3일 제조로 유통기한은 제조일 기준 2년입니다. <br>
                        개봉하실 경우, 최대한 빨리 사용해주실 것을 권장합니다!
                      </div>
                    </td>
                  </tr>

              </tbody>
            </table>
            <!-- 문의 테이블 끝 -->

            <script>
              const proQnaNo = '0000';

              $(function(){
                
                var qnaList = '#pro-qna-tb tr';
                $(qnaList).click(function(){ // 문의글 클릭했을 때

                  var qnaTitle = $(this).children('#proQnaTitle');
                  if( qnaTitle.children().hasClass('fa-lock') ){ // 비밀글일 경우 => 비밀번호 입력 받기
                    const checkNo = prompt('비밀번호를 입력하세요.', '숫자 네자리로 입력');

                    if(checkNo == proQnaNo){ // 번호 일치

                      $(this).parent().next("tr").removeClass('hide').addClass('show');
                      $(this).parent().next("tr").show();
                      qnaTitle.text("!!! 진짜 제목 !!!");
                      qnaTitle.removeClass('fa-lock').addClass('fa-unlock');

                    }else if(checkNo != proQnaNo){ // 번호 불일치
                      alert("비밀번호가 일치하지 않습니다.");
                    }

                  }else { // 비밀글이 아니거나, 비밀글 비번 풀려있는 경우
                    
                    if($(this).parent().next("tr").is('display','none')){ // 글 안 펼쳐져 있으면
                      $(this).removeClass('hide').addClass('show');
                      $(this).show();
                    }else{ // 펼쳐져 있으면
                      $(this).addClass('hide');
                      $(this).attr('display', 'none');
                    }
                  }

                })
                
              })
            </script>

            <!-- 페이징 처리 -->
            <div class="col-lg-12">
              <div class="pageination" style="position:relative">
                  <nav aria-label="Page navigation example">
                      <ul class="pagination justify-content-center" id="pro-qna-page" style="margin:10px;">
                          <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                                <i class="ti-angle-double-left"></i>
                            </a>
                          </li>
                          <li class="page-item"><a class="page-link" href="#">1</a></li>
                          <li class="page-item"><a class="page-link" href="#">2</a></li>
                          <li class="page-item"><a class="page-link" href="#">3</a></li>
                          <li class="page-item"><a class="page-link" href="#">4</a></li>
                          <li class="page-item"><a class="page-link" href="#">5</a></li>
                          <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <i class="ti-angle-double-right"></i>
                            </a>
                          </li>
                          <li><a href="product_qna_form.html" class="btn-submit" id="z2"
                            style="display:inline-block; text-align:right;">상품 문의하기</a></li>
                            <!--상품 문의 작성 버튼-->
                          
                      </ul>
                  </nav>
              </div>
            </div>
            <!-- 페이징 처리 끝 -->
          </div>
        </div>

        <!--리뷰 영역-->
        <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
          <div class="row">
            <div class="col-lg-6">
              <!--별점 통계 시작-->
              <div class="row total_rate">
                <div class="col-6">
                  <div class="box_total">
                    <h5>총점</h5>
                    <h4>4.9</h4>
                    <h6>리뷰(5건)</h6>
                  </div>
                </div>
                <div class="col-6" style="position:relative">
                  <div class="rating_list">
                    <ul class="list" style="position:absolute;">
                      <li>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i> 04
                      </li>
                      <li>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star-o"></i> 01
                      </li>
                      <li>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star-o"></i>
                          <i class="fa fa-star-o"></i> 00
                      </li>
                      <li>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star-o"></i>
                          <i class="fa fa-star-o"></i>
                          <i class="fa fa-star-o"></i> 00
                      </li>
                      <li>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star-o"></i>
                          <i class="fa fa-star-o"></i>
                          <i class="fa fa-star-o"></i>
                          <i class="fa fa-star-o"></i> 00
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
              <!--별점 통계 끝-->

              <!--리뷰 리스트 시작-->
              <hr>
              <div class="review_list">
                <div class="review_item">
                  <div class="media">
                    <div class="media-body">
                      <p><b>아무*</b> &nbsp;&nbsp;&nbsp;&nbsp; 2022-07-20</p>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                    </div>
                  </div>
                  <p>
                    리뷰내용1리뷰내용1리뷰내용1리뷰내용1리뷰내용1리뷰내용1
                  </p>
                </div>
                <div id="rev-img">
                  <img src="img/product/single-product/review-1.png" alt=""/>
                  <p>더보기 <i class="fa fa-sort-desc" aria-hidden="true"></i></p>
                </div>
                <hr>

                <div class="review_item">
                  <div class="media">
                    <div class="media-body">
                      <p><b>아무*</b> &nbsp;&nbsp;&nbsp;&nbsp; 2022-07-20</p>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                    </div>
                  </div>
                  <p>
                    리뷰내용2리뷰내용2리뷰내용2리뷰내용2리뷰내용2리뷰내용2리뷰내용2
                  </p>
                </div>
                <div id="rev-img">
                  <img src="img/product/single-product/review-1.png" alt=""/>
                  <p>더보기 <i class="fa fa-sort-desc" aria-hidden="true"></i></p>
                </div>
                <hr>
                
                <div class="review_item">
                  <div class="media">
                    <div class="media-body">
                      <p><b>아무*</b> &nbsp;&nbsp;&nbsp;&nbsp; 2022-07-20</p>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star-o"></i>
                    </div>
                  </div>
                  <p>
                    리뷰내용3리뷰내용3리뷰내용3리뷰내용3리뷰내용3리뷰내용3리뷰내용3
                  </p>
                </div>
                <div id="rev-img">
                  <img src="img/product/single-product/review-1.png" alt=""/>
                  <p>더보기 <i class="fa fa-sort-desc" aria-hidden="true"></i></p>
                </div>
                <hr>

              </div>
            </div>
            <!--리뷰 리스트 끝-->

            <!--리뷰 작성하기-->
            <div class="col-lg-6">
              <div class="review_box">
                <h4>리뷰 작성하기</h4>
                <p>당신의 별점은 : </p>
                <ul class="list">
                  <li>
                      <i class="fa fa-star star-count"></i>
                  </li>
                  <li>
                      <i class="fa fa-star star-count"></i>
                  </li>
                  <li>
                      <i class="fa fa-star star-count"></i>
                  </li>
                  <li>
                      <i class="fa fa-star star-count"></i>
                  </li>
                  <li>
                      <i class="fa fa-star star-count"></i>
                  </li>
                </ul>
                <form class="row contact_form" action="contact_process.php" method="post" novalidate="novalidate">
                  <div class="col-md-12">
                    <div class="form-group">
                      <textarea class="form-control" name="message" rows="10" cols="200" placeholder="상품에 대한 리뷰를 작성해 주세요. (최소 20자 이상)" style="resize:none;"></textarea>
                    </div>
                  </div>
                  <div class="col-md-12 text-right">
                    <!-- <a href="" class="btn_3">상품 사진 첨부</a> -->
                    <label for="revImg" class="btn_3" style="margin:0px 10px;">상품 사진 첨부</label>
                    <input type="file" name="revImg" id="revImg" style="display:none;">
                    <button type="submit" value="submit" class="btn_3">
                      제출하기
                    </button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--================ 상품 상세 조회 끝 =================-->
		
<%@ include file="/views/common/footerbar.jsp" %>
</body>
</html>