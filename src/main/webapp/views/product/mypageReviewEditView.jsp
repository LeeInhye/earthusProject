<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.us.product.model.vo.Review"%>
<%
	Review r = (Review)request.getAttribute("r");
%>
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
      	#rate-star{
	  display:inline-block;
	  border:0px;
	  padding-left:10px;
	}
	#rate-star input[type=radio]{
	  display:none;
	}
	.review-rate{
	  color:#fbd600;
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
	                    <img src="<%= r.getProImgPath() %>" style="height:90%; width:100%;">
	                </td>
	                <td><%= r.getProName() %></td>
	              </tr>
	            </tbody>
			</table>
		</div>

		<br><br><br>

		<form action="updateResult.re" method="post" enctype="multipart/form-data">
	         <div class="rate-area">
	            <span style="font-weight:bold;">당신의 별점은 : </span>
	            <fieldset id="rate-star">
	                  <input type="radio" name="rate" value="1" id="rate1">
	                  <label for="rate1"><i class="fa fa-star review-rate"></i></label>
	                  <input type="radio" name="rate" value="2" id="rate2">
	                  <label for="rate2"><i class="fa fa-star review-rate"></i></label>
	                  <input type="radio" name="rate" value="3" id="rate3">
	                  <label for="rate3"><i class="fa fa-star review-rate"></i></label>
	                  <input type="radio" name="rate" value="4" id="rate4">
	                  <label for="rate4"><i class="fa fa-star review-rate"></i></label>
	                  <input type="radio" name="rate" value="5" id="rate5">
	                  <label for="rate5"><i class="fa fa-star review-rate"></i></label>
                </fieldset>
	                
	                <script>
	                	// 기존 revRate와 같은 값을 가진 라디오버튼에 checked속성 부여하는 함수
	                	$(function(){
	                		$("input[name]rate").each(function(){
		                		if( $(this).val() == <%= r.getRevRate() %> ){
		                			$(this).prop("checked", true);
		                		}	                			
	                		})
	                	})
	                
	                    // 별점 checked속성에 대한 function (클릭하면 유지되도록)
	                  $(function(){
	                    $("input[name=rate]").change(function(){
	                      $(this).next().children().css("color", "#fbd600");
	                      $(this).prevAll("label").children().css("color", "#fbd600");
	                      $(this).next().nextAll("label").children().css("color", "#F2F2F2");
	                    })
	                  })                      
	                </script>
	         </div>
	         <br>
	         <div class="content-area">
	            <textarea name="content" id="edit-review-content" rows="10"><%= r.getRevContent() %></textarea>
	         </div>
	         <br>
	         <div class="file-area">
	            <span style="font-weight:bold;">이미지 첨부 :</span> <br>
	            <input type="file" name="review-image" onchange="loadThumbnail(this);" style="display:none;">
	            <div onclick="uploadFile();"><i class="fa fa-camera fa-2x"></i></div>
	            <div id="thumbnail"><img src="<%= r.getRevImgPath() %>"></div>
	         </div>
	         <br>
	         <div class="button-area" align="right">
	         	<input type="hidden" name="revNo" value="<%= r.getRevNo() %>">
	            <button type="submit" class="btn-review-edit" style="background-color:#778C79;">리뷰 수정</button>
	         </div>
		</form>
	</div>


   <!-- ***** SCRIPT AREA START ***** -->
	<script>
		// div영역 누르면 파일 업로드 버튼에 클릭 이벤트 부여
		function uploadFile(){
			$("input[name=review-image]").click();
		}
		
		// 파일 업로드 시 썸네일에 보이도록
		function loadThumbnail(inputFile){
			if(inputFile.files.length == 1){
				const reader = new FileReader();
				reader.readAsDataURL(inputFile.files[0]);
				reader.onload = function(e){
					$("#thumbnail").children().attr("src", e.target.result);
				}
			}else{
				$("#thumbnail").children().attr("src", null);
			}
		}
		
		// 글자수에 대한 조건처리
		$("textarea[name=content]").change(function(){
			if( $(this).val().length < 20 ){
				alert("최소 20자 이상을 입력해 주세요.");
				$("#submit-btn").attr("disabled", true);
			}else{
				$("#submit-btn").removeAttr("disabled");
			}
		})
      
		
      
	</script>
   <!-- ***** SCRIPT AREA END ***** -->
   
   
   <%@ include file="../common/footerbar.jsp" %>
   
 </body>
 </html>