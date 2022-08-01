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
                    <h1>자주 묻는 질문</h1>
                    <hr class="my-hr2">

                    <br><br>
                    <div style="width: 80%" class="main_width">
                        <table class="M_member_table table faq_table">
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
                                <tr data-toggle="modal" data-target="#updateFAQ">
                                    <td><input type="checkbox"></td>
                                    <td>5</td>
                                    <td>주문/결제</td>
                                    <td>추석연휴로 배송이 지연됩니다.</td>
                                    <td>2021-09-22</td>
                                    <td>9285</td>

                                </tr>



                            </tbody>
                        </table>
                        <br><br>

                        <div class="btn_two_spacing">
                            <button class="btn btn_black btn-sm">선택삭제</button>
                            <button class="btn btn_black btn-sm" data-toggle="modal" data-target="#insertFAQ"
                                style="width: 74px;">등록</button>
                        </div>


                        <div class="modal" id="insertFAQ">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">

                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h4 class="modal-title"><b>** 자주 묻는 질문 등록</b></h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <hr class="my-hr2">
                                    </div>


                                    <!-- Modal body -->
                                    <div class="modal-body">
                                        <br>
                                        <select name="" class="form-select select_category">
                                            <option value="" selected>주문/결제</option>
                                            <option value="">배송</option>
                                            <option value="">취소/환불</option>
                                            <option value="">교환/반품</option>
                                            <option value="">기타</option>
                                        </select>

                                        <br><br>

                                        <div class="faq_text">
                                            <h4><b>질문</b></h4>
                                            <input type="text">
                                            
                                            <br><br>
                                            <h4><b>답변</b></h4>
                                            <textarea></textarea>

                                        </div>

                                    </div>

                                    <!-- Modal footer -->
                                    <div class="modal-footer">
                                        <hr class="my-hr2">
                                        <button class="btn btn_gray btn_medium" data-dismiss="modal">취소</button>
                                        <button class="btn btn_black btn_medium" data-dismiss="modal">등록</button>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!--  입력했던 값 출력시켜놓기 -->
                        <div class="modal" id="updateFAQ">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">

                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h4 class="modal-title"><b>** 자주 묻는 질문 조회/수정</b></h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <hr class="my-hr2">
                                    </div>


                                    <!-- Modal body -->
                                    <div class="modal-body">
                                        <br>
                                        <select name="" class="form-select select_category">
                                            <option value="" selected>주문/결제</option>
                                            <option value="">배송</option>
                                            <option value="">취소/환불</option>
                                            <option value="">교환/반품</option>
                                            <option value="">기타</option>
                                        </select>

                                        <br><br>

                                        <div class="faq_text">
                                            <h4><b>질문</b></h4>
                                            <input type="text">
                                            
                                            <br><br>
                                            <h4><b>답변</b></h4>
                                            <textarea></textarea>

                                        </div>

                                    </div>

                                    <!-- Modal footer -->
                                    <div class="modal-footer">
                                        <hr class="my-hr2">
                                        <button class="btn btn_gray btn_medium" data-dismiss="modal">취소</button>
                                        <button class="btn btn_black btn_medium" data-dismiss="modal">수정 확인</button>
                                    </div>

                                </div>
                            </div>
                        </div>



                    </div>


                </div>
            </main>

        </div>
   </div>
   
   

</body>
</html>