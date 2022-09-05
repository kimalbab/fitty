<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fitty 채팅</title>
<link type="text/css" rel="stylesheet" href="resources/css/chat.css" />
<script type="text/javascript" src="resources/js/chat.js"></script>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="row">
   <!-- 채팅메뉴 -->
 <div class="col-md-3">
   <div class="card mb-4 chatMenu" style="background-color: #E7E7FF;">
     <div class="btnFlex">
       <button class="col-md-6" aria-selected="true">🙋‍♀️ MEMBER</button>
       <button class="col-md-6">💌 CHAT</button>
     </div>
     <form class="chatMenuForm">
       <table>
         <tr>
           <th rowspan="2">&nbsp&nbsp&nbsp<img src="sneat-1.0.0/assets/img/avatars/1.png" alt class="w-px-50 h-auto rounded-circle"/></th>
           <td>홍길동 트레이너</td>
         </tr>
         <tr>
           <td>🧘‍♂️ 대기중</td>
         </tr>
       </table>

       <!-- Search -->
       <div class="navbar-nav align-items-center" style="margin-top: 20px;">
         <div class="nav-item d-flex align-items-center">
           <i class="bx bx-search fs-4 lh-0"></i>
           <input type="text" class="form-control border-0 shadow-none" placeholder="Search..." aria-label="Search...">
         </div>
       </div>
       <!-- /Search -->

       <div>
         <ul class="empList">
           <li>관리자</li>
             <ul>
               <li><b>최사장</b> 🧘‍♂️ 대기중</li>
               <li><b>김부사장</b>  🏋️‍♂️ 수업중</li>
             </ul>
           <li>트레이너</li>
             <ul>
               <li><b>윤헬트</b>  🥗 휴식중</li>
               <li><b>박진진</b>  🧘‍♂️ 대기중</li>
               <li><b>이나나</b>  🧘‍♂️ 대기중</li>
               <li><b>최파파</b>  🧘‍♂️ 대기중</li>
             </ul>
         </ul>
       </div>
       
     </form>
   </div>
 </div>


 <!-- 채팅창 -->
 <div class="col-md-9 ">
   <div class="card mb-4 vacDetailDiv">
       <h5 class="card-header" style="margin-bottom : 20px"><b>📝 근태 수정요청서 작성</b></h5>
       <div class="card-body" style="width: 95%;">
         <form id="formAccountSettings" method="POST" onsubmit="return false">
           <div class="row">
             <div class="mb-3 col-md-6">
               <label for="firstName" class="form-label">수정요청일</label>
               <input class="form-control" type="date" id="modifyDate" name="modifyDate" value="" autofocus required/>
             </div>
             <div class="mb-3 col-md-6">
               <label for="organization" class="form-label">수정요청 상태</label>
               <div style="height : 10px"></div>
               <input class="form-check-input" type="radio" name="change" value="workIn">&nbsp출근수정&nbsp&nbsp&nbsp&nbsp&nbsp
               <input class="form-check-input" type="radio" name="change" value="rest">&nbsp휴식수정&nbsp&nbsp&nbsp&nbsp&nbsp
               <input class="form-check-input" type="radio" name="change" value="workOut">&nbsp퇴근수정&nbsp&nbsp&nbsp&nbsp&nbsp
               <input class="form-check-input" type="radio" name="change" value="etc">&nbsp기타수정&nbsp&nbsp&nbsp&nbsp&nbsp
             </div>
             <div class="mb-3 col-md-12" style="margin-top: 20px;">
                <label for="address" class="form-label" >수정 요청사유</label><br>
                <textarea class="textarea" autofocus required></textarea>
              </div>
            </div>
            <div class="mt-2 btnDiv">
              <button type="submit" class="btn btn-primary me-2">직원등록</button>
              <button type="button" class="btn btn-secondary me-2">목록으로</button>
            </div>
          </form>
        </div>
    </div>
  </div>
</div>


</body>
</html>