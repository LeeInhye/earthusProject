<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.us.order.model.vo.*, com.us.common.model.vo.PageInfo"%>
<%
	ArrayList<Order> list = (ArrayList<Order>)request.getAttribute("list");

	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	
	<%@include file = "../common/adminMenubar.jsp" %>

    <div id="layoutSidenav">
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <br>
                    <h3 class="mt-4" style="font-weight:bold">구매 내역 조회</h3>
                    <hr>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item active"></li>
                    </ol>
                    
                    <div id="list1-ih">
                        <span>기간별 검색</span>&nbsp;
                        <button class="d-btn-ih" id="d1-ih">전체</button><button class="d-btn-ih" id="d2-ih">오늘</button><button class="d-btn-ih" id="d3-ih">7일</button><button class="d-btn-ih" id="d4-ih">30일</button>&nbsp;&nbsp;&nbsp;

                        <input type="date" class="date-ih" id="n1-ih">
                        <span>~</span>
                        <input type="date" class="date-ih" id="n2-ih">
                        <button style="background:rgb(13,13,13); color:white;">조회</button>
                    </div>
                    <br>
                    <div id="list2-ih">
                        <select id="sel-ih">
                            <option>ID검색</option>
                            <option>상품코드</option>
                        </select>
                        &nbsp;&nbsp;&nbsp;<input type="text" id="text-ih"><button id="s-icon-ih"><i class="bi bi-search"></i></button>
                    </div>
                    <div class="list3-ih">
                        <table>
                            <tr>
                                <th>No.</th>
                                <th>주문 번호</th>
                                <th>결제일</th>
                                <th>결제ID</th>
                                <th>주문 처리 상태</th>
                            </tr>
                        	<%for(Order or : list){ %>
                            <tr>
                                <td><%=or.getOrderNo() %></td>
                                <td><%=or.getOrderNo() %></td>
                                <td><%=or.getOrderDate() %></td>
                                <td><%=or.getUserId() %></td>
                                <%if(or.getDelStatus() == 1) {%>
                                	 <td>상품준비중</td>
                                <%}else if(or.getDelStatus() == 2) {%>
                                	 <td>배송중</td>
                                <%}else if(or.getDelStatus() == 3) {%>
                                	 <td>배송완료</td>
                                <%}else if(or.getDelStatus() == 4) {%>
                                	 <td>주문취소</td>
                                <%}else if(or.getDelStatus() == 5) {%>
                                	 <td>교환</td>
                                <%}else {%>
                                	 <td>반품</td>
                                <%} %>
                            </tr>
                            <%} %>
                        </table>
                    </div>
                    <!-- 페이징바 영역 -->
			       <div class="paging-area" align="center">
			        	<% if(currentPage != 1) { %>
			            	<button onclick="location.href='<%=contextPath%>/adHistory.or?cpage=<%= pi.getCurrentPage()-1 %>';" class="btn btn_black">&lt;</button>
						<% } %>
						
						<% for(int p=startPage; p<=endPage; p++) { %>
				            <% if(p == currentPage){ %>
				            	<button class="btn btn_gray" disabled><%= p %></button>
				            <% }else { %>
				            	<button class="btn btn_black" onclick="location.href='<%=contextPath%>/adHistory.or?cpage=<%= p %>';"><%= p %></button>
							<% } %>
						<% } %>
						
						<% if(currentPage != maxPage) { %>
			            <button onclick="location.href='<%=contextPath%>/adHistory.or?cpage=<%= pi.getCurrentPage()+1 %>';" class="btn btn_black">&gt;</button>
			            <% } %>
			       </div>
			       <!-- 페이징바 영역 끝 -->
                </div>
            </main>
            
        </div>
    </div>

    <script>
        let today = new Date();
        let year = today.getFullYear();
        let month = today.getMonth()+1 > 9 ? today.getMonth()+1 : "0" + (today.getMonth()+1);
        let day = today.getDate() > 9 ? today.getDate() : "0" + today.getDate();
        today = year + "-" + month + "-" + day;
        let m7 = year + "-" + month + "-" + (day-7);
        let m30 = year + "-" + ((parseInt(month)-1) > 9 ? (parseInt(month)-1) : "0"+(parseInt(month)-1)) + "-" + day;
        
        document.getElementById("n1-ih").setAttribute("value",today);
        document.getElementById("n2-ih").setAttribute("value",today);
        document.getElementById("n2-ih").setAttribute("max",today);

        $(function(){
            $(".d-btn-ih").click(function(d){
                if(d.target.id == "d1-ih"){
                    $("#d1-ih").css("backgroundColor","lightgray");
                    $("#n1-ih").val("2021-04-11");
                    $("#d2-ih,#d3-ih,#d4-ih").css("backgroundColor","white");
                }else if(d.target.id == "d2-ih"){
                    $("#d2-ih").css("backgroundColor","lightgray");
                    $("#n1-ih").val(today);
                    $("#d1-ih,#d3-ih,#d4-ih").css("backgroundColor","white");
                }else if(d.target.id == "d3-ih"){
                    $("#d3-ih").css("backgroundColor","lightgray");
                    $("#n1-ih").val(m7);
                    $("#d1-ih,#d2-ih,#d4-ih").css("backgroundColor","white");
                }else{
                    $("#d4-ih").css("backgroundColor","lightgray");
                    $("#n1-ih").val(m30);
                    $("#d1-ih,#d2-ih,#d3-ih").css("backgroundColor","white");
                }
            })

            
        })
    </script>
	
</body>
</html>