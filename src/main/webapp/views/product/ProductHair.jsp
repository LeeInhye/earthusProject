<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	page import="java.util.ArrayList, com.us.common.model.vo.PageInfo, com.us.product.model.vo.*"
 %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	int listCount = pi.getListCount();

	Category c = (Category)request.getAttribute("c");
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hair - Earth.Us</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Earth.Us</title>

	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	

<style>

	.best_seller{margin:5% 0%;}
	.price_rangs_aside{margin:5% 0%;}
	
</style>

</head>
<body>
	
	<%@ include file = "../common/menubar.jsp" %>

<!-- banner part start-->
<section class="breadcrumb contents_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <img src="<%=contextPath%>/<%=c.getCategoryImgPath()%>">
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
                                <ul class="list"></span>
                                    </li>
                                    <li>
                                        <a href="<%=contextPath%>/list.hair?categoryNo=1&cpage=1" style="font-weight:bold">Hair</a>
                                        <span style="font-weight:bold">(<%= listCount %>)</span>
                                    </li>
                                    <li>
                                        <a href="<%=contextPath%>/list.hair?categoryNo=2&cpage=1">Body</a>
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
                                    <select class="nice-select">
                                        <option data-display="조회순" value="1">조회순</option>
                                        <option value="2">판매량높은순</option>
                                        <option value="3">가격높은순</option>
                                        <option value="4">가격낮은순</option>
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
                                        <div class="single_product_item">
                                            <img src="img/product/product_1.png" alt="">
                                            <div class="single_product_text">
                                                <h4>상품명1</h4>
                                                <p>9,900원</p><i class="fa fa-heart-o""></i>
                                            </div>
                                        </div>
                                        <div class="single_product_item">
                                            <img src="img/product/product_2.png" alt="">
                                            <div class="single_product_text">
                                                <h4>상품명2</h4>
                                                <p>9,900원</p><i class="fa fa-heart-o"></i>
                                            </div>
                                        </div>
                                        <div class="single_product_item">
                                            <img src="img/product/product_3.png" alt="">
                                            <div class="single_product_text">
                                                <h4>상품명3</h4>
                                                <p>10,000원</p><i class="fa fa-heart-o"></i>
                                            </div>
                                        </div>
                                        <div class="single_product_item">
                                            <img src="img/product/product_4.png" alt="">
                                            <div class="single_product_text">
                                                <h4>상품명4</h4>
                                                <p>10,000원</p><i class="fa fa-heart-o"></i>
                                            </div>
                                        </div>
                                        <div class="single_product_item">
                                            <img src="img/product/product_5.png" alt="">
                                            <div class="single_product_text">
                                                <h4>상품명5</h4>
                                                <p>9,000원</p><i class="fa fa-heart-o"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

 					 <!-- 전체 상품 영역 시작 -->
                    <div class="row align-items-center latest_product_inner">
                      <% if(list != null) { %>
                      	<% for(Product p : list) { %>
                        <div class="col-lg-4 col-sm-6">
                            <div class="single_product_item">
                                <img src="<%= contextPath %>/<%= p.getProImgPath() %>" alt="">
                                <div class="single_product_text">
                                    <h4><%= p.getProName() %></h4>
                                    <p><%= p.getPrice() %>원</p><i class="fa fa-heart-o"></i>
                                    <a href="#" class="add_cart">+ 장바구니 추가</a>
                                </div>
                            </div>
                        </div>
                        <% } %>
                      <% } else {%>
                      	<div><p>list 값 없음<%= list%><%= c %></p></div>
                      <% } %>
                      
                        <!------------ 페이징바 영역 ------------>
                        <div class="col-lg-12">
                            <div class="pageination">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center">
                                        
                                        <% if(currentPage != 1) { %>
                                        <li class="page-item">
                                            <a class="page-link" href="<%=contextPath%>/list.hair?categoryNo=1&cpage=<%=currentPage-1%>" aria-label="Previous">
                                                <i class="ti-angle-double-left"></i>
                                            </a>
                                        </li>
                                        <% } %>
                                        
                                       	<% for(int p=startPage; p<=endPage; p++){ %>
                                       	
                                       		<% if(p == currentPage){ %>
	                                       	<li class="page-item"><a disabled class="page-link" href="<%=contextPath%>/list.hair?categoryNo=1&cpage=<%= p %>"><%= p %></a></li>
	                                       	<% }else { %>
                                       		<li class="page-item"><a class="page-link" href="<%=contextPath%>/list.hair?categoryNo=1&cpage=<%= p %>"><%= p %></a></li>
	                                       	<% } %>
	                                       	
	                                    <% } %>
	                                    
	                                    <% if(currentPage != maxPage){ %>
                                        <li class="page-item">
                                            <a class="page-link" href="<%= contextPath %>/list.hair?categoryNo=1&cpage=<%= currentPage+1 %>" aria-label="Next">
                                                <i class="ti-angle-double-right"></i>
                                            </a>
                                        </li>
                                        <% } %>
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
       

        $(function(){

            $('.single_product_text>i').click(function(){ 

                if( $(this).hasClass("fa fa-heart-o") ){

                 $(this).removeClass('fa fa-heart-o').addclass("fa fa-heart");
                }

                if( $(this).hassClass("fa fa-heart") ){

                    $(this).removeClass("fa fa-heart").addClass("fa fa-heart-o");
                }
                
            })

        	// 돋보기 아이콘 클릭 시 상품 검색 결과창 반환
            $(".ti-search").click(function(){
            	
                location.href="category_search.html";
            })

        })
                                            

    </script>
    <!--상품 목록 영역 끝-->
    <!--================상품 카테고리 영역 끝=================-->
	
	<%@ include file = "../common/footerbar.jsp" %>
</body>
</html>