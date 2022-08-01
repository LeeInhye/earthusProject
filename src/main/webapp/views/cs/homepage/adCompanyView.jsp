<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String html = (String)request.getAttribute("html");
%>
<%@ include file="../../common/adminMenubar.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>회사 소개 관리</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        
        <!-- Script for Summernote -->
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
                
        <style>
            button{
                background-color:#404040;
                color:#F2F2F2;
                border:1px solid #F2F2F2;
            }
            #summernote{
            	width:100%;
            	height:800px;
            	resize:none;
            }
        </style>
    </head>
    <body>
   
        <div id="layoutSidenav">
            <div id="layoutSidenav_content">
                <div class="container-fluid px-4" style="width:800px;">
                    <h1 class="mt-4" style="padding-top:50px;">회사 소개 관리</h1>
                    <hr>
                    <div  style="margin-top:30px;">
                        <div class="editor-body">
                            <form action="<%=contextPath%>/insertInfo.hm" method="post">
                                <textarea id="summernote" name="comInfo"><%= html %></textarea>
                                <br>
								<div id="button area" align="right">
									<button type="submit" style="border-radius: 5px;">변경사항 반영</button>
								</div>
                            </form>
                        </div>
                    </div>
                </div>
                
                <script>
                    $('#summernote').summernote({
                    	spellCheck: true,
                    	disableDragAndDrop: true,
						codeviewFilter: false,
						codeviewIframeFilter: true,
						placeholder: '회사 소개를 입력해 주세요.',
						tabsize: 2,
						height: 800,
						toolbar: [
						   ['style', ['fontname', 'fontsize', 'bold', 'italic', 'underline', 'clear']],
						   ['color', ['color']],
						   ['para', ['ul', 'ol', 'paragraph']],
						   ['insert', ['link', 'picture', 'hr']],
						   ['view', ['fullscreen']]
                      	],
                        onImageUpload: function(files, editor, webEitable){
                        	// 이미지 업로드하면 이벤트 발생시킴 (개수대로 함수 sendFile 호출)
                            for(var i=0; i<files.length; i++){
                                sendFile(files[i], editor, welEditable);
                            }
                        }
                        
                    });

                    function sendFile(file, editor, welEditable){
                        var imgUrl = 'sources/img/homepage/'

                        // 파일 전송을 위한 form 생성
                        form_data = new FormData();
                        form_data.append("image", file);
                        $.ajax({
                            data: form_data,
                            type: "post",
                            url: "summernote_imageUpload.do",
                            dataType: "text",
                            cache: "false",
                            enctype: "multipart/form-data",
                            processData:"false",
                            success: function(savename){
                                imgUrl = imgUrl + savename;
                                editor.insertImage(welEditable, imgUrl); // 에디터에 업로드된 이미지 삽입
                            },
                            error: function(){
                                alert("error");
                            }

                        })
                    }
                    // $(".note-editable").change( console.log( $(this).html() ) )
                    
                  </script>
                
                <br><br><br><br><br><br><br><br>


            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
    