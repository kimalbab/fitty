<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="resources/css/attendance.css" />
</head>
<body>

<jsp:include page="../common/header.jsp"/>

        <div class="row">

          <div class="col-md-12">
            <div class="card mb-4 profileEnrollDiv">
              <!-- Account -->
              <div class="card-body row" style="margin-bottom:30px;">
                  <h5 class="card-header resetHeader" style="height:100px;">ποΈββοΈ μ§μ κ·Όν μ΄κΈ°ν</h5>
                	<div class="btnDiv resetBtnDiv" style="margin-top:20px;">
				<button class="btn btn-secondary" type="button" onclick="go('centerAtt.att');">μ μ²΄ λͺ©λ‘μΌλ‘</button>
              </div>
              <form class="col-md-6 formAccountSettings" action="listInsert.att" method="POST" >
                <h6 class="card-header resetHeader">ποΈββοΈ μ§μ μ ν</h6>
                  <div class="row">
	                <div class="d-flex align-items-start align-items-sm-center gap-4">
		               <div class="beforeEmpList">
							
						    <table class="table table-hover empList " >
						  		
						    </table>
							</div>
						</div>
                	</div>
                	<div class="btnDiv resetBtnDiv" style="margin-top:20px;">
						    <input type="hidden" id="strInsertListEmpNo" name="strInsertListEmpNo">
						<button class="btn btn-primary" type="button" id="addEmpList">λͺλ¨ μΆκ°</button>
                	</div>
                </form>
               
                <form class="col-md-6 formAccountSettings" id="resetForm" action="resetAtt.att" method="POST" >
                <h6 class="card-header resetHeader">ποΈββοΈ λͺλ¨ νμΈ</h6>
                  <div class="row">
	                <div class="d-flex align-items-start align-items-sm-center gap-4">
		               <div class="afterEmpList">
							
						    <table class="table table-hover printEmpList " >
						  		
						    </table>
							</div>
						</div>
                	</div>
                	<div class="btnDiv resetBtnDiv" style="margin-top:20px;">
                			<input type="hidden" id="deleteEmpNo" name="deleteEmpNo">
                			<input type="hidden" id="afterEmpNoList" name="afterEmpNoList">
						<button class="btn btn-info" type="button" onclick="resetAttBtn();">κ·Όν μ΄κΈ°ν</button>
                	</div>
                </form>
                
              </div>
            </div>
          </div>
        </div>



<script type="text/javascript" src="resources/js/attendance.js"></script>
<script type="text/javascript" src="resources/js/attendance/resetAttendance.js"></script>
</body>
</html>