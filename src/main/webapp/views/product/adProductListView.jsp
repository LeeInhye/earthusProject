<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 관리 > 상품 > 조회 - Earth.Us</title>
</head>
<body>
	<%@include file = "../common/adminMenubar.jsp" %>
	
	<div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <div class="container selectProduct">
                    <h3 class="mt-4" style="font-weight:bold;">상품 > 조회</h3>
                    <hr><br>

                    <div class="container pro-info-area">
                        <!-- 정렬 바 시작-->
                        <div class="pro-info-var">
                            <table height="100%" style="margin:auto">
                                <tr>
                                    <td width="20%" class="tb-title">카테고리</td>
                                    <td width="80%" colspan="3">
                                        <input type="checkbox" name="hair" id="hair" value="hair"> <label for="hair">Hair</label>
                                        <input type="checkbox" name="body" id="body" value="body"> <label for="body">Body</label>
                                        <input type="checkbox" name="kitchen" id="kitchen" value="kitchen"> <label for="kitchen">Kitchen</label>
                                        <input type="checkbox" name="bath" id="bath" value="bath"> <label for="bath">Bath</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tb-title">상품 등록일</td>
                                    <td width="40%">
                                        <button type="button" class="btn btn-sm" onclick="dateAll();">전체</button>
                                        <button type="button" class="btn btn-sm" onclick="dateNow();">오늘</button>
                                        <button type="button" class="btn btn-sm" onclick="date7();">7일</button>
                                        <button type="button" class="btn btn-sm" onclick="date30();">30일</button>
                                    </td>
                                    <td width="40%" colspan="2">
                                        <input type="date" class="btn btn-sm"> ~ <input type="date" class="btn btn-sm">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tb-title">검색</td>
                                    <td colspan="3">
                                        <input type="text" class="form-control" name="proKeyword" placeholder="키워드를 입력하세요.">
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <hr>
                        <!-- 정렬 바 끝 -->

                        <!-- 상품 조회 영역 시작-->
                        <table id="pro-select-tb" border="1" style="text-align:center; width:100%">
                            <thead>
                                <tr height="30px">
                                    <th width="5%">
                                        <input type="checkbox" id="selectAll">
                                    </th>
                                    <th width="30%">
                                        상품코드
                                    </th>
                                    <th width="30%">
                                        상품명
                                    </th>
                                    <th width="25">
                                        재고수량
                                    </th>
                                    <th width="10%">

                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <input type="checkbox" class="checkbox">
                                    </td>
                                    <td>1</td>
                                    <td>고그린헤어 샴푸바</td>
                                    <td>2000</td>
                                    <td>
                                        <button class="btn btn-sm btn-update" onclick="updatePro();">수정</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox" class="checkbox">
                                    </td>
                                    <td>1</td>
                                    <td>고그린헤어 샴푸바</td>
                                    <td>2000</td>
                                    <td>
                                        <button class="btn btn-sm btn-update" onclick="updatePro();">수정</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox" class="checkbox">
                                    </td>
                                    <td>1</td>
                                    <td>고그린헤어 샴푸바</td>
                                    <td>2000</td>
                                    <td>
                                        <button class="btn btn-sm btn-update" onclick="updatePro();">수정</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <button class="btn btn-sm btn-update" id="pro-delete-btn" style="width:80px; margin-top:10px;">상품삭제</button>
                        <!-- 페이징도 구현해야됨...-->
                        <!-- 상품 조회 영역 끝-->
                    </div>
                </div>
            </div>
        </main>
                
        <script>
            function dateAll(){
                // 클릭된 버튼만 lightgray 배경!! 
            }
            $(function(){
                $('#selectAll').click(function(){
                    if( $(this).is(":checked")){
                        $('.checkbox').prop('checked', true);
                    }else {
                        $(".checkbox").prop('checked', false);
                    }
                })

                $('#pro-delete-btn').click(function(){
                    if(confirm("상품을 삭제하시겠습니까?")){
                        // checked된 상품만 삭제 후
                        alert("상품이 삭제되었습니다.");
                    }
                })
            })
        </script>
</body>
</html>