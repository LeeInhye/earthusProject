<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.us.contents.model.vo.Contents"%>
<%
	ArrayList<Contents> list = (ArrayList<Contents>)request.getAttribute("adList");
%>
<!DOCTYPE html>
<html>
<head>
<style>
   table{
           border:2px solid lightgray;
           font-size:small;
           text-align:center;
           width:80%;
           margin:auto;
       }
    table td{
    	border:1px solid lightgray;
    	height: 40px;
    }
    table th{
    	background-color:rgba(211, 211, 211,0.5);
    	border:1px solid lightgray;
    	height: 50px;
    }
</style>
</head>
<body>

	<%@ include file="/views/common/adminMenubar.jsp" %>

	<div id="layoutSidenav">
       <div id="layoutSidenav_content">
           <main>
               <div class="container-fluid px-4">
                   <br>
                   <h3 class="mt-4" style="font-weight:bold;">콘텐츠 관리</h3>
                   <hr><br><br>
                   
                   <table>
                       <tr>
                           <th width="5%" height="50px">
                               <input type="checkbox" name="checkAllCon" id="checkAllCon">
                           </th>
                           <th width="5%">No.</th>
                           <th width="55%">제목</th>
                           <th width="15%">작성일</th>
                           <th width="10%">조회수</th>
                           <th width="10%">좋아요 수</th>
                       </tr>
                       <% if(list.isEmpty()) { %>
	                       <tr>
	                           <td colspan="6">존재하는 콘텐츠가 없습니다.</td>
	                       </tr>  	
                       <% } else { %>
                       	   <% for(Contents c : list) { %>
		                       <tr>
 		                           <td>
		                               <input type="checkbox" name="checkCon" id="checkCon">
		                           </td>
		                           <td><%= c.getCntNo() %></td>
		                           <td><%= c.getCntTitle() %></td>
		                           <td><%= c.getCntEnrollDate() %></td>
		                           <td><%= c.getCntCount() %></td>
		                           <td><%= c.getCntLike() %></td>
		                       </tr>
	                       <% } %>
                       <% } %>
                   </table>

                       <button class="btn_admin" style="float: left; margin-left: 10%;">선택 삭제</button>
                       <button class="btn_admin" style="float: right; margin-right: 10%;" id="btn_enroll">새 글 작성</button>

					<script>
						$(function(){
							$("#btn_enroll").click(function(){
								location.href = '<%=contextPath%>/enrollForm.co';
							})
						})
					</script>

               </div>
           </main>

       </div>
	</div>
	
</body>
</html>