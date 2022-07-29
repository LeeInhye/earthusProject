<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
    .enrollForm {
        margin-left: 20%;
    }
    .enrollForm p {
        font-size: 17px;
        font-weight: bold;
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
                    <h3 class="mt-4" style="font-weight:bold;">콘텐츠 관리 > 수정/등록</h3>
                    <hr><br>
                    <div class="enrollForm">
                        <form action="<%=contextPath%>/insert.co" method="post" enctype="multipart/form-data">
                            <p>제목</p>
                            <input type="text" name="title" style="width:700px" required>
                            <br><br>

                            <p>내용</p>
                            <textarea name="content" rows="10" style="width:700px; resize: none;"></textarea>
                            <br><br>

                            <p>썸네일 이미지</p>
                            <input type="file" name="file1" onchange="loadImg(this);" required>
                            <br><br>
                            <div style="width:685px; text-align:center;">
                                <img src="" id="thumbnailImg" width="685px" height="260px" onclick="chooseFile();"><br>
                                <span>썸네일 미리보기</span>
                            </div>
                            <br>

                            <p>게시글 내 이미지</p>
                            <input type="file" name="file2" required>
                            <br><br><br>
                        
                            <button type="button" class="btn_admin_cancel" style="margin-left:2%">취소</button>
                            <button type="submit" class="btn_admin_enroll">등록</button>

                            <script>
                                function chooseFile(){
                                    $("input[name=file1]").click();
                                }

                                function loadImg(inputFile){
                                    // inputFile : 현재 변화가 생긴 input type="file" 요소객체
                                    if(inputFile.files.length == 1){ // 파일 선택된 경우 => 읽어들여서 미리보기
                                        const reader = new FileReader();
                                        reader.readAsDataURL(inputFile.files[0]);
                                        reader.onload = function(e){
                                            $("#thumbnailImg").attr("src", e.target.result);
                                        }
                                    }else { // 파일 취소된 경우 => 미리보기 사라지게
                                        $("#thumbnailImg").attr("src", null);
                                    }
                                }
                            </script>
                        </form>
                  </div>
               </div>
            </main>
            <br><br>
        </div>
	</div>
</body>
</html>