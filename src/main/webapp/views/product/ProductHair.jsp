<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hair - Earth.Us</title>

<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Earth.Us</title>
    <link rel="icon" href="img/favicon.png">
    <!-- Bootstrap CSS -->
   
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- font awesome icon -->
	<script src="https://use.fontawesome.com/e3cb36acfb.js"></script>


<style>

	.best_seller{margin:5% 0%;}
	.price_rangs_aside{margin:5% 0%;}
	.
	
</style>

</head>
<body>
	
	<%@ include file = "../common/menubar.jsp" %>

<!-- banner part start-->
<section class="banner_part">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-12">
                <div class="banner_slider owl-carousel">

                    <div class="single_banner_slider">
                        <div class="row">
                            <div class="banner_img d-none d-lg-block banner_text">
                                <img src="<%=  %>resources/images/img/banner_img.png" alt="">
                            </div>
                        </div>
                    </div>
                    
                    <div class="single_banner_slider">
                        <div class="row">
                            <div class="banner_img d-none d-lg-block banner_text">
                                <img src="resources/images/img/banner_img.png" alt="">
                            </div>
                        </div>
                    </div>

                    <div class="single_banner_slider">
                        <div class="row">
                            <div class="banner_img d-none d-lg-block banner_text" style="top:0;">
                                <img src="resources/images/img/banner_img.png" alt="" id="banner_3">
                            </div>
                            <div class="banner_text"></div>
                        </div>
                    </div>
                    

                </div>
            </div>
        </div>
    </div>
