<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
 <html lang="en">
 <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 관리</title>

    <!-- jQuery Script -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <style>
      body{
         background-color:#F2F2F2;

      }
      .edit-review-outer{
         padding-left:50px;
         padding-right:50px;
      }
      #edit-review-content{
         width:100%; 
         resize:none; 
         border:1px solid #F2F2F2;
         border-radius: 10px;
      }
      .btn-review-edit{
         background-color:#A8BFAA;
         color:#F2F2F2;
         border: none;
         border-radius:10px;
         width:100px;
         height:30px;
         font-size:15px; font-weight: bold;
      }
      .btn-review-edit:hover{
         color:#404040 ;
         transition: 500ms;
      }
      .file-area>div{
         width:70px;
         height:70px;
         margin:10px 0px;
         background-color:white;
         border:1px solid #F2F2F2;
         border-radius: 5px;
         display: inline-block;
         vertical-align:top;
         text-align: center;
         line-height: 80px;
      }

      #product-info{
         width:100%;
         height:50px;
         box-sizing: border-box;
      }
    </style>
   
   <!-- FontAwesome CDN -->
   <script src="https://use.fontawesome.com/8c32e29d8c.js"></script>
   <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
 </head>
 <body>
 
   <div class="edit-review-outer">
      <h1>리뷰 관리</h1>
      
      <div class="edit-review">
         <table id="product-info">
            <tbody>
              <tr>
                <td width="50px;" height="60px">
                    <img src="img/product/product_4.png" style="border-radius:15px; height:100%;">
                </td>
                <td> &nbsp; 상품명</td>
              </tr>
            </tbody>
          </table>
      </div>

      <br>

      <form action="" method="post">
         <div class="rate-area">
            <span style="font-weight:bold;">당신의 별점은 : </span>
         </div>
         <br>
         <div class="content-area">
            <textarea name="review-content" id="edit-review-content" rows="10">기존에 입력했던 사용자의 글을 출력</textarea>
            <!-- 미리보기 사진 첨부 & input:file은 hidden으로 (썸네일 클릭으로 첨부할 수 있도록) -->
         </div>
         <br>
         <div class="file-area">
            <span style="font-weight:bold;">이미지 첨부 :</span> <br>
            <input type="file" name="review-image" style="display:none;">
            <div onclick="uploadFile();"><i class="fa fa-camera fa-2x"></i></div>
            <div></div>
         </div>
         <br>
         <div class="button-area" align="right">
            <button type="button" class="btn-review-edit">리뷰 삭제</button>
            <button type="submit" class="btn-review-edit" style="background-color:#778C79;">리뷰 수정</button>
         </div>
      </form>
   </div>


   <!-- ***** SCRIPT AREA START ***** -->
   <script>
      function uploadFile(){
         $("input[name=review-image]").click();
      }
   </script>
   <!-- ***** SCRIPT AREA END ***** -->
   
 </body>
 </html>