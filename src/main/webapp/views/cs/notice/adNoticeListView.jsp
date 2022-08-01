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
                <div class="su_padding_all">
                    <h1>공지사항</h1>
                    <hr class="my-hr2">

                    <br><br>
                    <div style="width: 80%" class="main_width">
                        <table class="M_member_table table">
                            <thead>
                                <tr class="table_thead_border" style="border-bottom: none;">
                                    <th width="2%"><input type="checkbox"></th>
                                    <th width="5%">번호</th>
                                    <th width="10%">카테고리</th>
                                    <th width="30%">제목</th>
                                    <th width="10%">작성일</th>
                                    <th width="5%">조회수</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- 값은 다 DB와 연결될 것 -->
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td>5</td>
                                    <td>배송안내</td>
                                    <td>추석연휴로 배송이 지연됩니다.</td>
                                    <td>2021-09-22</td>
                                    <td>9285</td>

                                </tr>



                            </tbody>
                        </table>
                        <br><br>
                        
                        <div class="btn_two_spacing">
                            <button class="btn btn_black btn-sm">선택삭제</button>
                            <button class="btn btn_black btn-sm">새글작성</button>
                        </div>
                    </div>


                </div>
            </main>

        </div>
   </div>
   
</body>
</html>