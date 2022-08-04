<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.us.product.model.vo.ProQna, com.us.common.model.vo.PageInfo" %>
<%
	ArrayList<ProQna> list = (ArrayList<ProQna>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 문의 관리 - Admin</title>
<style>
.pro-a-btn {
	font-size:small !important;
	width:80px !important;
	height:35px !important;
}
.pageination{
	margin-top:20px;
}

</style>
</head>
<body>

	<%@ include file="../common/adminMenubar.jsp"%>

	
	<div id="layoutSidenav">
	
		<!-- 여기부터! -->
	   <div id="layoutSidenav_content">
	       <main>
	           <div class="container-fluid px-4">
	               <div class="container productQna">
	                   <h3 class="mt-4" style="font-weight:bold;">상품 > 상품 문의 관리</h3>
	                   <hr><br>
	                   <div class="container pro-info-area">
	                       <!-- 정렬 select 시작-->
	                       <select name="pro-qna-orderby" id="ProQnaSort" onchange="sortProQna(1);">
	                           <option value="all">전체</option>
	                           <option value="waiting">대기중</option>
	                           <option value="complete">답변완료</option>
	                       </select>
	                       <!-- 정렬 select 끝 -->
	                       
	                       <!-- 상품 리스트 영역 시작 -->
		    				<table id='pro-qna-tb' border='1' style='text-align:center; width:100%'>
	                           <thead style="background:#f2f2f2;">
	                               <tr height="50px">
	                                   <th width="5%">No</th>
	                                   <th width="10%">상태</th>
	                                   <th width="20%">상품정보</th>
	                                   <th width="25%">제목</th>
	                                   <th width="10%">작성자</th>
	                                   <th width="20%">작성일</th>
	                                   <th width="10%">답변</th>
	                               </tr>
	                           </thead>
	                           <tbody>
	                            <!-- Ajax로 코드 넣어줄 부분 -->
	                           	<% for(ProQna pq : list){ %>
	                               <tr>
	                                   <td><%= pq.getProQnaNo() %></td>
	                                   
	                                   <% if(pq.getProAEnrollDate() == null){ %>
	                                   <td>대기중</td>
	                                   <% } else { %>
	                                   <td>답변완료</td>
	                                   <% } %>
	                                   
	                                   <td><%= pq.getProName() %></td>
	                                   <td><%= pq.getProQnaTitle() %></td>
	                                   <td><%= pq.getProQnaWriterName() %></td>
	                                   <td><%= pq.getProQEnrollDate() %></td>
	                                   <td>
	                                   <% if(pq.getProAEnrollDate() == null){ %>
	                                       <button class="btn btn-sm pro-a-btn" style="line-height:20px;"
	                                       onclick="location.href='<%=contextPath%>/updateForm.pq?proQnaNo=<%=pq.getProQnaNo()%>'">답변하기</button>
	                                   <% }else {%>
	                                   	   <button class="btn btn-sm pro-a-btn" style="line-height:20px; background:lightgray;
	                                   	   color:#404040;" disabled>답변완료</button>
	                                   <% } %>
	                                   </td>
	                               </tr>
	                           <% } %>
		    				   </tbody>
		                     </table>
		                     
		                     <!------- 페이징 처리 ------>
	                        <div class="pageination">
	                        	<nav aria-label="Page navigation example">
	                        		<ul class="pagination justify-content-center" id="pageArea">
	                        		
	                        			<!-- Ajax로 코드 넣어줄 부분 -->
	                        			<% if(currentPage != 1) { %>
	                        			<li class="page-item">
	                        				<a class="page-link" href="<%=contextPath%>/adlist.pq?cpage=<%=currentPage-1%>" aria-label="Previous">
	                        					<i class="fa-solid fa-angle-left"></i>
	                        				</a>
	                        			</li>
	                        			<% } %>
	                        			
	                        			<% for(int p=startPage; p<=endPage; p++) { %>
	                        			
		                        			<% if(p == currentPage) {%>
		                        			<li class="page-item active"><a class="page-link" href="<%=contextPath%>/adlist.pq?cpage=<%=p%>"><%=p%></a></li>
		                        			<% } else {%>
		                        			<li class="page-item">
		                        				<a class="page-link" href="<%=contextPath%>/adlist.pq?cpage=<%=p%>"><%=p%></a>
		                        			</li>
		                        			<% } %>
	                        			<% } %>
	                        			
	                        			<% if(currentPage != maxPage) { %>
	                        			<li class="page-item">
	                        				<a class="page-link" href="<%=contextPath%>/adlist.pq?cpage=<%=currentPage+1%>" aria-label="Next">
	                        					<i class="fa-solid fa-angle-right"></i>
	                        				</a>
	                        			</li>
	                        			<% } %>
	                        		</ul>
	                        	</nav>
	                        </div>
	                        <!------- 페이징 처리 끝 ------>
	                   </div>
	               </div>
	           </div>
	       </main>
		</div>
  </div>
		                     
		                     
       <script>
       
       	function sortProQna(page){
                  		
    	$.ajax({
    		url:'<%=contextPath%>/adSort.pq',
    		type:"get",
    		data:{
    			option:$('#ProQnaSort option:selected').val(),
    			cpage:page
    			 },
    		success:function(map){
    			//console.log(list);
    			
    			const pi = map.pi; // {}
				const newList = map.list; // [{},{},{}]
				
    			var txt = ""; // 테이블 영역 코드 저장할 변수
    			
   				// 분류 결과 알려주기
    			for(let i = 0; i < newList.length; i++){
    				
    				txt += "<tr><td>" + newList[i].proQnaNo + "</td>";
                                  
                       if(newList[i].proAEnrollDate == null){
                    	   
                              txt += "<td>대기중</td>";
                              
                       } else {
                    	   
                              txt += "<td>답변완료</td>";
                              
                       }
                       
                       txt += "<td>" + newList[i].proName + "</td>";
                       txt += "<td>" + newList[i].proQnaTitle + "</td>";
                       txt += "<td>" + newList[i].proQnaWriterName + "</td>";
                       txt += "<td>" + newList[i].proQEnrollDate + "</td>";
                       txt += "<td>";
                       
                       if(newList[i].proAEnrollDate == null){
                     
                       	txt += '<button class="btn btn-sm pro-a-btn" style="line-height:20px;" onclick="updateAnswer(' + newList[i].proQnaNo + ');">답변하기</button>';
                       
                       }else {
                    	   
                           	txt += "<button class='btn btn-sm pro-a-btn' style='line-height:20px; background:lightgray; color:#404040;' disabled>답변완료</button>";	
                       }
                       
                       txt += "</td></tr>";
    			}
    			
    			

    			var ptxt = ""; // 페이징 영역 코드 저장할 변수
    			
                // 페이징바
                if(pi.currentPage != 1) {
             	   
           			ptxt += "<li class='page-item'>";
           			ptxt += 	"<a class='page-link' onclick='sortProQna(" + (pi.currentPage-1) + ");' aria-label='Previous'>";
           			ptxt += 		"<i class='fa-solid fa-angle-left'></i>";
           			ptxt += 	"</a>";
           			ptxt += "</li>";
            	}
             			
       			for(let p = pi.startPage; p <= pi.endPage; p++){
       			
          			if(p == pi.currentPage){
          			
          				ptxt += "<li class='page-item active'>";
          				ptxt += 	"<a class='page-link'>" + p + "</a>";
          				ptxt +=	"</li>";
          				
          			} else {
          				
          				ptxt += "<li class='page-item'>";
          				ptxt += 	"<a class='page-link' onclick='sortProQna(" + p + ");'>" + p + "</a>";
          				ptxt += "</li>";
          			}
       			}
         			
      			if(pi.currentPage != pi.maxPage) {
      				
      				ptxt += "<li class='page-item'>";
      				ptxt += 	"<a class='page-link' onclick='sortProQna(" + (pi.currentPage+1) + ");' aria-label='Next'>";
      				ptxt += 	"<i class='fa-solid fa-angle-right'></i>";
      				ptxt += 	"</a>";
      				ptxt += "</li>";
      			}
              			
                     // 각 영역에 코드 넣어주기
    				$("tbody").empty();
    				$('tbody').append(txt);
    				$('#pageArea').empty(ptxt);
                    $('#pageArea').append(ptxt);
              			
            },  //success 끝
    		error:function(){
    			console.log("상품 정렬용 ajax 통신 실패");
    		}
    	})
	}
       	
    function updateAnswer(proQnaNo){
    	location.href="<%=contextPath%>/updateForm.pq?proQnaNo=" + proQnaNo;
    }
  </script>
	
</body>
</html>