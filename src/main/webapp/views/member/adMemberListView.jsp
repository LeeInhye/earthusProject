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
		                            
	                				for(let i = 0; i < newList.length; i++){
										// 검색 결과 넣어주기	
	                					txt += '<tr><td onclick="event.cancelBubble=true;"><input type="checkbox" name="checkMember"></td>';
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
			                            
			                            console.log(newList[i].userEnrollDate);
			                            
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
			                            <!--  포인트 넣기 -->
			                            txt += "<td>" + newList[i].point + "</td>";
			                            txt += "<td>" + newList[i].userStatus + "</td>";
			                            txt += '<td class="btn_left">';
			                            txt += '<button type="button" class="btn-sm btn_black" data-toggle="modal" data-target="#adUpdateMember">수정</button></td></tr>';
			                            
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
		                        <tr style="cursor: auto;">
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
		                            <td><%= m.getPoint() %></td>
		                            <td><%= m.getUserStatus() %></td>
		                            <td class="btn_left">
		                                <button type="button" class="btn-sm btn_black">수정</button>
		                                
		                            </td>
		                        </tr>
		                        
		                      <% } %>
		                        
		
		                    </tbody>
		                </table>
		                
		                <br><br>
		                <div>
		                    <button type="button" id="deleteBtn" class="btn btn_black btn_left" data-bs-toggle="modal" data-bs-target="#nocheck">
		                    회원삭제</button>
		                </div>
		                
		                
                        <script>
			            	$(function(){
			            		$(".M_member_table>tbody>tr").on("click", "td:last-child", function() {
			            			console.log( $(this).parent().children().eq(1).text() );
			            			location.href = "<%= contextPath %>/adUpdateForm.me?mNo=" + $(this).parent().children().eq(1).text();
			            			})
			            			
			            		});
			         	</script>    
                        
		                
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
                    <div class="modal" id="adDeleteMember" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
	                
	                <!-- 회원 선택 안했을 때 -->
	                <div class="modal" id="nocheck" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
	               		$(function(){
	                	
	                		// 회원 삭제
                            var checkCnt = "";

                            $("input:checkbox").change(function(){
                            	checkCnt = "";
                            	$("input:checkbox[name=checkMember]:checked").each(function(){
	                                checkCnt += ($(this).val()) + ","; // 체크된 것만 게시글번호 뽑기 "2,3,4,"
	                            })
	                            
	                            checkCnt = checkCnt.substring(0,checkCnt.lastIndexOf(",")); // 맨 뒤 콤마 삭제 "2,3,4"
	                            console.log(checkCnt);
	                            
	                            // 선택된 체크박스 없이 삭제 버튼 누른 경우
	                            if(checkCnt == ''){
	                            	$("#deleteBtn").attr("data-bs-target", "#nocheck");
	                            }

	                            else {
	                            	$("#deleteBtn").attr("data-bs-target", "#adDeleteMember");
	                            }
                            })

                            
                            $("#realDelete").click(function(){
                            	
                                $.ajax({
                                    url:"<%= contextPath %>/adDelete.me",
                                    data:{"checkCnt":checkCnt},
                                    success:function(result){
                                    	if(result > 0){
                                    		location.reload();
                                    	} else{
                                    		alert("회원 삭제에 실패하였습니다.");
                                    	}
                                    },
                                    error:function(){
                                        console.log("ajax 게시글 삭제 실패")
                                    }
                                });
                        	});

                        })
	                	
	                	
                    
		            </script>
		            
		            
		            
		
		
		
		        </div>
		    </main>
		</div>
	</div>
	
</body>
</html>