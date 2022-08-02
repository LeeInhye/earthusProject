<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

   <%@ include file="/views/common/menubar.jsp" %>

   <div class="container">
        <br><br><br><br><br><br><br><br><br>
        <div>
            <h2 class="menu_sub_title" style="text-align: center;">마이페이지</h2> <br>
        </div>
        <br>
        <hr class="my-hr2"> <br>
        
        <br><br><br><br>
        
        <div class="myPage_main">
            <div class="mpBlock" onclick="location.href='<%= contextPath %>/history.or';">
                <div class="mp_top">
                    <h3>ORDER</h3>
                    <br>
                    <h4>주문 내역 조회</h4>
                </div>
                <hr class="my-hr2" >
                <div class="mp_bottom">
                    <h5>고객님께서 주문하신 상품의 </h5>
                    <h5>상세 내역을 볼 수 있습니다.</h5>
                </div>
            </div>
	
            <div class="mpBlock" onclick="location.href='<%= contextPath %>/CncltExrtr.or';">
                <div class="mp_top">
                    <h3>CANCLE | EXCHANGE | RETURN</h3>
                    <br>
                    <h4>취소 | 교환 | 반품</h4>
                </div>
                <hr class="my-hr2" >
                <div class="mp_bottom">
                    <h5>고객님께서 요청하신</h5>
                    <h5>취소, 교환, 반품에 대한 상세 내용을 보여드립니다.</h5>
                </div>
            </div>

            <div class="mpBlock" onclick="location.href='<%= contextPath %>/goUpdate.me';">
                <div class="mp_top">
                    <h3>PROFILE</h3>
                    <br>
                    <h4>회원 정보 수정</h4>
                </div>
                <hr class="my-hr2" >
                <div class="mp_bottom">
                    <h5>고객님의 개인 정보를 </h5>
                    <h5>관리하는 공간입니다.</h5>
                </div>
            </div>

            <div class="mpBlock" onclick="location.href='<%= contextPath %>/goDelete.me';">
                <div class="mp_top">
                    <h3>DELETE MY ACCOUNT</h3>
                    <br>
                    <h4>회원 탈퇴</h4>
                </div>
                <hr class="my-hr2" >
                <div class="mp_bottom">
                    <h5>비밀번호 확인 후</h5>
                    <h5>회원 탈퇴를 진행할 수 있습니다.</h5>
                </div>
            </div>

            <div class="mpBlock" onclick="location.href='<%= contextPath %>';">
                <div class="mp_top">
                    <h3>WISHLIST</h3>
                    <br>
                    <h4>관심 상품</h4>
                </div>
                <hr class="my-hr2" >
                <div class="mp_bottom">
                    <h5>관심 상품으로 등록하신</h5>
                    <h5>상품들의 목록을 보여드립니다.</h5>
                </div>
            </div>

            <div class="mpBlock" onclick="location.href='<%= contextPath %>/mpList.qa?mqpage=1';">
                <div class="mp_top">
                    <h3>Q&A</h3>
                    <br>
                    <h4>상담 내역</h4>
                </div>
                <hr class="my-hr2" >
                <div class="mp_bottom">
                    <h5>고객님께서 상담하신 내역을</h5>
                    <h5>확인할 수 있습니다.</h5>
                </div>
            </div>

            <div class="mpBlock" onclick="location.href='<%= contextPath %>';">
                <div class="mp_top">
                    <h3>REVIEW</h3>
                    <br>
                    <h4>리뷰 관리</h4>
                </div>
                <hr class="my-hr2" >
                <div class="mp_bottom">
                    <h5>고객님께서 작성하신 리뷰를 </h5>
                    <h5>관리하는 공간입니다.</h5>
                </div>
            </div>

            <div class="mpBlock" onclick="location.href='<%= contextPath %>';">
                <div class="mp_top">
                    <h3>POINT</h3>
                    <br>
                    <h4>포인트</h4>
                </div>
                <hr class="my-hr2" >
                <div class="mp_bottom">
                    <h5>적립금은 상품 구매 시</h5>
                    <h5>사용하실 수 있습니다.</h5>
                </div>
            </div>
	
		</div>
	
   </div>
   
   <br><br><br><br><br><br><br><br><br>
   
   <%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>