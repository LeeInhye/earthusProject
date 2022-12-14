<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

	<%@include file="../common/adminMenubar.jsp"%>

	<div id="layoutSidenav">
		<!-- 내부 시작 -->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<br>
					<h3 class="mt-4" style="font-weight: bold">관리자 페이지</h3>
					<hr>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active"></li>
					</ol>
					<div class="row">
						<div class="count1-ih">
							<div action="" align="center">
								<h4 style="font-weight: bold">120</h4>
								<h6>총 판매량</h6>
							</div>
						</div>
						<div class="count1-ih">
							<div action="" align="center">
								<h4 style="font-weight: bold">1,800,000</h4>
								<h6>총 판매금액</h6>
							</div>
						</div>
						<div class="count1-ih">
							<div action="" align="center">
								<h4 style="font-weight: bold">30</h4>
								<h6>회원수</h6>
							</div>
						</div>
						<div class="count1-ih">
							<div action="" align="center">
								<h4 style="font-weight: bold">3</h4>
								<h6>답변 대기중인 Q&A</h6>
							</div>

						</div>
						<br>
						<br>

						<div class="row">
							<div class="main-list1-ih st">
								<div>
									<h5>회원 관리</h5>
									<hr>
									<h6>
										<a href="<%= contextPath %>/adList.me?mpage=1">회원 정보 관리</a>
									</h6>
									<h6>
										<a href="">포인트 관리</a>
									</h6>
									&nbsp;&nbsp;<a href="<%= contextPath %>/history.po?cpage=1">내역
										조회</a><br> &nbsp;&nbsp;<a
										href="<%= contextPath %>/adList.po?cpage=1">적립/회수</a>
								</div>
							</div>
							<div class="main-list1-ih st">
								<div>
									<h5>주문 관리</h5>
									<hr>
									<a href="<%=contextPath%>/adHistory.or?cpage=1">구매 내역 조회</a> <br>
									<a href="<%=contextPath%>/adCncltExrtr.or?cpage=1">취소/교환/반품
										관리</a>
								</div>
							</div>
							<div class="main-list1-ih st">
								<div>
									<h5>배송 관리</h5>
									<hr>
									<a href="<%=contextPath%>/adDel.or?cpage=1">배송/운송장 관리</a>
								</div>
							</div>
							<div class="main-list1-ih">
								<div>
									<h5>
										상품 관리</a>
									</h5>
									<hr>
									<h6>
										<a href="">상품</a>
									</h6>
									&nbsp;&nbsp;<a href="<%=contextPath%>/insertForm.pr">등록</a><br>
									&nbsp;&nbsp;<a href="<%= contextPath %>/adlist.pr?cpage=1">상품
										조회</a><br> &nbsp;&nbsp;<a
										href="<%=contextPath%>/adlist.pq?cpage=1">상품 문의 관리</a><br>
									&nbsp;&nbsp;<a href="">리뷰 관리</a><br>

								</div>
							</div>
							<div class="main-list2-ih">
								<div>
									<h5>홈페이지 관리</h5>
									<hr>
									<a href="<%= contextPath %>/editor1.hm">회사 소개 관리</a> <br>
									<a href="<%= contextPath %>/editor2.hm">이용 약관 관리</a> <br>
									<a href="<%= contextPath %>/list.bn">배너 관리</a>
								</div>
							</div>
							<div class="main-list2-ih">
								<div>
									<h5>커뮤니티 관리</h5>
									<hr>
									<a href="<%= contextPath %>/adList.co?cpage=1">콘텐츠 관리</a> <br>
									<a href="<%= contextPath %>/adList.ch?cpage=1">챌린지 관리</a> <br>
									<a href="<%= contextPath %>/adCmntMain.ch?cpage=1">챌린지 댓글
										관리</a>
								</div>
							</div>

							<div class="main-list2-ih">
								<div>
									<h5>고객센터</h5>
									<hr>
									<a href="<%= contextPath %>/adList.no?npage=1">공지사항 관리자</a> <br>
									<a href="<%= contextPath %>/adList.fq?fpage=1">자주 묻는 질문 관리</a>
									<br> <a href="<%= contextPath %>/adList.qa?qpage=1">Q&A
										관리</a>
								</div>
							</div>
						</div>

					</div>
				</div>
			</main>
		</div>
		<!-- 내부 끝 -->

	</div>
</body>
</html>