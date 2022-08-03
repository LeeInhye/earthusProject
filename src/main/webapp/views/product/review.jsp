<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	page import="com.us.product.model.vo.Product, com.us.common.model.vo.PageInfo"
%>
<%
	Product p = (Product)session.getAttribute("p");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	<!-- 리뷰 영역 스타일 -->
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
	#profile p {
		text-align:center;
	}
</style>


</head>
<body>

<%@ include file="/views/common/menubar.jsp" %>

	     <!-- 아래부터 Review 영역!! -->
        <!-- 아래부터 Review 영역!! -->
        <div class=".wrap" style="padding-top:500px;"> <!-- 이거 빼고 복사 -->
        
        
          <div class="row">
            <div class="col-lg-6">
              <div class="row total_rate">
                <div class="col-6">
                  <div class="box_total"  style="background-color: #F2F2F2;">
                    <h5>평점</h5>
                    <h4 style="color:#778C79;">4.0</h4>
                    <h6>(03명의 후기)</h6>
                  </div>
                </div>
                <div class="col-6">
                  <div class="rating_list">
                    <h3>3개의 리뷰</h3>
                    <ul class="list">
                      <li>
                        <a href="#">
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i style="color:gray; font-style: normal;"></i>
                          <span style="padding-left:10px;">3</span>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star" style="color:#F2F2F2"></i> 
                          <i style="color:gray; font-style: normal;"></i>
                          <span style="padding-left:10px;">3</span>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star" style="color:#F2F2F2"></i>
                          <i class="fa fa-star" style="color:#F2F2F2"></i> 
                          <i style="color:gray; font-style: normal;"></i>
                          <span style="padding-left:10px;">3</span>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star" style="color:#F2F2F2"></i>
                          <i class="fa fa-star" style="color:#F2F2F2"></i>
                          <i class="fa fa-star" style="color:#F2F2F2"></i> 
                          <i style="color:gray; font-style: normal;"></i>
                          <span style="padding-left:10px;">3</span>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star" style="color:#F2F2F2"></i>
                          <i class="fa fa-star" style="color:#F2F2F2"></i>
                          <i class="fa fa-star" style="color:#F2F2F2"></i>
                          <i class="fa fa-star" style="color:#F2F2F2"></i> 
                          <i style="color:gray; font-style: normal;"></i>
                          <span style="padding-left:10px;">3</span>
                        </a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
              <br><br>
              
              <!-- 리뷰 조회 영역 (for문 돌려) -->
              <div class="review_list">
                <div class="review_item">
                  <div class="media">
                    <table id="member-info">
                      <tr>
                        <td width="50px">김지*</td>
                        <td width="100px;">2022-07-26</td>
                      </tr>
                    </table>
                    <div class="media-body">
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                    </div>
                  </div>
                  <div class="review-content" style="height:200px;">
                    <p class="review-content-text" style="width:60%; height:100%; float:left; box-sizing:border-box; word-break:break-all;">
                      Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                      sed do eiusmod tempor incididunt ut labore et dolore magna
                      aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                      ullamco laboris nisi ut aliquip ex ea commodo
                    </p>
                    <div class="review-content-photo" style="width:40%; height:100%; padding-left:20px; padding-top:20px; float:left; box-sizing:border-box;">
                      
                      <a href="" id="activate-modal" data-toggle="modal" data-target="#myModal">
                        <img src="img/product/b3.jpg" id="review-img">
                      </a>
                    </div>
                  </div>
                  <br><br>
                </div>
              </div>
            </div>
            
            <!-- 리뷰 작성 영역 -->
            <div class="col-lg-6">
	            <div class="col-md-12">
	              <div class="form-group">
	                <h4>리뷰 작성하기</h4>
	                
	                <p style="display:inline;">당신의 별점은: </p>
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
	                  $(function(){
	                    // 별점 checked속성에 대한 function (클릭하면 유지되도록)
	                    $("input[name=rate]").change(function(){
	                      $(this).next().children().css("color", "#fbd600");
	                      $(this).prevAll("label").children().css("color", "#fbd600");
	                      $(this).next().nextAll("label").children().css("color", "#F2F2F2");
	                    })
	                  })                      
	                </script>
	         
	                <textarea name="content" rows="4" placeholder="상품에 대한 리뷰를 최소 20자 이상 입력해주세요." style="width:100%; border:1px solid gainsboro; resize:none;"></textarea>
	                <input type="file" name="photo">
	              </div>
	            </div>
	            
	            <div class="col-md-12 text-right">
	            	<%-- <input type="hidden" id="userNo" value="<%= loginUser.getUserNo() %>"> --%>
	            	<%-- <input type="hidden" id="proCode" value="<%= p.getProCode() %>"> --%><
					<button class="btn" id="submit-form" onclick="insertReview();" style="background-color:#A8BFAA; color:#F2F2F2;" disabled>제출하기</button>
	            </div>
            </div>
          </div>
        </div> <!-- 이거 빼고 복사 -->
        
        <!-- 리뷰 영역 스크립트 -->
        <script>
        	// 글자수에 대한 조건처리
        	$("textarea[name=content]").change(function(){
        		if( $(this).val().length < 20 ){
        			alert("최소 20자 이상을 입력해 주세요.");
        			$("#submit-form").attr("disabled", true);
        		}else{
        			$("#submit-form").removeAttr("disabled");
        		}
        	})
        	
        	console.log( $("input[type=file]").val() );
        	console.dir( $("input[type=file]") )
        	
        	// 리뷰 요청처리하는 AJAX 함수
        	function insertReview(){
        		$.ajax({
        			url:"<%=contextPath%>/insert.re",
        			data:{
        				userNo:$("#userNo").val(),
        				proCode:$("#proCode").val(),
        				revRate:$("input[name=rate]:checked").val(),
        				revContent:$("textarea[name=content]").val(),
        				photo:$("input[name=photo]").val()
        			},
        			type:"post",
        			contentType:false,
        			processData:false,
        			success:function(result){
        				if(result > 0){
        					// 리뷰 리스트 갱신
        					selectReview(); 
        					
        					// 리뷰 작성 영역 초기화 
        					$("input[name=rate]:checked").val(5),
        					$("textarea[name=content]").val(""),
        					$("input[name=photo]").val("")
        				}
        			},
        			error:function(){
        				alert("리뷰 작성에 실패했습니다.");
        			}
        		})
        	}
        	
        
        </script>
        
        <!-- 리뷰 영역 끝!!! -->
</body>
</html>