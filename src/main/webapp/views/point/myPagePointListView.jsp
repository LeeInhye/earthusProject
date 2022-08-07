<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page 
	import="java.util.ArrayList, com.us.point.model.vo.Point, com.us.common.model.vo.PageInfo, java.sql.Date, com.us.member.model.vo.Member"
%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Point> list = (ArrayList<Point>)request.getAttribute("list");
	Date firstDate = (Date)request.getAttribute("firstDate"); 
	Date lastDate = (Date)request.getAttribute("lastDate"); 
	Member m = (Member)session.getAttribute("loginUser");
		
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	int lastIdx = list.size() - 1;
%>
<!DOCTYPE html>
<html>
<head>
    <style>
        .mypoint{
          width:70%;
          margin:auto;
          margin-top:200px;
        }
        #mybtn{
            background-color:rgb(168,191,170);
            border:0;
            color:white;
            width:100px;
            height:30px;
            border-radius:20px;
            float:right;
        }
        .table{text-align:center;}
        .table th{background-color:rgb(242,242,242)}
        #select{
          margin-top:20px;
          margin-left:10px;
        }
        #select>button{
          border:1px solid lightgray;
          font-size:small;
          width:60px;
          height:25px;
          border-radius:3px;
          background-color:white;
        }
        #btn-list>button{
          border:0;
          background-color: white;
          padding-top:5px;
          font-weight: bold;
        }
        .date{border:1px solid lightgray;}
    </style>
</head>
<body>

   <%@ include file="/views/common/menubar.jsp" %>
   
   <section class="mypoint">
    <h2>포인트 관리</h2>
    <br>
    <span style="font-size:small">
      포인트는 구매 확정 시 지급됩니다. 구매 후기 작성 시 포인트 지급됩니다. <br>
      챌린지 참여를 통해 포인트를 획득하실 수 있습니다. <br>
      얼스어스의 포인트는 1P 당 1원으로 사용 가능합니다.

    </span>
    <button id="mybtn" onclick="location.href='<%= contextPath %>/myPage.mp';">마이페이지 &gt;</button>

    <hr><br>

    <div id="select">
      <span>기간별 검색</span>&nbsp;
      <button class="d-btn" id="d1">전체</button><button class="d-btn" id="d2">오늘</button><button class="d-btn" id="d3">7일</button><button class="d-btn" id="d4">30일</button>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      
      
      <input type="date" class="date" id="n1">
      <span>~</span>
      <input type="date" class="date" id="n2">
      <button style="background:rgb(168,191,170); color:white;">조회</button>
    </div>

    <br><br>
    
	<script>
	function gogogo(){
    	 console.log("고고");
     }
     
	// 지급상태로 리스트 조회
	$("#btn-list").on("click", "button", function(){
		
	})
	function selectStatus(page, filter){
		
		$.ajax({
			url:"<%= contextPath%>/filter.po",
			data:{no:<%= m.getUserNo() %>,
				  cpage:page,
				  filter:filter,
			success:function(map){
             	let contextPath = "<%=contextPath%>";
				let pi = map.pi;
				let list = map.list;
				
				let value = ""; // 댓글 리스트 
				let paging = ""; // 페이징 처리
				if(list.length == 0){
					value += "<tr>"
						   + "<td colspan='5'>존재하는 내역이 없습니다.</td>"
						   + "</tr>";
				}else {
					// 댓글 리스트
					for(let i=0; i<list.length; i++) {
						
						value += '<tr class="list-area">'
							   + '<td>' + list[i].pointDate + '</td>'
							   
					   if(list[i].pointType().equals("적립")) {
						   value += '<td style="color:blue">' + list[i].pointType + '</td>';
					   }else {
						   value += '<td style="color:red">' + list[i].pointType + '</td>';
					   }
				   
				   		value += '<td>' + list[i].pointReason + '</td>';
				   		value += '<td>;
				   			   
				   		if(list[i].pointAmount > 0) {
				   			value += '+' + list[i].pointAmount;
				   		}else {
				   			value += list[i].pointAmount;	
				   		}
				   		
				   		value += '</td>'
				   			   + '<td>' + list[i].pointBalance + '</td>'
				   			   + '</tr>';
				   			   

                    	$(".list-area").html(value);
				
					}
			},
			error:{
				
			}
		})
		
		
	}
    
	</script>
    
    

    <div id="btn-list">
      <button class="a">전체</button>
      <button class="b">적립</button>
      <button class="c">사용</button> 

        <% if(!list.isEmpty()) { %>
		   	<span style="float:right">
		   		<%= firstDate %>~<%= lastDate %>까지의 포인트 내역 <b><%= pi.getListCount() %>건</b>
		   	</span>
		<% } %>
    </div>
    
    <hr><br>
  </section>
  
  <!--================ 포인트 테이블 =================-->
  <section class="cart_area">
      <div class="">
        <div class="table-responsive">
          <table class="table" style="width:70%" align="center">
            <thead>
              <tr>
                <th scope="col">날짜</th>
                <th scope="col">유형</th>
                <th scope="col">적립 내용</th>
                <th scope="col">포인트내역</th>
                <th scope="col">잔여포인트</th>
              </tr>
            </thead>
            <tbody>
            	<% if(list.isEmpty()) { %>
            		<tr>
            			<td colspan="5">존재하는 내역이 없습니다.</td>
            		</tr>
            	<% } else { %>
	          	   <% for(Point p : list) { %>
	                 <tr class="list-area">
	                     <td><%= p.getPointDate() %></td>
	                   	<% if(p.getPointType().equals("적립")) { %>
	                     	<td style="color:blue"><%= p.getPointType() %></td>
	                     <% }else { %>
	                     	<td style="color:red"><%= p.getPointType() %></td>
	                     <% } %>
	                     <td><%= p.getPointReason() %></td>
	                     <td>
	                     	<% if(p.getPointAmount() > 0) { %>
	                     		+<%= p.getPointAmount() %>
	                     	<% }else { %>
	                     	 	<%= p.getPointAmount() %>
	                     	<% } %>
	                     </td>
	                     <td><%= p.getPointBalance() %></td>
	                 </tr>
            	<% } %>
               <% } %>
              <tr>
                <td></td><td></td><td></td><td></td><td></td>
              </tr>
              
            </tbody>
          </table>
        </div>
      </div>
  </section>
  
  <!-- 페이징바 영역 -->
  <nav class="blog-pagination justify-content-center d-flex">
      <ul class="pagination">
        <% if(currentPage != 1) {%>
          <li class="page-item">
            <button onclick="location.href='<%=contextPath%>/list.po?cpage=<%= pi.getCurrentPage()-1 %>';" class="page-link" aria-label="Previous">
              <i class="ti-angle-left"></i>
            </button>
          </li>
        <% } %>
                    
        <% for(int p=startPage; p<=endPage; p++) { %>
          <% if(p == currentPage){ %>
            <li class="page-item active">
              <button class="page-link" disabled><%= p %></button>
            </li>
          <% }else { %>
            <li class="page-item">
              <button class="page-link" onclick="location.href='<%=contextPath%>/list.po?cpage=<%= p %>';"><%= p %></button>
            </li>
          <% } %>
        <% } %>
    
        <% if(currentPage != maxPage) { %>
          <li class="page-item">
            <button onclick="location.href='<%=contextPath%>/list.po?cpage=<%= pi.getCurrentPage()+1 %>';" class="page-link" aria-label="Next">
              <i class="ti-angle-right"></i>
            </button>
          </li>
        <% } %>
      </ul>
  </nav>
  <!-- 페이징바 영역 끝 -->   
  
  <br><br><br><br><br><br>
  <%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>