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
        <title>Tables - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

        <!-- Modal -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <!-- Modal -->

        <!-- My Style -->
        <style>
            .banner-manage-body{
                padding-top:50px;
                margin:auto;
            }
            #datatablesSimple{
                color:#404040;
            }
            #add-banner{
                width:100px;
                height:40px;
                border:0px;
                border-radius:5px;
                background-color: #778C79;
                color:#F2F2F2;
                font-weight: bold;
            }
            .dataTable-info{
                visibility: hidden;
            }
            .modal-body{
                padding-top:50px;
                width:80%;
                margin:auto;
            }
            #thumbnail{
                width:100%;
                margin:auto;
                height:100px;
                border:1px solid black;
            }
            #banner-status *{
                display:inline-block;
                margin-top:30px;

            }
            .modal-body p{
                font-weight:bold;
            }
        </style>
        <!-- My Style -->

    </head>
        <%@ include file="../common/adminMenubar.jsp" %>

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 style="padding-top:100px;">배너 관리</h1>
                        <hr>

                        <div class="banner-manage-body" style="width:800px;">
                            <table id="datatablesSimple" class="banner-manage ">
                                <thead>
                                    <tr>
                                        <th width="10px">NO</th>
                                        <th width="100px;">상태</th>
                                        <th width="600px;">이미지</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>3</td>
                                        <td>진행</td>
                                        <td height="150px;">
                                            <a href="" id="activate-edit-modal" data-toggle="modal" data-target="#edit-banner"><img src="assets/img/error-404-monochrome.svg" style="height:100%"></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>종료</td>
                                        <td height="150px;"><img src="assets/img/error-404-monochrome.svg" style="height:100%"></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>종료</td>
                                        <td height="150px;"><img src="assets/img/error-404-monochrome.svg" style="height:100%"></td>
                                    </tr>
                                </tbody>
                            </table>

                            <div align="right">
                                <button type="button" id="add-banner" data-toggle="modal" data-target="#add-banner">배너 등록</button>
                            </div>

                            <br><br><br><br><br>
                        </div>

                        <!-- 페이징 처리 필요 없음 -->
                        
                    </div>
                </main>

                <!-- ========== START MODAL AREA ========== -->
                <!-- Modal - Edit Banner -->
                <div class="modal fade" id="edit-banner" role="dialog">
                    <div class="modal-dialog">

                <!-- Modal Content - Edit Banner -->
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title">배너 수정</h3>
                    </div>
                    <form action="" method="get">
                        <div class="modal-body">
                            <p>배너 이미지 수정</p>
                            <div id="thumbnail" onclick="uploadImg();">
                                <input type="file" name="banner-img" id="input-img" style="visibility:hidden;">
                                <!-- 파일 업로드하면 업로드된 사진이 썸네일에 변경되어 보여야 함 -->
                            </div>

                            <div id="banner-status">
                                <p style="padding-right:10px;">배너 상태 수정</p>
                                <select name="bn-status" id="bn-status">
                                    <option value="Y">공개</option>
                                    <option value="N">삭제</option>
                                </select>
                            </div>

                        </div>
                        <div class="modal-footer">
                        <button type="submit" class="btn btn-default" data-dismiss="modal">수정완료</button>
                        </div>
                    </form>
                </div>

                <!-- Modal - Add Banner -->
                <div class="modal fade" id="add-banner" role="dialog">
                    <div class="modal-dialog">

                <!-- Modal Content - Add Banner -->
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title">배너 등록</h3>
                    </div>
                    <form action="" method="get">
                        <div class="modal-body">
                            <p>배너 이미지 등록</p>
                            <div id="thumbnail" onclick="uploadImg();">
                                <input type="file" name="banner-img" id="input-img" style="visibility:hidden;">
                                <!-- 파일 업로드하면 업로드된 사진이 썸네일에 변경되어 보여야 함 -->
                            </div>

                            <button type="submit" class="btn btn-default" data-dismiss="modal">등록완료</button>
                        </div>
                        <div class="modal-footer">
                        </div>
                    </form>
                </div>
                <!-- ========== END MODAL CONTENT AREA ========== -->


                <!-- ========== START SCRIPT AREA ========== -->
                <script>
                    function uploadImg(){
                        document.getElementById("input-img").click();
                    }
                </script>
                
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
        