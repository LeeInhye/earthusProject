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
                    <h1>Q&A 관리</h1>
                    <hr class="my-hr2">

                    <br><br>
                    <div style="width: 80%" class="main_width">
                        <table class="M_member_table table">
                            <thead>
                                <tr class="table_thead_border" style="border-bottom: none;">
                                    <th width="2%"><input type="checkbox"></th>
                                    <th width="5%">번호</th>
                                    <th width="10%">처리상태</th>
                                    <th width="30%">제목</th>
                                    <th width="7%">작성일</th>
                                    <th width="8%">답변</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- 값은 다 DB와 연결될 것 -->
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td>5</td>
                                    <td>처리중</td>
                                    <td>이거 색상이 원래 이런가요? 별룬디"</td>
                                    <td>2021-09-22</td>
                                    <!-- 처리상태가 대기중이면 답변하기 -->
                                    <td>
                                        <button class="btn btn-sm btn_black">답변하기</button>
                                    </td>

                                </tr>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td>5</td>
                                    <td>처리완료</td>
                                    <td>상품 품질이 별로네요. 교환신청합니다.</td>
                                    <td>2021-09-22</td>
                                    <!-- 처리상태가 처리완료면 답변수정  -->
                                    <td>
                                        <button class="btn btn-sm btn_gray">답변수정</button>
                                    </td>

                                </tr>



                            </tbody>
                        </table>
                        <br><br>
                        
                        <div class="btn_two_spacing">
                            <button class="btn btn_black btn-sm">선택삭제</button>
                        </div>
                    </div>




                </div>
                </main>

        </div>
   </div>
   
   

</body>
</html>