<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
 <html lang="en">
 <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 수정</title>

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
 
	<%@ include file="../common/menubar.jsp" %>
	
	<!--================ START BANNER AREA =================-->
    <section class="breadcrumb contents_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h2>리뷰 수정</h2>
                            <p>구매한 상품에 리뷰를 남기고 조회, 수정, 삭제해 보세요!</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
   	<!--================ END BANNER AREA =================-->
 
 	<div class="edit-review-outer" style="margin:auto; width:930px; margin-bottom:200px;">
      
		<div class="edit-review" style="border:1px solid #DCDCDC; border-radius:10px;">
			<table id="product-info"">
	            <tbody>
	              <tr>
	                <td width="150px;" height="100px" style="padding-left:50px; padding-right:20px">
	                    <img src="img/product/product_4.png" style="height:90%; width:100%;">
	                </td>
	                <td> 상품명</td>
	              </tr>
	            </tbody>
			</table>
		</div>

		<br><br><br>

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
   
   
   <%@ include file="../common/footerbar.jsp" %>
   
 </body>
 </html>