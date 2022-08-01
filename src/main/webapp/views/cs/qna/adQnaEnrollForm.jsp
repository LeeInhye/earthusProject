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
                    <h1>Q&A 답변 등록</h1>
                    <hr class="my-hr2">

                    <br><br>
                    <div style="width: 80%" class="main_width">
                        <table class="M_qna_table table table-bordered">
                            <tr>
                                <th>제목</th>
                                <td>사은품이 빠졌어요</td>
                            </tr>
                            <tr>
                                <th>작성자</th>
                                <td>김지구</td>
                            </tr>
                            <tr>
                                <th>작성일</th>
                                <td>2022-05-01</td>
                            </tr>
                            <tr>
                                <th>첨부파일</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th>내용</th>
                                <td>
                                    <div style="height:200px; overflow: auto;">
                                        <p>
                                            이벤트 응모해서 사은품 신청했는데 빠졌어요 <br>
                                            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                                            다시 보내주세요.
                                        </p>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th style="height: 120px;">답변</th>
                                <td>
                                    <div style="height: 120px; overflow: auto;">
                                        <textarea placeholder="내용을 입력해주세요"></textarea>
                                    </div>
                                </td>
                            </tr>
                        </table>

                        <br><br>

                        <div class="btn_right">
                            <button class="btn btn_gray">돌아가기</button>
                            &nbsp;&nbsp;
                            <button class="btn btn_black">답변등록</button>
                        </div>
                    </div>



                </div>
            </main>

        </div>
   </div>
   
   

</body>
</html>