</section>
<!-- banner part end -->
    
    
    <!--================상품 카테고리 영역=================-->
    <section class="cat_product_area section_padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="left_sidebar_area"> <!-- 좌측 사이드바 영역-->
                        <aside class="left_widgets p_filter_widgets">
                            <div class="l_w_title">
                                <h3>상품 카테고리</h3>
                            </div>
                            <div class="widgets_inner"> <!--카테고리 분류-->
                                <ul class="list">
                                    <li>
                                        <a href="category_main.html">All</a>
                                        <span>(전체상품개수)</span>
                                    </li>
                                    <li>
                                        <a href="category_hair.html" style="font-weight:bold">Hair</a>
                                        <span style="font-weight:bold">(헤어상품개수)</span>
                                    </li>
                                    <li>
                                        <a href="category_body.html">Body</a>
                                        <span>(바디상품개수)</span>
                                    </li>
                                    <li>
                                        <a href="category_kitchen.html">Kitchen</a>
                                        <span>(주방용품개수)</span>
                                    </li>
                                    <li>
                                        <a href="category_bathroom.html">Bathroom</a>
                                        <span>(욕실용품개수)</span>
                                    </li>
                                </ul>
                            </div>
                        </aside>
                        <aside class="left_widgets p_filter_widgets price_rangs_aside"> <!--가격 필터-->
                            <div class="l_w_title">
                                <h3>가격 필터</h3>
                            </div>
                            <div class="widgets_inner">
                                <div class="range_item">
                                    <input type="text" class="js-range-slider" value="" />
                                    <div class="d-flex">
                                        <div class="price_text">
                                            <p>가격 :</p>
                                        </div>
                                        <div class="price_value d-flex justify-content-center">
                                            <input type="text" class="js-input-from" id="amount" readonly />
                                            <span>~</span>
                                            <input type="text" class="js-input-to" id="amount" readonly />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </aside>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="row">
                        <div class="col-lg-12"> <!-- 조회바영역-->
                            <div class="product_top_bar d-flex justify-content-between align-items-center">
                                <div class="single_product_menu d-flex"><!-- 정렬기준-->
                                    <h5>정렬기준 : </h5>
                                    <select>
                                        <option data-display="조회순">조회순</option>
                                        <option value="1">판매량높은순</option>
                                        <option value="2">가격높은순</option>
                                        <option value="3">가격낮은순</option>
                                    </select>
                                </div>
                                <div class="single_product_menu d-flex"><!--상품검색창-->
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="상품 검색"
                                            aria-describedby="inputGroupPrepend">
                                        <div class="input-group-prepend">
                                            <!--상품검색 돋보기아이콘-->
                                            <span class="input-group-text" id="inputGroupPrepend"><i
                                                    class="ti-search"></i></span>
                                            <script> // 돋보기 아이콘 클릭 시 상품 검색 결과창 반환
                                                $(function(){
                                                    $(".ti-search").click(function(){
                                                        location.href="category_search.html";
                                                    })
                                                })
                                            </script>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--상품 목록 영역 시작-->
                    <section class="product_list best_seller">
                        <div class="container">
                            <div class="row justify-content-center"> <!--베스트 상품 영역-->
                                <div class="col-lg-12">
                                    <div class="section_tittle">
                                        <h2>베스트 상품</h2>
                                    </div>
                                </div>
                            </div>
                            <div class="row align-items-center justify-content-between">
                                <div class="col-lg-12">
                                    <div class="best_product_slider owl-carousel">
                                        <div class="single_product_item" onclick="productDetail();">
                                            <img src="img/product/product_1.png" alt="">
                                            <div class="single_product_text">
                                                <h4>상품명1</h4>
                                                <h3>9,900원</h3>
                                            </div>
                                        </div>
                                        <div class="single_product_item" onclick="productDetail();">
                                            <img src="img/product/product_2.png" alt="">
                                            <div class="single_product_text">
                                                <h4>상품명2</h4>
                                                <h3>9,900원</h3>
                                            </div>
                                        </div>
                                        <div class="single_product_item" onclick="productDetail();">
                                            <img src="img/product/product_3.png" alt="">
                                            <div class="single_product_text">
                                                <h4>상품명3</h4>
                                                <h3>10,000원</h3>
                                            </div>
                                        </div>
                                        <div class="single_product_item" onclick="productDetail();">
                                            <img src="img/product/product_4.png" alt="">
                                            <div class="single_product_text">
                                                <h4>상품명4</h4>
                                                <h3>10,000원</h3>
                                            </div>
                                        </div>
                                        <div class="single_product_item" onclick="productDetail();">
                                            <img src="img/product/product_5.png" alt="">
                                            <div class="single_product_text">
                                                <h4>상품명5</h4>
                                                <h3>9,000원</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <script>
                        // ----------- 베스트 상품 영역 스크립트 ----------
                        function productDetail(){ // 상품 상세 조회 페이지로 이동
                            location.href = "single-product.html";
                        }

                    </script>

                    <div class="row align-items-center latest_product_inner"> <!--상품영역-->
                        <div class="col-lg-4 col-sm-6">
                            <div class="single_product_item">
                                <div onclick="productDetail();">
                                    <img src="img/product/product_1.png" alt="">
                                    <div class="single_product_text">
                                        <div>
                                            <p>상품명1</p>
                                            <h3>9,900원</h3>
                                        </div>
                                        <div>
                                </div>

                                        <a href="#" class="add_cart" data-toggle="modal" data-target="#myModal">+ 장바구니 추가<i class="fa fa-heart-o" aria-hidden="true"></i></a>
                                        
                                        <!-- 장바구니 Modal 시작 -->
                                        <div class="modal" id="myModal">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                            
                                                    <!-- Modal body -->
                                                    <div class="modal-body" style="text-align:center; padding:50px 0px; line-height:30px; background:#f2f2f2; color:black;">
                                                    상품이 장바구니에 담겼습니다.<br>
                                                    장바구니로 이동하시겠습니까?
                                                    </div>
                                                    
                                                    <!-- Modal footer --> <!-- 확인이건 취소건 누르지도 않았는데 바로 장바구니로 넘어감 -->
                                                    <div class="modal-footer" style="background:#f2f2f2; text-align:center; display:inline-block;">
                                                    <button type="button" class="btn btn_2" id="goToCart" style="background:#778C79; color:#F2F2F2; line-height:30px;">확인</button>
                                                    <button type="button" class="btn btn_2" data-dismiss="modal" style="background:#778C79; color:#F2F2F2; line-height:30px;">취소</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 장바구니 Modal 끝 -->

                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-4 col-sm-6">
                            <div class="single_product_item">
                                <div onclick="productDetail();">
                                    <img src="img/product/product_2.png" alt="">
                                    <div class="single_product_text">
                                        <h4>상품명2</h4>
                                        <h3>9,900원</h3>
                                    </div>
                                </div>
                                    <a href="#" class="add_cart" id="add_cart" data-toggle="modal" data-target="#myModal">+ 장바구니 추가<i class="fa fa-heart-o" aria-hidden="true"></i></a>
                                    <!-- 하트 눌러도 장바구니 추가 confirm 뜨는 것 수정 필요-->
                            </div>
                        </div>
                        <script>

                            $(function(){

                                $('#goToCart').click(function(){ // 장바구니 모달에서 확인을 눌렀을 때
                                    location.href = "cart.html";
                                })

                            })

                        </script>
                        <div class="col-lg-4 col-sm-6">
                            <div class="single_product_item">
                                <img src="img/product/product_3.png" alt="">
                                <div class="single_product_text">
                                    <h4>상품명3</h4>
                                    <h3>9,900원</h3>
                                    <div style="display:inline-block">
                                        <a href="#" class="add_cart" style="display:inline-block;">+ 장바구니 추가</a>
                                        <i class="fa fa-heart-o"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6">
                            <div class="single_product_item">
                                <img src="img/product/product_4.png" alt="">
                                <div class="single_product_text">
                                    <h4>상품명4</h4>
                                    <h3>9,900원</h3>
                                    <a href="#" class="add_cart">+ 장바구니 추가<i class="ti-heart" onclick="addWishList();"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6">
                            <div class="single_product_item">
                                <img src="img/product/product_5.png" alt="">
                                <div class="single_product_text">
                                    <h4>상품명5</h4>
                                    <h3>9,900원</h3>
                                    <a href="#" class="add_cart">+ 장바구니 추가<i class="ti-heart" onclick="addWishList();"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6">
                            <div class="single_product_item">
                                <img src="img/product/product_6.png" alt="">
                                <div class="single_product_text">
                                    <h4>상품명6</h4>
                                    <h3>9,990원</h3>
                                    <a href="#" class="add_cart">+ 장바구니 추가<i class="ti-heart"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6">
                            <div class="single_product_item">
                                <img src="img/product/product_7.png" alt="">
                                <div class="single_product_text">
                                    <h4>상품명7</h4>
                                    <h3>9,900원</h3>
                                    <a href="#" class="add_cart">+ 장바구니 추가<i class="ti-heart"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6">
                            <div class="single_product_item">
                                <img src="img/product/product_8.png" alt="">
                                <div class="single_product_text">
                                    <h4>상품명8</h4>
                                    <h3>9,900원</h3>
                                    <a href="#" class="add_cart">+ 장바구니 추가<i class="ti-heart"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6">
                            <div class="single_product_item">
                                <img src="img/product/product_2.png" alt="">
                                <div class="single_product_text">
                                    <h4>상품명9</h4>
                                    <h3>9,900원</h3>
                                    <a href="#" class="add_cart">+ 장바구니 추가<i class="ti-heart"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="pageination">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center">
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
                                        <li class="page-item"><a class="page-link" href="#">6</a></li>
                                        <li class="page-item">
                                            <a class="page-link" href="#" aria-label="Next">
                                                <i class="ti-angle-double-right"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
        $('.add_cart').click(function(){
            
        })
        // ------------- 상품 목록 영역 스크립트 ---------------
       function addWishList(){

        /*
        if($('.ti-heart'))
        $.ajax({
            url:"#",
            data:{},
            type:"post",
            success:function(){ // 위시리스트 추가 성공
                $('.ti-heart').style.color = "#778C79";
            },error:function(){ // 위시리스트 추가 실패
                console.log("ajax통신 실패");
            }
        })
        */
       $(this).css("color", "#778C79");
       }


    </script>
    <!--상품 목록 영역 끝-->
    <!--================상품 카테고리 영역 끝=================-->
	
	<%@ include file = "../common/footerbar.jsp" %>
</body>
</html>