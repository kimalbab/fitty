<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.main{
	  width:80%;
	  height:750px;
	  float:left;
	  background-color:white;
	  margin-left:27px;
	  margin-top:30px;
	  border-radius:6px;
	  box-shadow: 0 0 0.375rem 0.25rem rgb(161 172 184 / 15%);
	  color:rgb(51, 51, 51);
	  padding:30px;
	}
	.select{font-weight:bold;color:#696CFF;}
	#dTable{
	  font-size:13px;
	  width:100%;
	  text-align:center;
	  accent-color:#696CFF;
	}
	#dTable tr{border-bottom:1px solid lightgray;}
	#sel1, #sel2{
	  width:80px; 
	  font-size:13px; 
	  height:30px;
	  border:1px solid lightgray;
	  border-radius:5px;
	}
	#search{
	  width:250px;
	  font-size:13px; 
	  height:30px;
	  border:1px solid lightgray;
	  border-top-left-radius:5px;
	  border-bottom-left-radius:5px;
	  border-right:0px;
	
	}
	#s-btn{
	  width:35px;
	  height:30px;
	  border:1px solid lightgray;
	  border-top-right-radius:5px;
	  border-bottom-right-radius:5px;
	  border-left:0px;
	}
	.m-btn{
	  border:0px;
	  background-color:white;
	  font-size:14px;
	  font-weight:bold;
	  margin-bottom:5px;
	  color:gray;
	  height:30px;
	}
	#sta1{
	  background-color: rgb(105, 108, 255);
	  color:white;
	  font-size:12px;
	  width:50px;
	  height:20px;
	  border-radius: 5px;
	}
	#sta2{
	  background-color: rgb(133, 146, 163);
	  color:white;
	  font-size:12px;
	  width:50px;
	  height:20px;
	  border-radius: 5px;
	}
	#sta3{
	  background-color: rgb(255, 101, 84);
	  color:white;
	  font-size:12px;
	  width:50px;
	  height:20px;
	  border-radius: 5px;
	}
	.sel{color:rgb(50, 50, 50);}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	<div class="outer">
		<jsp:include page="sideMenu.jsp"/>
		
		<div class="main">
	        <h4 style="color:rgb(50, 50, 50);">기안 문서함</h4><br>
	        <button class="m-btn sel" onclick="">전체</button>
	        <button class="m-btn" onclick="">진행</button>
	        <button class="m-btn" onclick="">반려</button>
	        <button class="m-btn" onclick="">완료</button>
	        <table id="dTable" align="center">
	          <tr style="background:rgb(231, 231, 255)">
	            <th>기안일</th>
	            <th>결재양식</th>
	            <th width="30%;">제목</th>
	            <th width="10%;">사유</th>
	            <th>첨부파일</th>
	            <th>문서번호</th>
	            <th height="30" width="7%;">결재상태</th>
	          </tr>
	        	<c:choose>
			        <c:when test="${ not empty list }">
			          <c:forEach var="a" items="${ list }">
				          <tr>
				            <td>${ a.apprEnrollDate }</td>
				            <c:choose>
				            	<c:when test="${ a.apprDocType eq 1 }">
				            		<td>휴가신청</td>
				            	</c:when>
				            	<c:when test="${ a.apprDocType eq 2 }">
				            		<td>연장근무신청</td>
				            	</c:when>
				            	<c:otherwise>
				            		<td>지출결의서</td>
				            	</c:otherwise>
				            </c:choose>
				            <td>${ a.apprTitle }</td>
				            <td></td>
				            <td>${ a.apprComment }</td>
				            <td>${ a.apprNo }</td>
				            <c:choose>
				            	<c:when test="${ a.apprStatus eq 1 }">
						            <td height="30" align="center"><div id="sta1">대기</div></td>
				            	</c:when>
				            	<c:when test="${ a.apprStatus eq 2 }">
						            <td height="30" align="center"><div id="sta1">진행</div></td>
				            	</c:when>
				            	<c:when test="${ a.apprStatus eq 3 }">
				            		<td height="30" align="center"><div id="sta2">완료</div></td>
				            	</c:when>
				            	<c:otherwise>
				            		<td height="30" align="center"><div id="sta3">반려</div></td>
				            	</c:otherwise>
				            </c:choose>
				          </tr>
			          </c:forEach>
			        </c:when>
			        <c:otherwise>
			        		<tr>
			        			<td colspan=7 height="30">문서가 없습니다.</td>
			        		</tr>
			        </c:otherwise>
	        	</c:choose>
	        </table>
	        <br><br>
			
			<nav aria-label="Page navigation">
              <ul class="pagination justify-content-center">
              
              	<c:choose>
              		<c:when test="${ pi.currentPage eq 1 }">
              			<li class="page-item prev disabled">
		                  <a class="page-link"
		                    ><i class="tf-icon bx bx-chevron-left"></i
		                  ></a>
		                </li>
              		</c:when>
              		<c:otherwise>
              			<li class="page-item prev">
		                  <a class="page-link" href="draftList.ap?cpage=${ pi.currentPage-1 }"
		                    ><i class="tf-icon bx bx-chevron-left"></i
		                  ></a>
		                </li>
              		</c:otherwise>
                </c:choose>
                
                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                <li class="page-item">
                  <a class="page-link" href="draftList.ap?cpage=${ p }">${ p }</a>
                </li>
                </c:forEach>
                
                <c:choose>
              		<c:when test="${ pi.currentPage eq pi.maxPage }">
              			<li class="page-item next disabled" >
		                  <a class="page-link"
		                    ><i class="tf-icon bx bx-chevron-right"></i
		                  ></a>
		                </li>
              		</c:when>
              		<c:otherwise>
              			<li class="page-item next">
		                  <a class="page-link" href="draftList.ap?cpage=${ pi.currentPage+1 }"
		                    ><i class="tf-icon bx bx-chevron-right"></i
		                  ></a>
		                </li>
              		</c:otherwise>
                </c:choose>
                
              </ul>
            </nav>
            <br>
			
	        <div align="center">
	          <select name="" id="sel1">
	            <option value="">전체기간</option>
	            <option value="">1개월</option>
	            <option value="">6개월</option>
	            <option value="">1년</option>
	          </select>
	          <select name="" id="sel2">
	            <option value="">제목</option>
	            <option value="">결재양식</option>
	            <option value="">기안자</option>
	          </select>
	          <input type="text" id="search"><button id="s-btn">
	            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
	            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
	            </svg>
	          </button>
	        </div>
	      </div>
	</div>
	<script>
		
	</script>

</body>
</html>