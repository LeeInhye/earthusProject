<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.us.member.model.vo.Member, java.util.ArrayList, com.us.challenge.model.vo.Challenge" %>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
	ArrayList<Challenge> chList = (ArrayList<Challenge>)session.getAttribute("chList");
%>
<!DOCTYPE html>
<html>
<head>

<!-- 파일 경로 contextPath 앞에 넣기 -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Earth.Us</title>
    <link rel="icon" href="<%= contextPath %>/resources/img/sub_logo.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<%= contextPath %>/resources/css/u_css_sumin/bootstrap_sumin.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="<%= contextPath %>/resources/css/u_css_sumin/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="<%= contextPath %>/resources/css/u_css_sumin/owl.carousel.min.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="<%= contextPath %>/resources/css/u_css_sumin/all.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="<%= contextPath %>/resources/css/u_css_sumin/flaticon.css">
    <link rel="stylesheet" href="<%= contextPath %>/resources/css/u_css_sumin/themify-icons.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="<%= contextPath %>/resources/css/u_css_sumin/magnific-popup.css">
    <!-- swiper CSS -->
    <link rel="stylesheet" href="<%= contextPath %>/resources/css/u_css_sumin/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="<%= contextPath %>/resources/css/u_css_sumin/style_sumin.css">
    <!-- pretendard font -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
    <link rel="stylesheet" href="<%= contextPath %>/resources/css/u_css_sumin/font-pretendard.css">
    <!--  jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
    
    /*--------좌우슬라이딩---------*/
	#index_01{
	    width: 705px;
	    height: 400px;
	    border: 1px solid dimgrey;
	    margin: 0 auto;
	}
	
	#slide1{
	    height: 350px;
	    overflow: hidden;
	    border-bottom: 1px solid dimgrey;
	}
	#slide1>ul{
	    width: 3600px;
	    font-size: 0;
	}
	#slide1>ul>li{
	    display: inline-block;
	    font-size: 0;
	}
        
    </style>
    
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
                                    <a class="nav-link" href="<%= contextPath%>/info.hm">aboutUs</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="<%= contextPath %>/list.pro?categoryNo=5&cpage=1" id="navbarDropdown_1"
                                       aria-haspopup="true" aria-expanded="false">
                                        Shop
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                        <a class="dropdown-item" href="<%= contextPath %>/list.pro?categoryNo=1&cpage=1"> Hair</a>
                                        <a class="dropdown-item" href="<%= contextPath %>/list.pro?categoryNo=2&cpage=1">Body</a>
                                        <a class="dropdown-item" href="<%= contextPath %>/list.pro?categoryNo=3&cpage=1">Kitchen</a>
                                        <a class="dropdown-item" href="<%= contextPath %>/list.pro?categoryNo=4&cpage=1">Bathroom</a>
                                        
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown_3"
                                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Community
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
                                        <a class="dropdown-item" href="<%= contextPath %>/list.ch?cpage=1">챌린지</a>
                                        <a class="dropdown-item" href="<%= contextPath %>/list.co?cpage=1">콘텐츠</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="javascript:void(0)" id="navbarDropdown_2"
                                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Contact
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
                                        <a class="dropdown-item" href="<%= contextPath %>/list.no"> 공지사항</a>
                                        <a class="dropdown-item" href="<%= contextPath %>/list.fq">자주묻는질문</a>
                                        <a class="dropdown-item" href="<%= contextPath %>/list.qa?qpage=1">Q&A</a>
                                    </div>
                                </li>

                                
                            </ul>
                        </div>

                         <!-- 메뉴바 로고-->
                         <!-- 메뉴바 로고 들어가는 데 class menubar-logo 부여하기 -->
                            <a class="navbar-brand container menubar-logo" href="<%= contextPath %>"> 
                            <img src="<%= contextPath %>/resources/img/logo.png" alt="logo" style="width:250px;"> </a>
                         <button class="navbar-toggler" type="button" data-toggle="collapse"
                             data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                             aria-expanded="false" aria-label="Toggle navigation">
                             <span class="menu_icon"><i class="fas fa-bars"></i></span>
                         </button>
                        

                        <!-- 메뉴바 아이콘 -->
                        
                            <div>
                            <div class="collapse navbar-collapse main-menu-item">
                                <ul class="navbar-nav main-menu main-menu-item">
        
                                    <!-- 로그인 됐을 때와 안됐을 때의 메뉴바 차이 -->
                                       <% if(loginUser == null){	// 로그인되지 않은 상태 %>
                                    		<li class="nav-item">
	                                        	<a class="nav-link" href='<%= contextPath %>/goLogin.me'>
	                                            	Login
	                                        	</a>
	                                        </li>
                                       <% } else { // 로그인 된 상태 %>
	                                        <!-- 로그인 후 로그아웃으로 변함 -->
	                                        <li class="nav-item">
	                                        	<a class="nav-link" href="<%= contextPath %>/logout.me">
	                                            	Logout
	                                        	</a>
	                                        </li>
                                       <% } %>
                                    
                                    <li class="nav-item">
                                        <a class="nav-link" href="<%= contextPath %>/enrollForm_1.me">
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
                            <% if(loginUser == null) { // 로그인 전 %>
                            	<a href="<%=contextPath%>/goLogin.me"><i class="ti-heart"></i></a>
                            <% } else { // 로그인 후 %>
                            	<a href="<%=contextPath%>/wish.pr" id="lsuccess"><i class="ti-heart"></i></a>
                            <% } %>
                            <!-- 장바구니 -->
                            <% if(loginUser == null) { // 로그인 전 %>
                            	<a href="<%=contextPath%>/goLogin.me"><i class="ti-shopping-cart"></i></a>
                            <% } else { // 로그인 후 %>
                            	<a href="<%=contextPath%>/list.ct"><i class="ti-shopping-cart"></i></a>
                            <% } %>
                                
                                

                             <!-- 마이페이지 -->
                            <% if(loginUser == null) { 	// 로그인 하지 않은 상태일 때 %>
                            	<a id="myPageIcon" href="<%= contextPath %>/goLogin.me">
	                            	<i class="ti-user"></i>
	                            </a>
	                        <% } else if(loginUser.getUserStatus().equals("M")){	// 관리자일 때 %>
	                            <a id="myPageIcon" href="<%= contextPath %>/main.ad">
	                            	<i class="ti-user"></i>
	                            </a> 
	                        <% } else{%>
	                        	<a id="myPageIcon" href="<%= contextPath %>/myPage.mp">
	                            	<i class="ti-user"></i>
	                            </a> 
	                        <% } %>
	                        
                        </div>
                    </nav>
                </div>
            </div>
        </div>
        <!-- 검색창 내려옴 -->
        <div class="search_input" id="search_input_box">
            <div class="container">
                <form class="d-flex justify-content-between search-inner">
                    <input type="text" class="form-control" id="search_input" placeholder="Search Here" onkeyup="enterkey();">
                    <!-- 상품검색 -->
				    <script>
				    	// 엔터키 이벤트 제거
				        function enterkey(){
				        	$('input[type="text"]').keydown(function() {
				        		  if (event.keyCode === 13) {
				        		    event.preventDefault();
				        		  };
				        		});
				        	
				        	if(window.event.keyCode == 13){
				        		var keyword = $("#search_input").val();
				        		location.href="<%= contextPath %>/list.pro?&cpage=1&categoryNo=5&keyword=" + keyword;
				        	}
				        }
				    </script>
                    <button type="submit" class="btn" id="searchPro"></button>
                    <span class="ti-close" id="close_search" title="Close Search"></span>
                </form>
            </div>
        </div>
    </header>
    

    <!-- Header part end-->
    <!-- 메뉴바 끝 -->
	<!-- 메뉴바에 검색부분이  -->
	<!-- 코드 긁어오면 되는데 왜 include하면 안될까요...하... -->
	
	
	
 	<script>
		$(function(){
			var a = "";
			var b = "";
			$.ajax({
				url:"<%= contextPath %>/loadBanner.us",
				success:function(blist){
					console.log(blist);
					
					a = '<li>' 
					  + '<a href="#">' 
					  + '<img src="' + blist[0].bnImgURL + '" alt="슬라이드0">' 
					  + '</a>'
					  + '</li>'
					$("#banner-ul").append(a);
					
					for(var i=1; i<blist.length; i++){
						b = ' <li>' 
						  + '<a href="#">' 
						  + '<img src="' + blist[i].bnImgURL + '" alt="슬라이드' + i + '">' 
						  + '</a>' 
						  + '</li>'
					$("#banner-ul").append(b);
					}
					
				}
			})
		})
		
		setInterval(function(){
		    $('#slide1>ul').delay(2500);
		    $('#slide1>ul').animate({marginLeft: "-705px"})
		    $('#slide1>ul').delay(2500);
		    $('#slide1>ul').animate({marginLeft: "-1410px"})
		    $('#slide1>ul').delay(2500);
		    $('#slide1>ul').animate({marginLeft: "-2115px"})
		    $('#slide1>ul').delay(2500);
		    $('#slide1>ul').animate({marginLeft: "0px"})
		});

		
	</script>
	
	 <!-- banner part start-->
    <section class="banner_part">
        <div id="index_01" class="banner-container">
	        <div id="slide1" class="banner-wrap">
				<ul id="banner-ul">
					
				</ul>
			</div>
        </div>
    </section>
    <!-- banner part start--> 
     
     <script type="text/javascript" src="script/slide.js"></script>
    <!-- banner part end -->


    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>


    <!-- feature_part start-->
    <section class="feature_part padding_top">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="section_tittle text-center">
                        <h2>Featured Category</h2>
                    </div>
                </div>
            </div>
            <div class="row align-items-center justify-content-between">
                <div class="col-lg-7 col-sm-6">
                    <div class="single_feature_post_text">
                        <h3 style="margin-top: 230px;">HAIR</h3>
                        <a href="<%= contextPath %>/list.pro?categoryNo=1&cpage=1" class="feature_btn">EXPLORE NOW <i class="fas fa-play"></i></a>
                        <img src="<%= contextPath %>/resources/img/product/hair_1_img.png" alt="고 그린 헤어샴푸바" style="height: 100%;">
                    </div>
                </div>
                <div class="col-lg-5 col-sm-6">
                    <div class="single_feature_post_text" style="position:relative !important;">
                        <a href="<%= contextPath %>/list.pro?categoryNo=2&cpage=1" class="feature_btn">EXPLORE NOW <i class="fas fa-play"></i></a>
                        <h3 style="margin-top: 277px; margin-left: 70%; z-index:1;  position:absolute;">BODY</h3>
                        <img src="<%= contextPath %>/resources/img/product/body_5_img.png" alt="" style="height: 100%; float: right;" >
                    </div>
                </div>
                <div class="col-lg-5 col-sm-6">
                    <div class="single_feature_post_text" style="position:relative !important;">
                        <a href="<%= contextPath %>/list.pro?categoryNo=2&cpage=1" class="feature_btn">EXPLORE NOW <i class="fas fa-play"></i></a>
                        <h3 style="margin-top: 277px; margin-left: 60%; z-index:1;  position:absolute;">KITCHEN</h3>
                        <img src="<%= contextPath %>/resources/img/product/kitchen_7_img.png" alt="" style="height: 100%; float: right;" >
                    </div>
                </div>
                <div class="col-lg-7 col-sm-6">
                    <div class="single_feature_post_text">
                        <h3 style="margin-top: 277px; margin-left:65%; z-index:1;  position:absolute;">BATHROOM</h3>
                        <a href="<%= contextPath %>/list.pro?categoryNo=4&cpage=1" class="feature_btn">EXPLORE NOW <i class="fas fa-play"></i></a>
                        <img src="<%= contextPath %>/resources/img/product/body_6_img.png" alt="" style="height: 100%; float: right;" >
                    </div>
                </div>
            </div>
        </div>
    </section>





    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>





  <!-- chanllenge area -->

  <section class="product_list section_padding">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-12">
                <div class="section_tittle text-center">
                    <h2 style="text-align:center;">CHALLENGE</h2>
                </div>
            </div>
        </div>


		<div class="row" id="challArea">
			<!-- 챌린지 정보 ajax로 가져오기 -->
		<script>
			$(document).ready(function(){
				$.ajax({
                    url:"<%= contextPath%>/mainSelect.ch",
                    success:function(list){
        				
                    	var txt="";
                    	txt += '<div class="col-lg-12">';
                    	txt += '<div class="row align-items-center justify-content-between">';

                            txt += '<div class="col-lg-5 col-sm-6">';
                            	txt += '<div class="single_product_item">';
                    		
                    		txt += "<img src='/us/"+list[0].challThumbnail + "'>";
                    		txt += '<div class="single_product_text">';
                    		txt += '<br>';
                    		txt += '<h4>' + list[0].challTitle + '</h4>';
                    		txt += '<h5>4월 2일, 세계자폐인의 날</h5>';
                    		txt += '<h5>자폐에 대한 인식을 높이고자</h5>';
                    		txt += '<h5>세계랜드마크에 파란 등을 켜는 캠패인</h5>';
                    		txt += '</div></div></div>';
                                        

                                    txt += '<div class="col-lg-4 col-sm-6 d-flex">';
                                        txt += '<div style="height:100%; align-items: center;">';
                                            txt += '<div class="single_product_item">';
                                                txt += '<div class="single_product_text" style="text-align:center; margin:0px 0px 20px 0px;">';
                                                    txt += '<h4 style="margin: auto;">챌린지 추천추천! 참여참여!</h4> <br>';
                                                    txt += '<h5>챌린지 참여하시고</h5>';
                                                    txt += '<h5>SNS에 올려</h5>';
                                                    txt += '<h5>포인트 받아가세요!</h5>';
                                                txt += '</div></div>';


                                            txt += '<div class="row single_product_item" style="margin-top:10px;">';
                                                    txt += '<div style="width: 100%;">';
                                                        txt += '<img src="/us/'+list[1].challThumbnail + '" style="width: 100%;">';
                                                    txt += '</div>';

                                                    txt += '<div class="col-lg-8 single_product_text" style="margin-top:0px;">';
                                                        txt += '<h4>' + list[1].challTitle + '</h4><br>';
                                                        txt += '<h5>하루에 한가지,</h5>';
                                                        txt += '<h5>한 달에 하루</h5>';
                                                        txt += '<h5>플라스틱을 줄여요!</h5>';
                                                    txt += '</div></div></div></div>';

                                    txt += '<div class="col-lg-3 col-sm-6">';
                                        txt += '<div class="single_product_item">';
                                            txt += '<img src="/us/'+list[2].challThumbnail + '">';
                                            txt += '<div class="single_product_text">';
                                                txt += '<h4>' + list[2].challTitle + '</h4><br>';
                                                txt += '<h5>PLASTIC ISLANDS NO MORE</h5>';
                                                txt += '<h5>텀블러를 사용해주세요!</h5>';
                                                txt += '<h5>플라스틱 프리 챌린지,</h5>';
                                                txt += '<h5>EARTHUS가 함께 실천합니다.</h5>';
                                            txt += '</div></div></div>';
                                            txt += '</div></div></div>';
                                        
                        
                    	$("#challArea").append(txt);
                    },
                    error:function(){
                        console.log("ajax 게시글 삭제 실패");
                    }
                })
			})
		</script>
        	
                  
    </div>
