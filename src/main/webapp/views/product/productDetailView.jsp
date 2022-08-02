<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	page import="java.util.ArrayList, com.us.product.model.vo.Product, com.us.common.model.vo.PageInfo,
				 com.us.product.model.vo.ProQna"
%>
<%
	Product p = (Product)session.getAttribute("p");
	ArrayList<ProQna> qlist = (ArrayList<ProQna>)session.getAttribute("list");
	int qnaCount = 0; // 상품 문의 게시글 수를 담을 변수
	for(int i=0; i<qlist.size(); i++){
		qnaCount++;
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= p.getProName() %> - Earth.Us</title>

<style>
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
		font-weight:bold !important;
		/*color:#778C79;*/
		color:#a8bfaa !important;
	}
	
	// 상품 문의 답변상태 - 답변완료
	.completion {
		font-weight:bold;
	}
	
	.section_padding {
    padding-top: 200px !important;
	}

	.pro_qna_answer .on {
		display:block;
	}
	
	<!-- 리뷰 영역 스타일 -->
	#rate-star{
	  display:inline-block;
	  border:0px;
	  padding-left:10px;
	}
	#rate-star input[type=radio]{
	  display:none;
	}
	.review-rate{
	  color:#fbd600;
	}
	#profile p {
		text-align:center;
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
  <div class="product_image_area section_padding" style="padding-top:250px;">
    <div class="container">
      <div class="row s_product_inner justify-content-center">
      
      <!------ 썸네일 영역 (좌측) ------->
        <div class="col-lg-6 col-xl-4 "> 
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
            <h5 style="color:rgb(119,140,121)"></h5>
            <ul class="list">
              <li>
                <hr>
                <span><%= p.getProInfo() %></span>
                <br><br>
                <span>배송비</span><span style="float:right">+3,000원</span><br><br>
                
                <!----- 수량 변경 버튼 ----->
                <div class="product_count" style="width:35%;">
                  <span class="inumber-decrement" id="minus" onclick="amount('m');" style="cursor:pointer"> <i class="ti-minus"></i></span>
                  <input class="input-number" id="qty" type="number" value="1" min="0" max="10" style="border:none; text-align:center;" readonly>
                  <span class="number-increment" id="pluse" onclick="amount('p');" style="cursor:pointer"> <i class="ti-plus"></i></span>
                  <script></script>
                </div>
                <br>
                <span>최종 금액</span><span id="finPrice" style="float:right"></span>
                <br><br>
              </li>
            </ul>
                <script>
               		price();
                		
               		function amount(t){ // 상품 선택 수량 변경 (동작!!!)
               			
               				
                		var min_qty = 1;
               			var this_qty = $("#qty").val() * 1;
               			var max_qty = <%=p.getStock()%>;
               			
               			if(t == 'm'){ // 마이너스 아이콘 선택 시
               				this_qty -= 1;
               				if(this_qty < min_qty){
               					alert("수량은 1개 이상 입력해 주십시오.");
               					return;
               				}
               			}else if(t == 'p') { // 플러스 아이콘 선택 시
               				this_qty += 1;
               				if(this_qty > max_qty){
               					this_qty = max_qty;
               					return;
               				}
               			}
               			
               			$('#qty').val(this_qty);
               			
               			
               			var num = <%= Integer.parseInt(p.getPrice()) %>; // 상품 개당 가격
               			var finNum = num * this_qty + 3000; // 총 가격
               			
               			$('.s_product_text>h5').text( num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '원' );
               			$('#finPrice').text( finNum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '원' );
               			
               			
               		}
                			
                			
               		function price(){ // 상품 가격, 천단위 콤마 찍기
               			
               			var num = <%= Integer.parseInt(p.getPrice()) %>; // 상품 개당 가격
               			var amount = $('#qty').val(); // 상품 선택 개수
               			var finNum = num * amount + 3000; // 총 가격
               			
               			$('.s_product_text>h5').text( num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '원' );
               			$('#finPrice').text( finNum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '원' );
	                		
               				
               		}
                </script>
                <!----- 수량 변경 버튼 끝 ----->
                
            
            <!------- 바로결제/장바구니/찜 시작 ------->
            <div class="card_area d-flex justify-content-between align-items-center">
              <a href="<%=contextPath%>/order/orderHistoryView.jsp" class="btn_3 font_bold_gray">바로결제</a>
              <a href="#" class="btn_3" style="background:#A8BFAA;" data-toggle="modal" data-target="#myModal1">장바구니</a>
                <script>
                	function cart(){
                      	
                      	
                    }
                </script>
                <!------- 장바구니 이동 확인 Modal ------->
                <div class="modal" id="myModal1">
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
                   </div>
          		</div>
        	</div>
                <script>
                  $(function(){ // 장바구니로 이동
                    $('#goToCart').click(function(){
						location.href = "#";
                    })
                  })
                </script>
                      
               <!------- 장바구니 담기 실패 Modal ------->
                <div class="modal" id="addCartModal2">
                  <div class="modal-dialog">
                    <div class="modal-content">

                      <!-- Modal body -->
                      <div class="modal-body" style="text-align:center; padding:50px 0px; line-height:30px;">
                        로그인된 회원만 이용 가능합니다.
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
                <!------- 장바구니 끝 ------->

			  <!------------- 찜 버튼 시작 -------------->
              <a href="#" class="like_us" onclick="likeUs();"><i class="fa fa-heart-o" style="font-size:large;"></i></a>
              <script>
                function likeUs(){
                  	if(<%=loginUser%> != null){ // 로그인 한 회원만 찜 가능
                  		
                  // 상품이 위시리스트에 담겨 있지 않을 때
                    $('.like_us i').css('color',"#f2f2f2");
                    $('.like_us i').parent().css('background',"#778C79"); 

                  // 상품이 위시리스트에 이미 담겨 있을 때
                  // 위시리스트에 해당 상품 delete 후 스타일 원상복구
                  //   $('.like_us i').css('color', "");
                  //   $('.like_us i').parent().css('background', ""); 
                  		
                  	}else{
                  		alert("로그인된 회원만 이용 가능합니다.");
                  		location.href="<%=contextPath%>/views/member/goLogin.jsp";
                  	}
                  	
                }
                  
              </script>
              <!------------- 찜 버튼 끝 -------------->
              <!--바로결제/장바구니/찜 끝-->
              
            
        <!--썸네일 우측 상품 설명란 끝-->
        
      </div>
    </div>
  </div>
  <!--================End Single Product Area =================-->

  <!--================Product Description Area =================-->
  <section class="product_description_area" style="width:100%">
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
            aria-selected="false">상품 문의(<%=qnaCount%>)</a>
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

        <!-- 상품 문의 -->
        <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
          <div class="row">
          	<div id="pro-qna-area">
          		<div id="pro-qna-head">
          			<ul>
          				<li class="col1">No</li>
          				<li class="col2">상태</li>
          				<li class="col3">제목</li>
          				<li class="col4">작성자</li>
          				<li class="col5">작성일</li>
          			</ul>
          		</div>
          		<div id="pro-qna-body"> 
          		
          		<!-- 문의글 있을 때 -->
          		<% if(!qlist.isEmpty()) {%>
          		<% for(ProQna q : qlist) { %>
          			<!-- 목록 -->
          			<ul class="pro-qna-question">
          				<li class="col1"><%=q.getProQnaNo()%></li>
          				
          				<!-- 답변 미등록 상태면 -->
          				<% if(q.getProAEnrollDate() == null) { %> 
          				<li class="col2 waiting">답변대기중</li>
          				<% }else { %>
          				<li class="col2 completion">답변완료</li>
          				<% } %>
          				
          				<!-- 비밀글이면 -->
          				<% if(q.getProQnaPwd() != null) { %> 
          				<li class="col3">
          					비밀글입니다. &nbsp;					 
          					<i class="fa fa-lock"></i>
          					<input type="hidden" name="proQnaPwd" value="<%=q.getProQnaPwd()%>">
          				</li>
          				<input type="hidden" name="proQnaTitle" value="<%=q.getProQnaTitle()%>" >
          				
          				<% } else {%>  <!-- 공개글이면 -->	
          				<li class="col3">
          					<%=q.getProQnaTitle()%> &nbsp;
          				</li>
          				<% } %>	
          				
          				<li class="col4"><%=q.getProQnaWriterName()%></li>
          				<li class="col5"><%=q.getProQEnrollDate()%></li>
          			</ul>
          			<!-- 목록 -->
          			
          			<!-- 답변 -->
	          		<div class="pro-qna-answer">
	          			<p><%= q.getProQnaContent() %></p>
          			<% if(q.getProAEnrollDate() != null) { %> <!-- 답변 등록 상태면 -->
	          			<div class="pro-answer">
	          				<p><b>관리자</b>&nbsp;&nbsp;<%=q.getProAEnrollDate()%></p> 
	          				<%=q.getProAcontent()%>
	          			</div>
	          		<% } %>
	          		</div>
	          		<!-- 답변 -->
	          	<% } %>
	          	<!-- 반복문 끝 -->
	          	
	          	<!-- 문의 글 없을 때 -->
	          	<% } else { %> 
	          		<ul class="pro-qna-question">
          				<li colspan="5" style="width:100%; text-align:center;">등록되어 있는 상품 문의가 없습니다. 상품 문의를 등록해 주세요.</li>
          			</ul>
          		<% } %>
          		</div>
          	<hr>
          	</div>
            
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
                          <li><a href="<%=contextPath%>/insertForm.pq?code=<%=p.getProCode()%>&name=<%=p.getProName()%>" class="btn-submit" id="z2"
                            style="display:inline-block; text-align:right;">상품 문의하기</a></li>
                      </ul>
                  </nav>
              </div>
            </div>
            <!-- 페이징 처리 끝 -->
          </div>
       </div>

       <script>
         
           // ========================= 문의글 클릭 이벤트 ======================
           $('.pro-qna-question').click(function(){ // 문의글 클릭했을 때

             var title = $(this).children('.col3'); // 문의글 제목
             
             if( title.children(0).hasClass('fa-lock') ){ // 비밀글일 경우 => 비밀번호 입력 받기
           	  
	             const check = prompt('비밀번호를 입력하세요.', '숫자 네자리로 입력');
	             var proQnaPwd = $(this).find('input[name=proQnaPwd]').val(); // 해당 문의글의 비밀번호
	
	             	if(check == null){ // 입력값이 없을 때
	             		 return;
	             	}else if(check == proQnaPwd){ // 입력값이 있을 때 번호 일치
	
		                 title.removeClass('fa-lock');
		                 title.text( $(this).find('input[name=proQnaTitle]').val() );
		                 
		                 $(this).next(".pro-qna-answer").stop().slideToggle(300);
		                 $(this).next("pro-qna-answer").siblings("pro-qna-answer").slideUp(300);
					 
	               } else { // 입력값이 있을 때 번호 불일치
	                 	 alert("비밀번호가 일치하지 않습니다.");
	               	 	 return;
	               }

             }else { // 비밀글이 아니거나, 비밀글 비번 풀려있는 경우
            	 
            	 title.text( $(this).find('input[name=proQnaTitle]').val() );
                 
                 $(this).next(".pro-qna-answer").stop().slideToggle(300);
                 $(this).next("pro-qna-answer").siblings("pro-qna-answer").slideUp(300);
             }
             

             if($(this).next('pro-qna-answer').is('display','none')){ // 글 안 펼쳐져 있으면
             	$(this).siblings('pro-qna-answer').attr('display', 'none');
              $(this).next('pro-qna-answer').show();
             }else{ // 펼쳐져 있으면
               $(this).next('pro-qna-answer').removeClass('on');
               $(this).next('pro-qna-answer').attr('display', 'none');
             }
           })
           // ====================== 문의글 클릭 이벤트 끝 ===========================
       </script>

        <!-- 아래부터 Review 영역!! -->
        <!-- 아래부터 Review 영역!! -->
        <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
          <div class="row">
            <div class="col-lg-6">
              <div class="row total_rate">
                <div class="col-6">
                  <div class="box_total"  style="background-color: #F2F2F2;">
                    <h5>평점</h5>
                    <h4 style="color:#778C79;">4.0</h4>
                    <h6>(03명의 후기)</h6>
                  </div>
                </div>
                <div class="col-6">
                  <div class="rating_list">
                    <h3>3개의 리뷰</h3>
                    <ul class="list">
                      <li>
                        <a href="#">
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i style="color:gray; font-style: normal;"></i>
                          <span style="padding-left:10px;">3</span>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star" style="color:#F2F2F2"></i> 
                          <i style="color:gray; font-style: normal;"></i>
                          <span style="padding-left:10px;">3</span>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star" style="color:#F2F2F2"></i>
                          <i class="fa fa-star" style="color:#F2F2F2"></i> 
                          <i style="color:gray; font-style: normal;"></i>
                          <span style="padding-left:10px;">3</span>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star" style="color:#F2F2F2"></i>
                          <i class="fa fa-star" style="color:#F2F2F2"></i>
                          <i class="fa fa-star" style="color:#F2F2F2"></i> 
                          <i style="color:gray; font-style: normal;"></i>
                          <span style="padding-left:10px;">3</span>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star" style="color:#F2F2F2"></i>
                          <i class="fa fa-star" style="color:#F2F2F2"></i>
                          <i class="fa fa-star" style="color:#F2F2F2"></i>
                          <i class="fa fa-star" style="color:#F2F2F2"></i> 
                          <i style="color:gray; font-style: normal;"></i>
                          <span style="padding-left:10px;">3</span>
                        </a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
              <br><br>
              <div class="review_list">
                <div class="review_item">
                  <div class="media">
                    <table id="member-info">
                      <tr>
                        <td width="50px">김지*</td>
                        <td width="100px;">2022-07-26</td>
                      </tr>
                    </table>
                    <div class="media-body">
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                    </div>
                  </div>
                  <div class="review-content" style="height:200px;">
                    <p class="review-content-text" style="width:60%; height:100%; float:left; box-sizing:border-box; word-break:break-all;">
                      Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                      sed do eiusmod tempor incididunt ut labore et dolore magna
                      aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                      ullamco laboris nisi ut aliquip ex ea commodo
                    </p>
                    <div class="review-content-photo" style="width:40%; height:100%; padding-left:20px; padding-top:20px; float:left; box-sizing:border-box;">
                      
                      <a href="" id="activate-modal" data-toggle="modal" data-target="#myModal">
                        <img src="img/product/b3.jpg" id="review-img">
                      </a>
                    </div>
                  </div>
                  <br><br>
                </div>

                <div class="review_item">
                  <div class="media">
                    <table id="member-info">
                      <tr>
                        <td width="50px">김지*</td>
                        <td width="100px;">2022-07-26</td>
                      </tr>
                    </table>
                    <div class="media-body">
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                    </div>
                  </div>
                  <p>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                    sed do eiusmod tempor incididunt ut labore et dolore magna
                    aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                    ullamco laboris nisi ut aliquip ex ea commodo
                  </p>
                </div>
                
              </div>
            </div>
          </div>
        </div>
        <!-- 리뷰 영역 끝!!! -->
        
      </div>
    </div>
  </section>
  <!--================ 상품 상세 조회 끝 =================-->
		
<%@ include file="/views/common/footerbar.jsp" %>
</body>
</html>