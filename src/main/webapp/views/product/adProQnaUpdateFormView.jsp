<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.us.product.model.vo.ProQna" %>
<%
	ProQna pq = (ProQna)request.getAttribute("pq");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 문의 등록 - Admin</title>
<style>
textarea {
	font-size:small !important;
}
button {
	height:35px !important;
}
</style>
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
                        <form action="<%=contextPath%>/update.pq" method="post">
                            <table width="60%" style="margin:auto;" id="proQnaAns-tb">
                                <tr height="50px">
                                    <td width="10%">No. <%=pq.getProQnaNo()%></td>
                                    <td width="30%"></td>
                                    <td width="30%"></td>
                                    <td width="30%"></td>
                                </tr>
                                <tr>
                                    <td>작성자</td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="<%=pq.getProQnaWriterName()%>" disabled>
                                    </td>
                                    <td style="text-align:right;">작성일</td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="<%=pq.getProQEnrollDate()%>" disabled>
                                    </td>
                                </tr>
                                <tr>
                                    <td>상품정보</td>
                                    <td colspan="3">
                                        <input type="text" class="form-control" placeholder="<%=pq.getProName()%>" disabled>
                                    </td>
                                </tr>
                                <tr>
                                    <td>제목</td>
                                    <td colspan="3">
                                        <input type="text" class="form-control" placeholder="<%=pq.getProQnaTitle()%>" disabled>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align:top;">내용</td>
                                    <td colspan="3">
                                        <textarea class="form-control" rows="4" value="" disabled
                                         style="resize:none; color:gray;"><%=pq.getProQnaContent()%></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align:top;">* 답변</td>
                                    <td colspan="3">
                                        <textarea class="form-control" name="proAContent" id="proAContent"
                                        rows="5" style="resize:none;" required></textarea>
                                        <input type="hidden" name="proQnaNo" value="<%=pq.getProQnaNo()%>">
                                    
                                    </td>
                                </tr>
                            </table>

                            <div style="text-align:center; margin-top:50px; margin-bottom:50px;">
                                <button class="btn pro-a-btn" style="line-height:20px">등록</button>
                                <button type="button" onclick="$(#cencelModal).modal('show')" 
                                class="btn pro-a-btn" style="line-height:20px; color:black; background:#f2f2f2;">취소</button>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </main>
          </div>      
	
	</div>
    
    <!------ 모달 ------>
    <!-- 답변 등록 취소 모달 -->
    <!-- The Modal -->
	  <div class="modal fade" id="cencelModal">
	    <div class="modal-dialog modal-sm">
	      <div class="modal-content" style="text-align:center;">
	        
	        <!-- Modal body -->
	        <div class="modal-body">
	          답변 등록을 취소하시겠습니까?
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <button type="button" class="btn" data-dismiss="modal" style="background:#lightgray; color:#404040">취소</button>
	          <button type="button" class="btn" onclick="<%=contextPath%>/list.pq?cpage=1"
	          		style="background:#778c79; color:#f2f2f2">확인</button>
	        </div>
	        
	      </div>
	    </div>
	  </div>

</body>
</html>