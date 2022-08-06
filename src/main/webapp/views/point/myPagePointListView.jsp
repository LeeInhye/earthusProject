<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        .mypoint{
          width:70%;
          margin:auto;
          margin-top:200px;
        }
        #mybtn{
            background-color:rgb(168,191,170);
            border:0;
            color:white;
            width:100px;
            height:30px;
            border-radius:20px;
            float:right;
        }
        .table{text-align:center;}
        .table th{background-color:rgb(242,242,242)}
        #select{
          margin-top:20px;
          margin-left:10px;
        }
        #select>button{
          border:1px solid lightgray;
          font-size:small;
          width:60px;
          height:25px;
          border-radius:3px;
          background-color:white;
        }
        #btn-list>button{
          border:0;
          background-color: white;
          padding-top:60px;
          font-weight: bold;
        }
        .date{border:1px solid lightgray;}
    </style>
</head>
<body>

   <%@ include file="/views/common/menubar.jsp" %>
   
   <section class="mypoint">
    <h2>포인트 관리</h2>
    <br>
    <span style="font-size:small">
      포인트는 구매 확정 시 지급됩니다. 구매 후기 작성 시 포인트 지급됩니다. <br>
      챌린지 참여를 통해 포인트를 획득하실 수 있습니다. <br>
      얼스어스의 포인트는 1P 당 1원으로 사용 가능합니다.

    </span>
    <button id="mybtn">마이페이지 &gt;</button>

    <hr><br>

    <div id="select">
      <span>기간별 검색</span>&nbsp;
      <button class="d-btn" id="d1">전체</button><button class="d-btn" id="d2">오늘</button><button class="d-btn" id="d3">7일</button><button class="d-btn" id="d4">30일</button>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      
      
      <input type="date" class="date" id="n1">
      <span>~</span>
      <input type="date" class="date" id="n2">
      <button style="background:rgb(168,191,170); color:white;">조회</button>
    </div>

    <div id="btn-list">
      <button>전체</button> <button>적립</button> <button>사용</button> 
    </div>
    <hr><br>
  </section>
  
  

  <!--================ 포인트 테이블 =================-->
  <section class="cart_area">
      <div class="">
        <div class="table-responsive">
          <table class="table" style="width:70%" align="center">
            <thead>
              <tr>
                <th scope="col">날짜</th>
                <th scope="col">유형</th>
                <th scope="col">적립 내용</th>
                <th scope="col">포인트내역</th>
                <th scope="col">잔여포인트</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>2020-07-07</td>
                <td>적립</td>
                <td>챌린지 참여</td>
                <td>+ 1000</td>
                <td>2000</td>
              </tr>
              <tr>
                <td>2020-07-07</td>
                <td>사용</td>
                <td>포인트 결제</td>
                <td>- 3000</td>
                <td>1000</td>
              </tr>
              <tr>
                <td>2020-07-07</td>
                <td>적립</td>
                <td>주문</td>
                <td>+ 1000</td>
                <td>4000</td>
              </tr>
              <tr>
                <td>2020-07-07</td>
                <td>적립</td>
                <td>챌린지 참여</td>
                <td>+ 2000</td>
                <td>3000</td>
              </tr>
              <tr>
                <td>2020-07-07</td>
                <td>적립</td>
                <td>회원가입 축하 포인트</td>
                <td>+ 1000</td>
                <td>1000</td>
              </tr>
              <tr>
                <td></td><td></td><td></td><td></td><td></td>
              </tr>
              
            </tbody>
          </table>
        </div>
      </div>
  </section>
   
   
   
   <br><br><br><br><br><br>
   <%@ include file="/views/common/footerbar.jsp" %>
   

</body>
</html>