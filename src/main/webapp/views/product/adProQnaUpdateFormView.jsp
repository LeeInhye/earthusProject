<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 문의 등록 - Admin</title>

</head>
<body>

<%@ include file="../common/adminMenubar.jsp" %>

	<div id="layoutSidenav">
	
		<div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <div class="container productQnaAns">
                        <h3 class="mt-4" style="font-weight:bold;">상품 > 상품 문의 관리</h3>
                        <hr><br>

                        <div class="container pro-qna-ans-area">
                            <table width="60%" style="margin:auto;">
                                <tr height="50px">
                                    <td width="10%">No. 12</td>
                                    <td width="30%"></td>
                                    <td width="30%"></td>
                                    <td width="30%"></td>
                                </tr>
                                <tr>
                                    <td>작성자</td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="user11" disabled>
                                    </td>
                                    <td style="text-align:right;">작성일</td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="2022.07.04" disabled>
                                    </td>
                                </tr>
                                <tr>
                                    <td>상품정보</td>
                                    <td colspan="3">
                                        <input type="text" class="form-control" placeholder="더 새틴 린스바" disabled>
                                    </td>
                                </tr>
                                <tr>
                                    <td>제목</td>
                                    <td colspan="3">
                                        <input type="text" class="form-control" placeholder="배송전 교환문의" disabled>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align:top;">내용</td>
                                    <td colspan="3">
                                        <textarea class="form-control" rows="4" value="" disabled
                                         style="resize:none; color:gray;">글</textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align:top;">* 답변</td>
                                    <td colspan="3">
                                        <textarea class="form-control" name="pro-qna-a-content" id="pro-qna-a-content"
                                        rows="4" style="resize:none;" required></textarea>
                                    </td>
                                </tr>
                            </table>

                            <div style="text-align:center; margin-top:50px; margin-bottom:50px;">
                                <button class="btn pro-a-btn" style="line-height:20px" onclick="ansInsert();">등록</button>
                                <button class="btn pro-a-btn" style="line-height:20px; color:black; background:#f2f2f2;">취소</button>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
          </div>      
	
	</div>
	
    <script>
        function ansInsert(){
            if(confirm("답변을 등록하시겠습니까?")){
                // 해당 문의의 답변 update 후
                alert("답변이 등록되었습니다.");
                // 상품 문의 조회 페이지로 돌아가기
                location.href = "pro-qna-main.html";
                // 해당 문의의 답변하기 버튼 disabled 속성 부여
            }
        }
    </script>

</body>
</html>