</section>





    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>





    <!--Start of counter-->
    <section id="counter" class="our_offer section_padding" style="padding:50px 0px;">
        <div class="counter_img_overlay">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="counter_header offer_text">
                            <h2 style="text-align:center;">OUR ACHIVEMENT</h2>
                        </div>
                        <!--End of col-md-12-->

                        <!--End of row-->

                        <div class="row align-items-center data_counter">
                            <div class="col counter_block text-center">
                                <div class="counter_item counter-text data-counter-block">
                                    <p>우리가 줄인 플라스틱 제품</p> <br>
                                    <span class="counter" data-to="12000">12,000</span><span>개</span>
                                </div>
                            </div>

                            <div class="col counter_block data_counter text-center">
                                <div class="counter_item data-counter-block counter-text">
                                    <p>후원금액</p> <br>
                                    <span class="counter" data-to="15000000">15,000,000</span><span>원</span>
                                </div>
                            </div>

                            <div class="col counter_block data_counter text-center">
                                <div class="counter_item data-counter-block counter-text">
                                    <p>챌린지를 참여한 분들</p> <br>
                                    <span class="counter" data-to="9854">9,854</span><span>명</span>
                                </div>
                            </div>
                        </div>
                        <!--End of row-->


                        <div class="col col col">
                            <p style="text-align:right;">
                                <span style="color:#778C79; margin-right:40px; font-size:16px;">
                                    * 2022년 6월 기준
                                </span>
                            </p>
                        </div>
                    </div>
                    <!--End of container-->
                </div>
    </section>
    <!--end of counter-->
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	
	
	<%@ include file="/views/common/footerbar.jsp" %>
	
	<!-- jquery plugins here-->
    <script src="<%= contextPath %>/resources/js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="<%= contextPath %>/resources/js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="<%= contextPath %>/resources/js/bootstrap.min.js"></script>
    <!-- easing js -->
    <script src="<%= contextPath %>/resources/js/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="<%= contextPath %>/resources/js/swiper.min.js"></script>
    <!-- swiper js -->
    <script src="<%= contextPath %>/resources/js/masonry.pkgd.js"></script>
    <!-- particles js -->
    <script src="<%= contextPath %>/resources/js/owl.carousel.min.js"></script>
    <script src="<%= contextPath %>/resources/js/jquery.nice-select.min.js"></script>
    <!-- slick js -->
    <script src="<%= contextPath %>/resources/js/slick.min.js"></script>
    <script src="<%= contextPath %>/resources/js/jquery.counterup.min.js"></script>
    <script src="<%= contextPath %>/resources/js/waypoints.min.js"></script>
    <script src="<%= contextPath %>/resources/js/contact.js"></script>
    <script src="<%= contextPath %>/resources/js/jquery.ajaxchimp.min.js"></script>
    <script src="<%= contextPath %>/resources/js/jquery.form.js"></script>
    <script src="<%= contextPath %>/resources/js/jquery.validate.min.js"></script>
    <script src="<%= contextPath %>/resources/js/mail-script.js"></script>
    <!-- custom js -->
    <script src="<%= contextPath %>/resources/js/custom.js"></script>
</body>
</html>