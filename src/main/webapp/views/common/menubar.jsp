<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- 파일 경로 contextPath 앞에 넣기 -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Earth.Us</title>
    <link rel="icon" href="resources/images/img/sub_logo.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="resources/css/u_css_sumin/bootstrap_sumin.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="resources/css/u_css_sumin/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="resources/css/u_css_sumin/owl.carousel.min.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="resources/css/u_css_sumin/all.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="resources/css/u_css_sumin/flaticon.css">
    <link rel="stylesheet" href="resources/css/u_css_sumin/themify-icons.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="resources/css/u_css_sumin/magnific-popup.css">
    <!-- swiper CSS -->
    <link rel="stylesheet" href="resources/css/u_css_sumin/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="resources/css/u_css_sumin/style_sumin.css">
</head>

<body>

	<!--::header part start::-->
    <header class="main_menu home_menu">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-12">
                    <nav class="navbar navbar-expand-lg navbar-light">

                        <div class="collapse navbar-collapse main-menu-item menubar-style" id="navbarSupportedContent" >
                        
                            <!-- *************메뉴바 들어가는 데에 class menubar-style 부여하기*************** -->
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="index.html">aboutUs</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown_1"
                                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Shop
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                        <a class="dropdown-item" href="category.html"> Hair</a>
                                        <a class="dropdown-item" href="single-product.html">Body</a>
                                        <a class="dropdown-item" href="">Kitchen</a>
                                        <a class="dropdown-item" href="">Bathroom</a>
                                        
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown_3"
                                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Community
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
                                        <a class="dropdown-item" href="login.html"> 챌린지</a>
                                        <a class="dropdown-item" href="tracking.html">콘텐츠</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown_2"
                                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Contact
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
                                        <a class="dropdown-item" href="blog.html"> 공지사항</a>
                                        <a class="dropdown-item" href="single-blog.html">자주묻는질문</a>
                                        <a class="dropdown-item" href="">Q&A</a>
                                    </div>
                                </li>

                                
                            </ul>
                        </div>

                         <!-- 메뉴바 로고-->
                         <!-- 메뉴바 로고 들어가는 데 class menubar-logo 부여하기 -->
                            <a class="navbar-brand container menubar-logo" href="index.html"> 
                            <img src="resources/images/img/logo.png" alt="logo" style="width:250px;"> </a>
                         <button class="navbar-toggler" type="button" data-toggle="collapse"
                             data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                             aria-expanded="false" aria-label="Toggle navigation">
                             <span class="menu_icon"><i class="fas fa-bars"></i></span>
                         </button>
                        

                        <!-- 메뉴바 아이콘 -->
                        
                            <div>
                            <div class="collapse navbar-collapse main-menu-item">
                                <ul class="navbar-nav main-menu main-menu-item">
        
                                    <li class="nav-item">
                                        <a class="nav-link" href="">
                                            Login
                                        </a>
                                        <!-- 로그인 후 로그아웃으로 변함 -->
                                        <!-- <a class="nav-link" href="">
                                            Logout
                                        </a>  -->
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="">
                                            Join
                                        </a>
                                    </li>
                                </ul> 
                            </div>
                            </div>

                            <div class="hearer_icon d-flex">
                            <!-- 검색 -->
                            <a id="search_1" href="javascript:void(0)"><i class="ti-search"></i></a>
                            <!-- 위시리스트-->
                            <a href=""><i class="ti-heart"></i></a>
                            <!-- 장바구니 -->
                                <a>
                                    <i class="ti-shopping-cart"></i>
                                </a>
                                

                            <!-- 마이페이지 -->
                            <a id="myPageIcon" href=""><i class="ti-user"></i></a> <!-- 아이콘 쓸 수 있는 게 별로 없음ㅜ-->
                        </div>
                    </nav>
                </div>
            </div>
        </div>
        <!-- 검색창 내려옴 -->
        <div class="search_input" id="search_input_box">
            <div class="container ">
                <form class="d-flex justify-content-between search-inner">
                    <input type="text" class="form-control" id="search_input" placeholder="Search Here">
                    <button type="submit" class="btn"></button>
                    <span class="ti-close" id="close_search" title="Close Search"></span>
                </form>
            </div>
        </div>
    </header>

    <!-- Header part end-->
    <!-- 메뉴바 끝 -->

    <!-- jquery plugins here-->
    <script src="resources/js/u_js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="resources/js/u_js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="resources/js/u_js/bootstrap.min.js"></script>
    <!-- easing js -->
    <script src="resources/js/u_js/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="resources/js/u_js/swiper.min.js"></script>
    <!-- swiper js -->
    <script src="resources/js/u_js/masonry.pkgd.js"></script>
    <!-- particles js -->
    <script src="resources/js/u_js/owl.carousel.min.js"></script>
    <script src="resources/js/u_js/jquery.nice-select.min.js"></script>
    <!-- slick js -->
    <script src="resources/js/u_js/slick.min.js"></script>
    <script src="resources/js/u_js/jquery.counterup.min.js"></script>
    <script src="resources/js/u_js/waypoints.min.js"></script>
    <script src="resources/js/u_js/contact.js"></script>
    <script src="resources/js/u_js/jquery.ajaxchimp.min.js"></script>
    <script src="resources/js/u_js/jquery.form.js"></script>
    <script src="resources/js/u_js/jquery.validate.min.js"></script>
    <script src="resources/js/u_js/mail-script.js"></script>
    <!-- custom js -->
    <script src="resources/js/u_js/custom.js"></script>
	
</body>
</html>