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
                    <h3 class="mt-4" style="font-weight:bold">취소/교환/반품 관리</h3>
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
                    <div id="btn-list-ih" align="center">
                        <button name="s-btn" value="4" id="can" onclick="showDiv(this);">취소</button> |
                        <button name="s-btn" value="5" id="ex" onclick="showDiv(this);">교환</button> |
                        <button name="s-btn" value="6" id="re" onclick="showDiv(this);">반품</button>
                    </div>
                    <div class="list3-ih" id="canBox-ih">
                        <table>
                            <tr>
                                <th width="50">No.</th>
                                <th>주문 번호</th>
                                <th>상품 코드</th>
                                <th>결제일</th>
                                <th>결제ID</th>
                                <th>주문 처리 상태</th>
                            </tr>
                        	<%for(Order or : list) {%>
                            <tr>
                                <td><%=or.getOrderNo() %></td>
                                <td><%=or.getOrderNo() %></td>
                                <td><%=or.getProCode() %></td>
                                <td><%=or.getOrderDate() %></td>
                                <td><%=or.getUserId() %></td>
                                <td><%=or.getDelStatus() %></td>
                            </tr>
							<%} %>
                        </table>
                    </div>

                    <div class="list3-ih" id="exBox-ih" style="display:none;">
                        <table>
                            <tr>
                                <th width="50">No.</th>
                                <th>주문 번호</th>
                                <th>상품 코드</th>
                                <th>결제일</th>
                                <th>결제ID</th>
                                <th>주문 처리 상태</th>
                                <th>배송비</th>
                            </tr>
                            <%for(Order or : list) {%>
                            <tr>
                                <td><%=or.getOrderNo() %></td>
                                <td><%=or.getOrderNo() %></td>
                                <td><%=or.getProCode() %></td>
                                <td><%=or.getOrderDate() %></td>
                                <td><%=or.getUserId() %></td>
                                <td><%=or.getDelStatus() %></td>
                                <td>6000</td>
                            </tr>
                            <%} %>
                        </table>
                    </div>

                    <div class="list3-ih" id="reBox-ih" style="display:none;">
                        <table>
                            <tr>
                                <th width="50">No.</th>
                                <th>주문 번호</th>
                                <th>상품 코드</th>
                                <th>결제일</th>
                                <th>결제ID</th>
                                <th>주문 처리 상태</th>
                                <th>배송비</th>
                                <th width="100">수령</th>
                            </tr>
                            <%for(Order or : list) {%>
                            <tr>
                                <td><%=or.getOrderNo() %></td>
                                <td><%=or.getOrderNo() %></td>
                                <td><%=or.getProCode() %></td>
                                <td><%=or.getOrderDate() %></td>
                                <td><%=or.getUserId() %></td>
                                <td><%=or.getDelStatus() %></td>
                                <td>6000</td>
                                <td>
                                    <select id="yn-ih">
                                        <option>Y</option>
                                        <option>N</option>
                                    </select>
                                </td>
                            </tr>
                            <%} %>
                        </table>
                    </div>
                    <!-- 페이징바 영역 -->
			       <div class="paging-area" align="center">
			        	<% if(currentPage != 1) { %>
			            	<button onclick="location.href='<%=contextPath%>/adCncltExrtr.or?cpage=<%= pi.getCurrentPage()-1 %>';" class="btn btn_black">&lt;</button>
						<% } %>
						
						<% for(int p=startPage; p<=endPage; p++) { %>
				            <% if(p == currentPage){ %>
				            	<button class="btn btn_gray" disabled><%= p %></button>
				            <% }else { %>
				            	<button class="btn btn_black" onclick="location.href='<%=contextPath%>/adCncltExrtr.or?cpage=<%= p %>';"><%= p %></button>
							<% } %>
						<% } %>
						
						<% if(currentPage != maxPage) { %>
			            <button onclick="location.href='<%=contextPath%>/adCncltExrtr.or?cpage=<%= pi.getCurrentPage()+1 %>';" class="btn btn_black">&gt;</button>
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

        function showDiv(page){
            const list = document.getElementsByClassName("list3-ih");

            for(let i=0; i<list.length; i++){
                if(btn.id+"Box-ih" == list[i].id){
                    list[i].style.display = "block";
                }else{
                    list[i].style.display = "none";
                }
            }
            
            $.ajax({
				 url:"<%= contextPath%>/adCncltExrtr.or",
                data:{status:$("button[name=s-btn]").val(),
               	   cpage:page},
                success:function(map){
                	let contextPath = "<%=contextPath%>";
   					let pi = map.pi;
   					let list = map.list;
   				
   				let value = ""; // 댓글 리스트 
   				let paging = ""; // 페이징 처리
   				
				// 취/교/반 리스트
				if(list[i].delStatus == 4) {
						
					value += "<tr>"
						   + "<td>" + list[i].orderNo + "</td>"
						   + "<td>" + list[i].orderNo + "</td>"
						   + "<td>" + list[i].proCode +"</td>"
						   + "<td>" + list[i].orderDate + "</td>"
						   + "<td>" + list[i].userId + "</td>"
						   + "<td>" + list[i].delStatus + "</td>"
						   + "</tr>";
				}else if(list[i].delStatus == 5) {
					
					value += "<tr>"
						   + "<td>" + list[i].orderNo + "</td>"
						   + "<td>" + list[i].orderNo + "</td>"
						   + "<td>" + list[i].proCode +"</td>"
						   + "<td>" + list[i].orderDate + "</td>"
						   + "<td>" + list[i].userId + "</td>"
						   + "<td>" + list[i].delStatus + "</td>"
						   + "<td> 6000 </td>"
						   + "</tr>";
				}else{
					value += "<tr>"
						   + "<td>" + list[i].orderNo + "</td>"
						   + "<td>" + list[i].orderNo + "</td>"
						   + "<td>" + list[i].proCode +"</td>"
						   + "<td>" + list[i].orderDate + "</td>"
						   + "<td>" + list[i].userId + "</td>"
						   + "<td>" + list[i].delStatus + "</td>"
						   + "<td> 6000 </td>"
						   + "<td><select id='yn-ih'>"
				                          + "<option>Y</option>"
				                          + "<option>N</option>"
				                      	   + "</select></td>"
						   + "</tr>";
				}

   					
       				// 페이징바
       				if(pi.currentPage != 1) {
       					paging += '<button onclick="selectStatus(' + (pi.currentPage-1) + ');" class="btn btn_black">&lt;</button>';
       				}
       				
       				
       				for(let p=pi.startPage; p<=pi.endPage; p++){
       					
       					if(p == pi.currentPage){
       						paging += '<button class="btn btn_gray" disabled>' +  p + '</button>';
       					}else{
       						paging += '<button onclick="selectStatus(' + p + ');" class="btn btn_black">' + p + '</button>';
       					}
       					
       				}
       				
       				if(pi.currentPage != pi.maxPage) {
   						paging += '<button onclick="selectStatus(' + (pi.currentPage+1) + ');" class="btn btn_black">&gt;</button>';
       				}
   					
   				}
   				
               	$(".class").html(value);
				 	$(".paging-area").html(paging); 
    					
                },
                error:function(){
                    console.log("ajax 데이터 조회 실패")
                }
			 })
			 
        }
        
    </script>
	
</body>
</html>