<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.us.order.model.vo.*"%>
<%
	ArrayList<Order> list = (ArrayList<Order>)request.getAttribute("list");
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
                    <h3 class="mt-4" style="font-weight:bold">배송/운송장 관리</h3>
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
                            <option id="sId">ID검색</option>
                            <option id="sCo">상품코드</option>
                        </select>
                        &nbsp;&nbsp;&nbsp;<input type="text" id="text-ih"><button id="s-icon-ih"><i class="bi bi-search"></i></button>
                    </div>
                    <div class="list3-ih" id="ex">
                    	<form action="adUpdateDel.or">
	                        <table>
	                            <tr>
	                                <th>No.</th>
	                                <th>주문 번호</th>
	                                <th>결제일</th>
	                                <th>결제ID</th>
	                                <th>주문 처리 상태</th>
	                                <th width="70">운송장</th>
	                            </tr>
	                            <%for(Order or : list) { %>
	                            <tr>
		                            <input type="hidden" name="orderNo" value="<%=or.getOrderNo()%>">
	                                <td><%=or.getOrderNo() %></td>
	                                <td><%=or.getOrderNo() %></td>
	                                <td><%=or.getOrderDate() %></td>
	                                <td><%=or.getUserId() %></td>
	                                <td><%=or.getDelStatus() %></td>
	                                <td>
	                                	<%if(or.getDelStatus() == 1) {%>
	                                    <button  type="button" id="wb-btn-ih" data-bs-toggle="modal" data-bs-target="#wbModal-ih">발급하기</button>
	                                    <%}else if(or.getDelStatus() == 2) {%>
	                                    <button  id="df-btn-ih">배송완료</button>
	                                    <%}else {%>
	                                    <button id="dis-btn-ih" style="height:100%;" disabled>배송완료</button>
	                                    <%} %>
	                                </td>
	                            </tr>
	                            <%} %>
	                            
	                        </table>
		                    <div class="modal" id="wbModal-ih">
		                        <div class="modal-dialog">
		                            <div class="modal-content">
		                                
		                                <div class="modal-body" align="center">
	                                        <h5 class="modal-title"><b>운송장 번호 입력</b></h5> <br>
	                                        <input type="text" style="width:300px;" name="delNo">
	                                        <br><br>
	                                        <button type="submit" id="mo-btn-ih">확인</button>
		                                    
		                                </div>
		                            </div>
		                        </div>
		                    </div>
                    	</form>
                    </div>
                    
                    
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