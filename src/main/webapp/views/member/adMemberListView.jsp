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
                    <h3 class="mt-4" style="font-weight:bold">회원정보관리</h3>
		            <hr>
                    
                    <br><br>
		            
		            <div style="width: 90%" class="main_width  sumin_font">
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
				                           
				                            
				                            txt += "<td>" + newList[i].userEnrollDate + "</td>";
				                            <!--  포인트 넣기 -->
				                            txt += "<td>1400</td>";
				                            txt += "<td>" + newList[i].userStatus + "<td>";
				                            txt += '<td class="btn_left">';
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
		                            <th width="8%">아이디</th>
		                            <th width="8%">이름</th>
		                            <th width="18%">이메일</th>
		                            <th width="10%">휴대폰</th>
		                            <th width="20%">주소</th>
		                            <th width="10%">가입일</th>
		                            <th width="7%">포인트</th>
		                            <th width="5%">상태</th>
		                            <th width="6%"> </th>
		                        </tr>
		                    </thead>
		                    <tbody id="mBody">
		                    
		                    <!-- 전체  -->
                			<% for(Member m : list) { %>
		                        <!-- 값은 다 DB와 연결될 것 -->
		                        <tr>
		                            <td><input type="checkbox" name="checkMember" value="<%= m.getUserNo() %>"></td>
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
		                            <td><%= m.getUserStatus() %></td>
		                            <td class="btn_left">
		                                <button type="button" id="updateBtn" class="btn-sm btn_black" data-bs-toggle="modal" data-bs-target="#adUpdateMember">
		                                    수정
		                                </button>
		                            </td>
		                        </tr>
		                        
		                      <% } %>
		                        
		
		                    </tbody>
		                </table>
		                
		                <br><br>
		                <div>
		                    <button type="button" id="deleteBtn" class="btn btn_black btn_left" onclick="deleteMember();">
		                    회원삭제</button>
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
	                                        <button type="button" id="next" class="btn btn_gray btn_medium" data-bs-dismiss="modal">취소</button>
	                                        <button type="button" id="realDelete" class="btn btn_black btn_medium">확인</button>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                
	                <button type="button" id="nocheckBtn" class="btn_trans" data-bs-toggle="modal" data-bs-target="#nocheck"></button>
	                <!-- 회원 선택 안했을 때 -->
	                <div class="modal fade" id="nocheck" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                    <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
	                        <!--Content-->
	                        <div class="modal-content modal_alert">
	                            
	                            <!--Body-->
	                            <div class="modal-body text-center modal_alert_child">
	                                <div>
	                
	                                    <h5 class="mt-1 mb-2">삭제할 회원을 선택해주세요.</h5>
	                                    <br>                                
	                                    <div class="text-center mt-4"> 
	                                        <button type="button" class="btn btn_black btn_medium" data-bs-dismiss="modal">확인</button>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                
	                
	                <script>
	                	// 회원 삭제
	                	function deleteMember(){
                            var checkCnt = "";

                            $("input:checkbox[name=checkMember]:checked").each(function(){
                                checkCnt = checkCnt + ($(this).val()) + ","; // 체크된 것만 게시글번호 뽑기 "2,3,4,"
                            })

                            checkCnt = checkCnt.substring(0,checkCnt.lastIndexOf(",")); // 맨 뒤 콤마 삭제 "2,3,4"
                            console.log(checkCnt);
							
                            // 선택된 체크박스 없이 삭제 버튼 누른 경우
                            if(checkCnt == ''){
                            	$("#deleteBtn").removeAttr("data-bs-toggle");
                            	$("#deleteBtn").removeAttr("data-bs-target");
                                $("#nocheckBtn").click();
                            }

                            else {
                            	$("#deleteBtn").attr("data-bs-toggle", "modal");
                            	$("#deleteBtn").attr("data-bs-target", "#adDeleteMember");
                            	
                            	$("#realDelete").click(function(){
                            	
		                            $.ajax({
		                                url:"<%= contextPath %>/adDelete.me",
		                                data:{"checkCnt":checkCnt},
		                                success:function(result){
		                                	if(result > 0){
		                                		location.reload();
		                                	}
		                                },
		                                error:function(){
		                                    console.log("ajax 게시글 삭제 실패")
		                                }
		                            })
                            	})
                            }							                            

                        }
		            </script>
		            
		            
		            
		
		
		
		        </div>
		    </main>
		</div>
	</div>
	
</body>
</html>