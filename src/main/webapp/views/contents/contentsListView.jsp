<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="/views/common/menubar.jsp" %>

    <!--================ Banner Area =================-->
    <section class="breadcrumb contents_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h2>콘텐츠</h2>
                            <p>환경을 지키며 궁금한 것들, 어스가 대신 알려드립니다!</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!--================Blog Area =================-->
    <section class="blog_area padding_top">
        <div class="container">
            <div class="row">
                <!-- 콘텐츠 글 리스트 -->
                <br><br><br>
                <div class="blog_left_sidebar" style="width: 100%;">
                    <article class="blog_item">
                        <div class="blog_item_img">
                            <img class="card-img rounded-0" src="<%=contextPath%>/resources/images/img/blog/single_blog_1.png" alt="" width="1370" height="520">
                            <a href="#" class="blog_item_date">
                                <h3>15</h3>
                                <p>Jan</p>
                            </a>
                        </div>

                        <div class="blog_details">
                            <a class="d-inline-block" href="single-blog.html">
                                <h2>콘텐츠 제목이 들어가는 자리입니다.</h2>
                            </a>
                            <p>콘텐츠 간단한 설명이 들어가는 자리입니다.</p>
                            <ul class="blog-info-link">
                                <li><a href="#"><i class="ti-calendar"></i> 2022-07-25</a></li>
                                <li><a href="#"><i class="ti-heart"></i> 03 Likes</a></li>
                            </ul>
                        </div>
                    </article>

                    <article class="blog_item">
                        <div class="blog_item_img">
                            <img class="card-img rounded-0" src="<%=contextPath%>/resources/images/img/blog/single_blog_2.png" alt="">
                            <a href="#" class="blog_item_date">
                                <h3>15</h3>
                                <p>Jan</p>
                            </a>
                        </div>

                        <div class="blog_details">
                            <a class="d-inline-block" href="single-blog.html">
                                <h2>콘텐츠 제목이 들어가는 자리입니다.</h2>
                            </a>
                            <p>콘텐츠 간단한 설명이 들어가는 자리입니다.</p>
                            <ul class="blog-info-link">
                                <li><a href="#"><i class="ti-calendar"></i> 2022-07-20</a></li>
                                <li><a href="#"><i class="ti-heart"></i> 03 Likes</a></li>
                            </ul>
                        </div>
                    </article>

                    <article class="blog_item">
                        <div class="blog_item_img">
                            <img class="card-img rounded-0" src="<%=contextPath%>/resources/images/img/blog/single_blog_3.png" alt="">
                            <a href="#" class="blog_item_date">
                                <h3>15</h3>
                                <p>Jan</p>
                            </a>
                        </div>

                        <div class="blog_details">
                            <a class="d-inline-block" href="single-blog.html">
                                <h2>콘텐츠 제목이 들어가는 자리입니다.</h2>
                            </a>
                            <p>콘텐츠 간단한 설명이 들어가는 자리입니다.</p>
                            <ul class="blog-info-link">
                                <li><a href="#"><i class="ti-calendar"></i> Travel, Lifestyle</a></li>
                                <li><a href="#"><i class="ti-heart"></i> 03 Likes</a></li>
                            </ul>
                        </div>
                    </article>

                    <article class="blog_item">
                        <div class="blog_item_img">
                            <img class="card-img rounded-0" src="<%=contextPath%>/resources/images/img/blog/single_blog_4.png" alt="">
                            <a href="#" class="blog_item_date">
                                <h3>15</h3>
                                <p>Jan</p>
                            </a>
                        </div>

                        <div class="blog_details">
                            <a class="d-inline-block" href="single-blog.html">
                                <h2>콘텐츠 제목이 들어가는 자리입니다.</h2>
                            </a>
                            <p>콘텐츠 간단한 설명이 들어가는 자리입니다.</p>
                            <ul class="blog-info-link">
                                <li><a href="#"><i class="ti-calendar"></i> Travel, Lifestyle</a></li>
                                <li><a href="#"><i class="ti-heart"></i> 03 Likes</a></li>
                            </ul>
                        </div>
                    </article>

                    <article class="blog_item">
                        <div class="blog_item_img">
                            <img class="card-img rounded-0" src="<%=contextPath%>/resources/images/img/blog/single_blog_5.png" alt="">
                            <a href="#" class="blog_item_date">
                                <h3>15</h3>
                                <p>Jan</p>
                            </a>
                        </div>

                        <div class="blog_details">
                            <a class="d-inline-block" href="single-blog.html">
                                <h2>콘텐츠 제목이 들어가는 자리입니다.</h2>
                            </a>
                            <p>콘텐츠 간단한 설명이 들어가는 자리입니다.</p>
                            <ul class="blog-info-link">
                                <li><a href="#"><i class="far fa-user"></i> Travel, Lifestyle</a></li>
                                <li><a href="#"><i class="ti-heart"></i> 03 Likes</a></li>
                            </ul>
                        </div>
                    </article>

                    <nav class="blog-pagination justify-content-center d-flex">
                        <ul class="pagination">
                            <li class="page-item">
                                <a href="#" class="page-link" aria-label="Previous">
                                    <i class="ti-angle-left"></i>
                                </a>
                            </li>
                            <li class="page-item">
                                <a href="#" class="page-link">1</a>
                            </li>
                            <li class="page-item active">
                                <a href="#" class="page-link">2</a>
                            </li>
                            <li class="page-item">
                                <a href="#" class="page-link" aria-label="Next">
                                    <i class="ti-angle-right"></i>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>     
        </div>
    </section>
    <br><br><br><br><br>
    <!--================Blog Area =================-->

	<%@ include file="/views/common/footerbar.jsp" %>
	
</body>
</html>