<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  .topBox{
    border:1px solid lightgray;
    width:300px;
    height:200px;
    float:left;
    border-radius: 5px;
    margin-left:30px;
    margin-bottom:30px;
  }
  .purple{
    width:50px;
    height:20px;
    border-radius:5px;
    background-color:rgb(105, 108, 255);
    color:white;
    font-size:11px;
    float:left;
    margin-left: 10px;
    margin-top:10px;
    text-align:center;
    padding-top:2px;
  }
  .topBox span{
    margin-left:10px;
    margin-top:10px;
  }
  .topBox hr{
    margin-top:13px;
    margin-bottom:13px;
    color:lightgray;
  }
  .s1{font-size:12px;}
  #appr{
    font-size:14px;
    font-weight:bold;
    padding-bottom:10px;
  }
  .mMiddle{float:left; width:95%;}
  .mMiddle>span{margin-left:30px;}
  .mBox{
    border:1px solid lightgray;
    width:100%;
    height:180px;
    border-radius: 5px;
    margin-left:30px;
    margin-top:10px;
  }
  .t1>td{font-size:13px; text-align:center; border-bottom: 1px solid lightgray;}
  .t2>td{font-size:13px; text-align:center; padding-top:7px;}
  .mBottom{margin-top:30px;float:left; width:95%;}
  .mBottom>span{margin-left:30px;}
  .list a{color:rgb(51, 51, 51);}
  .ing{
    width:50px;
    height:20px;
    border-radius:5px;
    background-color:rgb(105, 108, 255);
    color:white;
    font-size:11px;
    padding:2px;
    margin:auto;
  }
  .fin{
    width:50px;
    height:20px;
    border-radius:5px;
    background-color:rgb(133, 146, 163);
    color:white;
    font-size:11px;
    padding:2px;
    margin:auto;
  }
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	<div class="outer">
       <jsp:include page="sideMenu.jsp"/>
       <div class="main">
       	<input type="hidden" name="empNo" value="${loginUser.empNo }">
       	<c:choose>
       		<c:when test="${loginUser.empNo eq 'CEO100'}">
	         <div class="mTop">
	           <div class="topBox">
	             <div class="purple">?????????</div> <br><br>
	             <span>????????????</span> <br>
	             <span class="s1">????????? : ????????? ????????????</span><br>
	             <span class="s1">????????? : 2022-09-25</span><br>
	             <span class="s1">???????????? : ????????????</span>
	             <hr>
	             <div id="appr" align="center"><a>????????????</a></div>
	           </div>
	           
	         </div>
       		</c:when>
       		<c:when test="${loginUser.empNo eq 'ADM101'}">
	         <div class="mTop">
	           <div class="topBox">
	             <div class="purple">?????????</div> <br><br>
	             <span>????????????</span> <br>
	             <span class="s1">????????? : ????????? ????????????</span><br>
	             <span class="s1">????????? : 2022-09-25</span><br>
	             <span class="s1">???????????? : ????????????</span>
	             <hr>
	             <div id="appr" align="center"><a>????????????</a></div>
	           </div>
	           
	         </div>
       		</c:when>
       		<c:otherwise>
       			<div class="topBox">
	             <div class="purple">?????????</div> <br><br>
	             <span>????????????</span> <br>
	             <span class="s1">????????? : ????????? ????????????</span><br>
	             <span class="s1">????????? : 2022-09-25</span><br>
	             <span class="s1">???????????? : ????????????</span>
	             <hr>
	             <div id="appr" align="center"><a>????????????</a></div>
	           </div>
       		</c:otherwise>
       	</c:choose>
         <br><br>

         <div class="mMiddle">
           <span>?????? ?????? ??????</span>
           <div class="mBox">
             <table>
               <tr class="t1">
                 <td width="110">?????????</td>
                 <td width="110">????????????</td>
                 <td width="800">??????</td>
                 <td width="110">????????????</td>
               </tr>
               <c:choose>
               	<c:when test="${ not empty dlist }">
	               <c:forEach var="d" items="${dlist }">
		               <tr class="t2">
		                 <td>${d.apprEnrollDate }</td>
		                 <td>
		                 	<c:choose>
		                 		<c:when test="${d.apprDocType eq 1 }">
		                 			????????????
		                 		</c:when>
		                 		<c:when test="${d.apprDocType eq 2 }">
		                 			??????????????????
		                 		</c:when>
		                 		<c:otherwise>
		                 			???????????????
		                 		</c:otherwise>
		                 	</c:choose>
		                 </td>
		                 <td>${d.apprTitle }</td>
		                 <td><div class="ing">??????</div></td>
		               </tr>
	               </c:forEach>
               	</c:when>
               	<c:otherwise>
               		<td colspan="4" style="font-size:13px; text-align:center; margin-top:7px;">????????? ????????????.</td>
               	</c:otherwise>
               </c:choose>
             </table>
           </div>
         </div>
         <br><br>

         <div class="mBottom">
           <span>?????? ??????</span>
           <div class="mBox">
             <table>
               <tr class="t1">
                 <td width="110">?????????</td>
                 <td width="110">????????????</td>
                 <td width="630">??????</td>
                 <td width="140">????????????</td>
                 <td width="110">????????????</td>
               </tr>
               <c:choose>
               	<c:when test="${ not empty clist }">
	               <c:forEach var="c" items="${clist }">
		               <tr class="t2">
		                 <td>${c.apprEnrollDate }</td>
		                 <td>
		                 	<c:choose>
		                 		<c:when test="${c.apprDocType eq 1 }">
		                 			????????????
		                 		</c:when>
		                 		<c:when test="${c.apprDocType eq 2 }">
		                 			??????????????????
		                 		</c:when>
		                 		<c:otherwise>
		                 			???????????????
		                 		</c:otherwise>
		                 	</c:choose>
		                 </td>
		                 <td>${ c.apprTitle }</td>
		                 <td>${ c.apprNo }</td>
		                 <td><div class="fin">??????</div></td>
		               </tr>
	               </c:forEach>
               	</c:when>
	            <c:otherwise>
	            	<td colspan="5" style="font-size:13px; text-align:center; margin-top:7px;">????????? ????????????.</td>
	            </c:otherwise>
               </c:choose>
             </table>
           </div>
         </div>
       </div>
     </div>
</body>
</html>