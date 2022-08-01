<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page 
	import="java.util.ArrayList, com.us.member.model.vo.Member, com.us.common.model.vo.PageInfo" 
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
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

	<%@include file = "../common/adminMenubar.jsp" %>
	
	<div id="layoutSidenav">
		<div id="layoutSidenav_content">
			<main>
		        <div class="container-fluid px-4 btnHover">
		        <br>
                    <h3 class="mt-4" style="font-weight:bold">회원정보관리</h3>
		            <hr>
                    
                    <br><br>
		            
		            <div style="width: 80%" class="main_width  sumin_font">
		                <input type="text" class="search_all" placeholder="회원 아이디/이름 입력" id="keyword">
		               
		                &nbsp;
		                <button type="button" class="btn-sm btn_black" id="searchBtn">조회</button>
		                <br><br><br>
		                
		                <!-- 검색기능 -->
		                <script>
		                $(document).ready(function(){
		                	$("#searchBtn").click(function(){
		                		$.ajax({
		                			url:"<%= contextPath %>/adSearch.me",
		                			type:"post",
		                			data:{
		                				keyword:$("#keyword").val(),
		                				mpage:<%= pi.getCurrentPage() %>
		                			},
		                			success:function(newList){
		                				var txt = "";
		                				for(let i = 0; i < newList.length; i++){
											// 검색 결과 넣어주기	
		                					txt += '<tr><td><input type="checkbox" name="checkMember"></td>';
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
				                           
				                            <!--  포인트 넣기 -->
				                            txt += "<td>1400</td>";
				                            txt += '<td class="btn_left">'
				                            txt += '<button type="button" class="btn-sm btn_black" data-toggle="modal" data-target="#adUpdateMember">';
				                            txt +=         '수정';
				                            txt +=     '</button></td></tr>';
				                            
		            					}
		                				
		                				// 페이징바
		                				
		                				$("#mBody").empty();
		                				$("#mBody").append(txt);
		                			}, error:function(){
		                				console.log("ajax 검색 기능 실패");
		                			}
		                		});
		                	});
		                })
		                </script>
		                
		                
		                
		                <table class="M_member_table table">
		                    <thead>
		                        <tr class="table_thead_border" style="border-bottom: none;">
		                            <th width="3%"><input type="checkbox" onclick="checkAll(this);" id="checkAll"></th>
		                            <th width="5%">번호</th>
		                            <th width="10%">아이디</th>
		                            <th width="9%">이름</th>
		                            <th width="20%">이메일</th>
		                            <th width="10%">휴대폰</th>
		                            <th width="20%">주소</th>
		                            <th width="10%">가입일</th>
		                            <th width="7%">포인트</th>
		                            <th width="9%"></th>
		                        </tr>
		                    </thead>
		                    <tbody id="mBody">
		                    
		                    <!-- 전체  -->
                			<% for(Member m : list) { %>
		                        <!-- 값은 다 DB와 연결될 것 -->
		                        <tr>
		                            <td><input type="checkbox" name="checkMember"></td>
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
		                            <td>1400</td>
		                            <td class="btn_left">
		                                <button type="button" id="updateBtn" class="btn-sm btn_black" data-toggle="modal" data-target="#adUpdateMember">
		                                    수정
		                                </button>
		                            </td>
		                        </tr>
		                        
		                      <% } %>
		                        
		
		                    </tbody>
		                </table>
		                
		                <br><br>
		                <div>
		                    <button type="button" class="btn btn_black btn_left" data-toggle="modal" data-target="#adDeleteMember">회원삭제</button>
		                </div>
		            </div>
		            
		            <br><br>
		            
		            <!-- 페이징바 영역 -->
		            <div class="paging-area" align="center" id="pagingBar">
		            	<% if(currentPage != 1) { %>
		            		<button class="btn btn_black" onclick="location.href='<%= contextPath %>/adList.me?mpage=<%= pi.getCurrentPage() -1 %>';">&lt;</button>
		            	<% } %>
		            	
		            	<% for(int p = startPage; p <= endPage; p++) { %>
		            		<% if(p == currentPage) { %>
		            			<button class="btn btn_gray" disabled><%= p %></button>
		            		<% } else { %>
		            		 	<button class="btn btn_black" onclick="location.href = '<%= contextPath %>/adList.me?mpage=<%= p %>';"><%= p %></button>
		            		<% } %>
		            	<% } %>
		            
		            	<% if(currentPage != maxPage) { %>
		            		<button class="btn btn_black" onclick="location.href='<%= contextPath %>/adList.me?mpage=<%= pi.getCurrentPage() + 1 %>';">&gt;</button>
		            	<% } %>
		            
		            </div>
		            
		           
		            
		            <!-- 전체 선택 -->
		            <script>
		            	//checkAll 체크시 전체 체크됨
		            	function checkAll(checkAll){
		            		const checkboxes = document.querySelectorAll("input[type='checkbox']");
							checkboxes.forEach((checkbox) => {
								checkbox.checked = checkAll.checked;
							})
						}
					</script>

					<script>
						// 체크박스 전체 선택되면 맨 위의 체크박스도 자동 체크
						// 회원가입1 참고
						$(document).ready(function(){
							$("input[name='checkMember']").click(function(){
								var count = $("input[name='checkMember']").length;
								var checked = $("input[name='checkMember']:checked").length;
								
								if(count != checked){
			        				$('#checkAll').prop("checked", false);
			        			} else{
			        				$("#checkAll").prop("checked", true);
			        			}
							});
						})

					</script>
					
					<!-- 회원 수정 모달창 -->
					            <form action="<%= contextPath %>/adUpdate.me" method="post">
				                    <div class="modal" id="adUpdateMember" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" tabindex="-1">
				                        <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar">
				                            <div class="modal-content_su">
				
				                                <!-- Modal Header -->
				                                <div class="modal-header_su">
				                                    <h4 class="modal-title"><b>회원 정보 수정</b></h4>
				                                    &emsp; &emsp;&emsp; &emsp;&emsp; &emsp;&emsp; &emsp;&emsp; &emsp;&emsp; &emsp;&emsp; &emsp;&emsp; &emsp;
				                                    <button type="button" class="close" style="text-align: right;" data-dismiss="modal">&times;</button>
				                                    <hr class="my-hr2">
				                                </div>
				                                
				
				                                <!-- 원래 등록된 정보 넣어주기, name, id 바꾸기 -->
				                                <!-- Modal body -->
				                                <div class="modal-body modal_update_form">
				                                
				                                	<!-- 해당 회원 넘버 가져오기 -->
				                                	<script>
				                                		$("#updateBtn").click(function(){
				                                			var td = $(this).parent();
				                                			int no = Integer.parseInt(td.eq(0).text());
				                                		})
				                                	</script>
				
				                                    <label for="name">이름</label>
				                                    <input type="text" id="name" value="<%= list.get(0).getUserName() %>">
				                                    <p class="update_misfit">* 이름은 필수 입력 사항입니다.</p>
				
				                                    <br>
				                                    <label for="pwd">비밀번호</label>
				                                    <input type="text" id="pwd" value="<%= list.get(0).getUserPwd() %>">
				                                    <p style="font-size: 14px; color: gray;">첫글자 영문<br>영문 대소문자/숫자/특수문자 중 2가지 이상 조합.
				                                        8~16자</p>
				                                    <p class="update_misfit">* 비밀번호는 필수 입력 사항입니다.</p>
				
				                                    <br>
				                                    <label for="checkPwd">비밀번호 확인</label>
				                                    <input type="password" id="checkPwd">
				                                    <p class="update_misfit">* 비밀번호가 일치하지 않습니다.</p>
				                                    <br>
				
				                                    <label for="email">이메일</label>
				                                    <input type="email" id="email">
				                                    <button class="btn-sm btn_gray">중복확인</button>
				                                    <p class="update_misfit">* 중복되는 이메일이 존재합니다.</p>
				                                    <br>
				
				                                    <label for="phone">전화번호</label>
				                                    <input type="text" id="phone">
				                                    <button class="btn-sm btn_gray">중복확인</button>
				                                    <p class="update_misfit">* 중복되는 전화번호가 존재합니다.</p>
				                                    <br>
				
				                                    <label for="address">주소</label>
				                                    <input type="text" style="width: 25%;"> &nbsp;
				                                    <button class="btn-sm btn_gray"
				                                        style="width: 22%; font-size: 13px;">우편번호 찾기</button>
				                                    <br>
				                                    <label for=""></label> <input type="text"> <br>
				                                    <label for=""></label> <input type="text" style="margin-top: 7px;">
				
				
				
				
				                                </div>
				
				                                <!-- Modal footer -->
				                                <div class="modal-footer_su">
				                                    <hr class="my-hr2">
				                                    <button type="submit" class="btn btn_black btn_save" data-dismiss="modal">저장</button>
				                                </div>
				
				                            </div>
				                        </div>
				                    </div>
				                </form>
					

		            
		            
                    
                    
                    <!-- 회원 삭제 모달창 -->
                    <div class="modal fade" id="adDeleteMember" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                    <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
	                        <!--Content-->
	                        <div class="modal-content modal_alert">
	                            
	                            <!--Body-->
	                            <div class="modal-body text-center modal_alert_child">
	                                <div>
	                
	                                    <h5 class="mt-1 mb-2">정말 삭제하시겠습니까?</h5>
	                                    <br>                                
	                                    <div class="text-center mt-4"> 
	                                        <button type="button" class="btn btn_gray btn_medium" data-dismiss="modal">취소</button>
	                                        <button type="button" class="btn btn_black btn_medium" data-toggle="modal" data-target="#adDeleteMemberCheck" data-dismiss="modal">확인</button>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                
	                <div class="modal fade" id="adDeleteMemberCheck" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		                <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
		                    <!--Content-->
		                    <div class="modal-content modal_alert">
		                        
		                        <!--Body-->
		                        <div class="modal-body text-center modal_alert_child">
		                            <div>
		            
		                                <h5 class="mt-1 mb-2">성공적으로 삭제되었습니다.</h5>
		                                <br>                                
		                                <div class="text-center mt-4"> 
		                                    <button type="button" class="btn btn_black btn_medium" data-dismiss="modal">확인</button>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		            
		            
		            
		
		
		
		        </div>
		    </main>
		</div>
	</div>
	
</body>
</html>