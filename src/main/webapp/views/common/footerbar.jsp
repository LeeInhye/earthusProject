<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

</head>
<body>

	<!--::footer_part start::-->
     <footer class="footer_part">
        <div class="container">
            <div class="row justify-content-around">
                <div class="col-lg-5 col-lg-3">

                    <div class="company_link_part">
                        <div>
                            <span class="list-unstyled"><a href="<%= contextPath%>/views/cs/homepage/companyInfo.jsp">회사소개</a></span>
                            <span class="list-unstyled"><a href="<%= contextPath %>/views/cs/homepage/termsView.jsp">이용약관</a></span>
                        </div>
                       
                    </div>

                    <div class="single_footer_part">
                        <p>
                            · 상호명 : Earth.Us <br>
                            · 사업자등록번호 : 492-49-00700 <br>
                            · 주소 : 08505 서울시 금천구 가산디지털2로 115, 911호 <br>
                            · 이메일 : earthus.22@gmail.com <br><br>

                            © Earth.Us 2022 | All right reserved <br>
                        </p>
                    </div>
                    
                </div>
                
                <div class="col-lg-5">
                    <div class="single_footer_part" style="margin-left:20%; width:900px;">
                        <img src="<%= contextPath %>/resources/img/logo.png" alt="logo" style="width:250px;">
                        <p>
                            대표전화 &nbsp;02-1234-5678 <br><br>
                            운영시간 &nbsp;월-금 10시 - 18시 / 점심시간 12시 - 13시 <br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            주말, 공휴일 휴무
                        </p>
                        
                    </div>
                </div>
            </div>
            
        </div>
        
    </footer>
    

</body>
</html>