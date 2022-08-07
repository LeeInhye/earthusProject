<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page 
	import="java.util.ArrayList, com.us.member.model.vo.Member, com.us.common.model.vo.PageInfo, java.text.SimpleDateFormat" 
%>
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
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
		        <div class="container-fluid px-4 btnHover">
		        <br>
                    <h3 class="mt-4" style="font-weight:bold">포인트 관리 > 적립/회수</h3>
		            <hr>
                    
                    <br><br>
		            
		            <div style="width: 90%" class="main_width  sumin_font">
		                <input type="text" class="search_all" placeholder="회원 아이디 / 이름 입력" id="keyword">
		               
		                &nbsp;
		                <button type="button" class="btn-sm btn_black" id="searchBtn" onclick="searchList(1);">조회</button>
		                <br><br><br>
		                
		                <!-- 검색기능 -->
		                <script>
		                
		                function searchList(page){
		                	$.ajax({
	                			url:"<%= contextPath %>/adSearch.me",
	                			type:"post",
	                			data:{
	                				keyword:$("#keyword").val(),
	                				mpage:page
	                			},
	                			success:function(map){
	                				console.log(map);
	                				
	                				const pi = map.pi; // {}
	                				const newList = map.list; // [{}, {}, {}]
	                				
	                				var txt = "";
	                				
	                				var year = "";
		                            var month = "";
		                            var day = ""
		                            
		                            var indexM = "";
		                            var indexD = "";
		                            var indexY = "";
		                            
		                            if(newList.length == 0) {
		                            	txt += '<tr>'
			        						   + '<td colspan="10">일치하는 회원이 없습니다.</td>'
			        						   + '</tr>';
									} else {
		                				for(let i = 0; i < newList.length; i++){
											// 검색 결과 넣어주기	
		                					txt += '<tr><td onclick="event.cancelBubble=true;">'
		                						 + '<input type="checkbox" name="check" value="' + newList[i].userNo + '"</td>';
		                					
				                            txt += "<td>" + newList[i].userNo + "</td>";
				                            txt += "<td>" + newList[i].userId + "</td>";
				                            
				                            txt += "<td>" + newList[i].userName + "</td>";
				                            txt += "<td>" + newList[i].email + "</td>";
				                            txt += "<td>" + newList[i].phone + "</td>";
				                            
				                            if( newList[i].zonecode == null){
				                            	txt += "<td>";
				                            } else{
				                            	txt += "<td>(" + newList[i].zonecode + ")";
				                            }
				                            
				                            if( newList[i].address == null){
				                            	txt += "";
				                            } else{
				                            	txt += " " + newList[i].address;
				                            }
				                            
				                            if( newList[i].addrExtra == null) {
				                            	txt += "";
				                            } else{
				                            	txt += " " + newList[i].addrExtra;
				                            }
				                            
				                            if( newList[i].addrDetail == null) {
				                            	txt += "</td>";
				                            } else{
				                            	txt += " " + newList[i].addrDetail + "</td>"
				                            }
				                            
				                            <!-- 날짜 -->
				                            indexM = newList[i].userEnrollDate.indexOf("월");
				                            indexD = newList[i].userEnrollDate.indexOf(",");
				                            indexY = newList[i].userEnrollDate.length;
				                            
				                            year = newList[i].userEnrollDate.substring(indexD + 2, indexY);
				                            month = newList[i].userEnrollDate.substring(0, indexM);
				                            day = newList[i].userEnrollDate.substring(indexM + 2, indexD);
				                            
				                           	if(month < 10){
				                           		month = "0" + month;
				                           	}
				                           	if(day < 10){
				                           		day = "0" + day;
				                           	}
				                            
				                            txt += "<td>" + year + "-" + month + "-" + day + "</td>";
				                            txt += "<td>" + newList[i].point + "</td>";
				                            txt += "<td>" + newList[i].userStatus + "</td>";
				                            
		            					}
									}
	                				
	                				var ptxt = "";
	                				// 페이징바
	                				ptxt += '<div class="paging-area" align="center" id="pagingBar">';
	                				
	                				if(pi.currentPage != 1){
	                					ptxt += '<button class="btn btn_black" onclick="searchList(' + (pi.currentPage - 1) + ');">&lt;</button> ';
	                				}
	                				
	                				for(var pp = pi.startPage; pp <= pi.endPage; pp++){
	                					if(pp == pi.currentPage) {
	                						ptxt += '<button class="btn btn_gray" disabled>' + pp + '</button> ';
	                					} else {
	                						ptxt += '<button class="btn btn_black" onclick="searchList(' + pp + ');">' + pp + '</button> ';
	                					}
	                				}
	                				
	                				if(pi.currentPage != pi.maxPage){
	                					ptxt += '<button class="btn btn_black" onclick="searchList(' + (pi.currentPage + 1) + ');">&gt;</button>';
	                				}
	                				
	                				ptxt += "</div>";
	                			
	                				$("#mBody").empty();
	                				$("#mBody").append(txt);
	                				$("#pagingBar").empty()
	                				$("#pagingBar").append(ptxt);
	                			}, error:function(){
	                				console.log("ajax 검색 기능 실패");
	                			}
	                		});
		                }
		                </script>
		                
		                <table class="M_member_table table table-hover">
		                    <thead>
		                        <tr class="table_thead_border" style="border-bottom: none;">
		                            <th width="3%"><input type="checkbox" id="checkAll"></th>
		                            <th width="5%">번호</th>
		                            <th width="8%">아이디</th>
		                            <th width="8%">이름</th>
		                            <th width="18%">이메일</th>
		                            <th width="10%">휴대폰</th>
		                            <th width="20%">주소</th>
		                            <th width="10%">가입일</th>
		                            <th width="7%">포인트</th>
		                            <th width="5%">상태</th>
		                        </tr>
		                    </thead>
		                    <tbody id="mBody">
		                    
		                    <!-- 전체  -->
                			<% for(Member m : list) { %>
		                        <!-- 값은 다 DB와 연결될 것 -->
		                        <tr style="cursor: auto;">
		                            <td onclick="event.stopPropagation();"> <!-- 해당 td 클릭 시에는 수정 페이지로 이동하지 않게 함-->
                                        <input type="checkbox" name="check" value="<%= m.getUserNo() %>">
                                    </td>
		                            <td><%= m.getUserNo() %></td>
		                            <td><%= m.getUserId() %></td>
		                            <td><%= m.getUserName() %></td>
		                            <td><%= m.getEmail() %></td>
		                            <td><%= m.getPhone() %></td>
		                            
		                            <td>
		                            	<% if( m.getZonecode() == null){ %>
		                            		<% m.setZonecode(""); %>
		                            	<% } else {%>
		                            		<% m.setZonecode("(" + m.getZonecode() +")"); %>
		                            	<% } %>
		                            	
		                            	<% if( m.getAddress() == null){ %>
		                            		<% m.setAddress(""); %>
		                            	<% } %>
		                            	
		                            	<% if( m.getAddrExtra() == null){ %>
		                            		<% m.setAddrExtra(""); %>
		                            	<% } %>
		                            	
		                            	<% if( m.getAddrDetail() == null){ %>
		                            		<% m.setAddrDetail(""); %>
		                            	<% } %>
		                            	
										<%= m.getZonecode() %>&nbsp;<%= m.getAddress() %>&nbsp;<%= m.getAddrExtra() %>&nbsp;<%= m.getAddrDetail() %> 
									</td>
		                            <td><%= m.getUserEnrollDate() %></td>
		                            <!--  포인트 넣기 -->
		                            <td><%= m.getPoint() %></td>
		                            <td><%= m.getUserStatus() %></td>
		                        </tr>
		                        
		                      <% } %>
		                        
		                    </tbody>
		                </table>
		                <br><br>
		                		                
		                <div>
		                    <button type="button" id="plusBtn" class="btn btn_black btn_left" data-bs-toggle="modal" data-bs-target="#jyModal_noCheck">
		                    포인트 적립</button>
		                    <button type="button" id="minusBtn" class="btn btn_black btn_left" data-bs-toggle="modal" data-bs-target="#jyModal_noCheck">
		                    포인트 회수</button>
		                </div>
		                
		                <br><br>

		            </div>
		            
		            <br><br>
		            
		            <!-- 페이징바 영역 -->
		            <div class="paging-area" align="center" id="pagingBar">
		            	<% if(currentPage != 1) { %>
		            		<button class="btn btn_black" onclick="location.href='<%= contextPath %>/adList.po?cpage=<%= pi.getCurrentPage() -1 %>';">&lt;</button>
		            	<% } %>
		            	
		            	<% for(int p = startPage; p <= endPage; p++) { %>
		            		<% if(p == currentPage) { %>
		            			<button class="btn btn_gray" disabled><%= p %></button>
		            		<% } else { %>
		            		 	<button class="btn btn_black" onclick="location.href = '<%= contextPath %>/adList.po?cpage=<%= p %>';"><%= p %></button>
		            		<% } %>
		            	<% } %>
		            
		            	<% if(currentPage != maxPage) { %>
		            		<button class="btn btn_black" onclick="location.href='<%= contextPath %>/adList.po?cpage=<%= pi.getCurrentPage() + 1 %>';">&gt;</button>
		            	<% } %>
		            
		            </div>
		            
					
                   <!-- 모달: 회원 선택 안 했을 경우 -->
                    <div class="modal" id="jyModal_noCheck">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <!-- Modal Header -->
                                <div class="modal-header">
                                <button type="button" class="modal_close" data-bs-dismiss="modal" style="margin-left: 95%;">&times;</button>
                                </div>
                                <!-- Modal body -->
                                <div class="modal-body" style="text-align: center;">
                                회원을 선택해 주세요.
                                </div>
                                <!-- Modal footer -->
                                <div class="modal-footer">
                                <button type="button" class="btn btn-dark" data-bs-dismiss="modal">확인</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 모달 끝 -->

                    <!-- 모달: 적립 모달 -->
                    <div class="modal" id="jyModal_plusPoint">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <!-- Modal Header -->
                                <div class="modal-header">
                                <h4>포인트 적립</h4>
								<button type="button" class="modal_close" data-bs-dismiss="modal">&times;</button>
                                </div>
                                <!-- Modal body -->
                                <form action="<%=contextPath%>/plus.po" method="post">
                                <div class="modal-body" align="center";>
		                                <table>
		                                <tr>
		                                	<td>적립할 회원번호 :</td>
		                                	<td><input type="text" id="checkUserNo1" name="userNo" value=""></td>
		                                </tr>
										<tr>
											<td style="width: 40%;">적립할 포인트 &nbsp;: </td>
											<td><input type="number" step="100" name="amount" min="100" required></td>
										</tr>
										<tr>
											<td>포인트 내용 &nbsp;&nbsp;&nbsp;:</td>
											<td><input type="text" name="reason" required></td>
										</tr>
		                                </table>
	                                </div>
	                                <!-- Modal footer -->
	                                <div class="modal-footer">
	                                <button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
	                                <button type="submit" class="btn btn-dark" id="realInsert">확인</button>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- 모달 끝 -->
                    
                    <!-- 모달: 회수 모달 -->
                    <div class="modal" id="jyModal_minusPoint">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <!-- Modal Header -->
                                <div class="modal-header">
                                <h4>포인트 회수</h4>
								<button type="button" class="modal_close" data-bs-dismiss="modal">&times;</button>
                                </div>
                                <!-- Modal body -->
                                <form action="<%=contextPath%>/plus.po" method="post">
                                <div class="modal-body" align="center";>
		                                <table>
		                                <tr>
		                                	<td>회수할 회원번호 :</td>
		                                	<td><input type="text" id="checkUserNo2" name="userNo" value=""></td>
		                                </tr>
										<tr>
											<td style="width: 40%;">회수할 포인트 &nbsp;: </td>
											<td><input type="number" step="100" name="amount" max="-100" required></td>
										</tr>
										<tr>
											<td>포인트 내용 &nbsp;&nbsp;&nbsp;:</td>
											<td><input type="text" name="reason" required></td>
										</tr>
		                                </table>
	                                </div>
	                                <!-- Modal footer -->
	                                <div class="modal-footer">
	                                <button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
	                                <button type="submit" class="btn btn-dark" id="realInsert">확인</button>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- 모달 끝 -->
                    
                    <script>
                    $(function(){				
                        // 체크박스 전체선택, 전체해제 기능
                        $("#checkAll").click(function(){

                            if($("#checkAll").prop("checked")){
                                $("input[name=check]").prop("checked", true);
                            }else {
                                $("input[name=check]").prop("checked", false);
                            }

                        })
                        
                        // 전체선택 상태에서 체크박스 하나 해제시 헤더에 있는 체크박스도 해제되고,
                        // 목록의 체크박스들을 전부 선택시 헤더에 있는 체크박스가 선택되는 기능
                        $("input[name=check]").click(function(){
                            var total = $("input[name=check]").length;
                            var checked = $("input[name=check]:checked").length;

                            if(total != checked){
                                $("#checkAll").prop("checked", false);
                            }else {
                                $("#checkAll").prop("checked", true);
                            }
                        })
                        
                        // 체크박스 체크/체크해제시 선택삭제 버튼의 모달 속성 변경
                        var checkCnt = "";
                        // $("input:checkbox").change(function(){ 로 작성시 ajax사용 후 이벤트 작동하지 않음!
						$(document).on("change", "input:checkbox", function(){  
							checkCnt = "";
							$("input:checkbox[name=check]:checked").each(function(){
                                checkCnt += ($(this).val()) + ","; // 체크된 것만 게시글번호 뽑기 "2,3,4,"
                            })
                            checkCnt = checkCnt.substring(0,checkCnt.lastIndexOf(",")); // 맨 뒤 콤마 삭제 "2,3,4"
                            
                            console.log(checkCnt);
							
							if(checkCnt == ''){ // 선택된 체크박스 하나도 없을 경우
                	            $("#plusBtn").attr("data-bs-target", "#jyModal_noCheck");
                	            $("#minusBtn").attr("data-bs-target", "#jyModal_noCheck");
                            }else{ // 선택된 체크박스 있을 경우
	                            $("#plusBtn").attr("data-bs-target", "#jyModal_plusPoint");
	                            $("#minusBtn").attr("data-bs-target", "#jyModal_minusPoint");
	                            
	                            // form Modal에 값 넣어두기
	                            $("#checkUserNo1").val(checkCnt);
	                            $("#checkUserNo2").val(checkCnt);
                            }
							
						})                                                     

					})
                    
                    </script>
					                
		        </div>
		    </main>
		</div>
	</div>
	
</body>
</html>