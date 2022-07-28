<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
   table{
           border:2px solid lightgray;
           font-size:small;
           text-align:center;
           width:80%;
           height:350px;
           margin:auto;
       }
    table th, table td{border:1px solid lightgray;}
    th{background-color:rgba(211, 211, 211,0.5)}
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
                   <hr>
                   <br><br>

                   <table>
                       <tr>
                           <th width="5%">
                               <input type="checkbox" name="checkAllCon" id="checkAllCon">
                           </th>
                           <th width="5%">No.</th>
                           <th width="60%">제목</th>
                           <th width="20%">작성일</th>
                           <th width="10%">좋아요 수</th>
                       </tr>
                       <tr>
                           <td>
                               <input type="checkbox" name="checkCon" id="checkCon">
                           </td>
                           <td>7</td>
                           <td></td>
                           <td></td>
                           <td></td>
                       </tr>
                       <tr>
                           <td>
                               <input type="checkbox" name="checkCon" id="checkCon">
                           </td>
                           <td>6</td>
                           <td></td>
                           <td></td>
                           <td></td>
                       </tr>
                       <tr>
                           <td>
                               <input type="checkbox" name="checkCon" id="checkCon">
                           </td>
                           <td>5</td>
                           <td></td>
                           <td></td>
                           <td></td>
                       </tr>
                       <tr>
                           <td>
                               <input type="checkbox" name="checkCon" id="checkCon">
                           </td>
                           <td>4</td>
                           <td></td>
                           <td></td>
                           <td></td>
                       </tr>
                       <tr>
                           <td>
                               <input type="checkbox" name="checkCon" id="checkCon">
                           </td>
                           <td>3</td>
                           <td></td>
                           <td></td>
                           <td></td>
                       </tr>
                       <tr>
                           <td>
                               <input type="checkbox" name="checkCon" id="checkCon">
                           </td>
                           <td>2</td>
                           <td></td>
                           <td></td>
                           <td></td>
                       </tr>
                       <tr>
                           <td>
                               <input type="checkbox" name="checkCon" id="checkCon">
                           </td>
                           <td>1</td>
                           <td></td>
                           <td></td>
                           <td></td>
                       </tr>
                   </table>

                       <button class="btn_admin" style="float: left; margin-left: 10%;">선택 삭제</button>
                       <button class="btn_admin" style="float: right; margin-right: 10%;" id="btn_enroll">새 글 작성</button>

					<script>
						$(function(){
							$("#btn_enroll").click(function(){
								location.href = '<%=contextPath%>/cntEnrollForm.ad';
							})
						})
					</script>

               </div>
           </main>

       </div>
	</div>
	
</body>
</html>