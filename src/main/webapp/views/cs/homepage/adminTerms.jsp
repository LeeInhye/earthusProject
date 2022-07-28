<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>이용 약관 관리</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <style>
            button{
                background-color:#404040;
                color:#F2F2F2;
                border:1px solid #F2F2F2;
            }
        </style>
    </head>
    <body>

        <%@ include file="../../common/adminMenubar.jsp" %>
        
        <div id="layoutSidenav">
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4" style="width:800px;">
                        <h1 class="mt-4">이용 약관 관리</h1>
                        <hr>
                       	<form action="" method="post">
	                        <div class="card mb-4" style="margin-top:50px; height:800px;">
	                            <div class="editor-body">
	                                <div class="mb-0">
	                                    에디터 추가할 예정
	                                </div>
	                            </div>
	                        </div>
	                        <div id="button area" align="right">
		                        <button type="submit" style="border-radius:5px;">변경사항 반영</button>
	                        </div>
                       	</form>  
                    </div>
                </main>
                <br><br><br><br><br><br><br><br>

            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
    