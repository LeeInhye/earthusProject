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
        
        <h2 class="menu_sub_title">Q&A 작성</h2> <br>
        <h5>
            ※고객센터 운영시간(10:00 ~ 18:00) 이후 문의는 고객센터 운영시간 내에 순차적으로 답변드립니다.
        </h5>
        <hr class="my-hr2"> <br>
        
        <div class="qna_insert_success">
            <div class="qna_insert_img">
                <img src="<%= contextPath %>/resources/img/sub_logo.png" style="width: 100%; height: 100%;">
            </div>
        </div>

        <div class="enroll_padding qna_centered">
            <span style="color:rgb(119, 140, 121); font-weight: 900; font-size:35px;">✓</span>
            <span style="font-size: 25px;"><b>Q&A가 작성되었습니다.</b></span>
            <br><br>
            <p style="font-size: 17px; font-weight: 400;">
                마이페이지 > Q&A 내역 또는 메뉴 > Contact > Q&A 게시판에서 조회 가능합니다. <br>
                빠른 시일 내에 답변드리도록 최선을 다하겠습니다. <br>
                감사합니다. <br>
            </p>
            
            <br>
            
            <br>
            <div class="btn_center">
                <button type="button" class="btn btn_green" style="width: 250px; height:40px;" 
                onclick="location.href='<%= contextPath %>/list.qa?qpage=1';">Q&A 내역으로</button>
            </div>
        </div>

        
    </div>
    <br><br><br><br><br><br><br><br><br>
   
   <%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>