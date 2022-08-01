<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

   <%@include file = "/views/common/adminMenubar.jsp" %>
   
   <div id="layoutSidenav">
       <div id="layoutSidenav_content">
            <main>
                <div class="su_padding_all notice_text">
                    <h1>공지사항 > 조회/수정/등록</h1>
                    <hr class="my-hr2">

                    <br><br>
                    <div style="width: 80%" class="main_width">
                        <div>
                           <select name="" class="form-select select_category">
                                <option value="" selected>공지사항</option>
                                <option value="">배송안내</option>
                                <option value="">이벤트</option>
                                <option value="">채용공고</option>
                           </select>
                            
                        </div>

                        <br><br><br>  

                        <h4><b>제목</b></h4>
                        <input type="text">

                        <br><br><br>

                        <h4><b>내용</b></h4>
                        <textarea></textarea>

                        <br><br><br><br>

                        <div class="btn_two_big_btn">
                            <button class="btn btn_gray btn_big btn-lg">취소</button>
                            <button class="btn btn_black btn_big btn-lg">등록</button>
                        </div>
                    </div>

                    <br><br><br>

                </div>
            </main>

        </div>
   </div>
   
   

</body>
</html>