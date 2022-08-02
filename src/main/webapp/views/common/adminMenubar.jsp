<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.us.member.model.vo.Member"%>
<% 
	String contextPath = request.getContextPath(); 
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Earth.Us-Admin</title>
	<link rel="icon" href="<%= contextPath %>/resources/img/sub_logo.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="<%= contextPath %>/resources/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="<%= contextPath %>/resources/css/u_css_sumin/font-pretendard.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <style>
        .nav a{font-weight:bold;}
    </style>
</head>
<body class="sb-nav-fixed">

    <!-- 상단+사이드 메뉴바 시작 -->
    <nav class="sb-topnav navbar navbar-expand navbar-dark " style="background:#778C79;">
        <!-- 로고 들어가는 자리 -->
        <a class="navbar-brand ps-3" href="<%=contextPath%>/main.ad"><img src="<%= contextPath %>/resources/assets/img/logo(admin).jpg" style="box-sizing:border-box; width:100px;"></a>
        <!-- 사이드 메뉴바 접고 펼치는 버튼 -->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
        <!-- 공간배치때문에 남겨둔 요소 신경xx -->
        <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            <div class="input-group">
            </div>
        </form>
        <!-- 로그아웃 -->
        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="<%= contextPath %>">Main</a></li>
                    <li><a class="dropdown-item" href="<%= contextPath %>/logout.me">Logout</a></li>
                </ul>
            </li>
        </ul>
    </nav>
    
    <!-- 내용 넣을때도 꼭 div id="layoutSidenav"로 묶고 시작하기 -->
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion" style="background:#778C79;">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading"></div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                            회원관리
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="<%= contextPath %>/adList.me?mpage=1">회원 정보 관리</a>
                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                    포인트 관리
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="">내역 조회</a>
                                        <a class="nav-link" href="">적립/회수</a>
                                    </nav>
                                </div>
                            </nav>
                        </div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                            상품관리
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                    상품
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="<%=contextPath%>/insertForm.pr">등록</a>
                                        <a class="nav-link" href="<%=contextPath%>/adlist.pr?cpage=1">조회</a>
                                        <a class="nav-link" href="">상품 문의 관리</a>
                                        <a class="nav-link" href="">리뷰 관리</a>
                                        <a class="nav-link" href="">상품 재고</a>
                                    </nav>
                                </div>
                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                    통계
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="">상품 판매량</a>
                                        <a class="nav-link" href="">찜 횟수</a>
                                    </nav>
                                </div>
                            </nav>
                        </div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#orderCollapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                            주문관리
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="orderCollapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="<%=contextPath%>/adHistory.or">구매 내역 조회</a>
                                <a class="nav-link" href="<%=contextPath%>/adCncltExrtr.or">취소/교환/반품 관리</a>
                            </nav>
                        </div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#delCollapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                            배송관리
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="delCollapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="<%=contextPath%>/adDel.or">배송/운송장 관리</a>
                            </nav>
                        </div>
                        <div class="collapse" id="delCollapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                        </div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#hpCollapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                            홈페이지 관리
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="hpCollapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="<%= contextPath %>/editor1.hm">회사 소개 관리</a>
                                <a class="nav-link" href="<%= contextPath %>/editor2.hm">이용 약관 관리</a>
                                <a class="nav-link" href="<%= contextPath %>/list.bn">배너 관리</a>
                            </nav>
                        </div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#cmCollapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                            커뮤니티 관리
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="cmCollapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="<%= contextPath %>/adList.co?cpage=1">콘텐츠 관리</a>
                                <a class="nav-link" href="<%= contextPath %>/adList.ch?cpage=1">챌린지 관리</a>
                                <a class="nav-link" href="">챌린지 댓글 관리</a>
                            </nav>
                        </div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#qaCollapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                            고객센터
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="qaCollapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="<%= contextPath %>/adList.no?npage=1">공지사항 관리</a>
                                <a class="nav-link" href="<%= contextPath %>/adList.fq?fpage=1">자주 묻는 질문 관리</a>
                                <a class="nav-link" href="<%= contextPath %>/adList.qa?qpage=1">Q&A 관리</a>
                            </nav>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
        <!-- 상단+사이드 메뉴바 끝 -->
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="<%= contextPath %>/resources/js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="<%= contextPath %>/resources/js/datatables-simple-demo.js"></script>
</body>
</html>