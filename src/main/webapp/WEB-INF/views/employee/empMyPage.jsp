<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile</title>
<link type="text/css" rel="stylesheet" href="resources/css/attendance.css" />
</head>
<body>
<jsp:include page="../common/header.jsp"/>

        <div class="row">

          <div class="col-md-12">
            <div class="card mb-4 profileEnrollDiv">
              <!-- Account -->
              <div class="card-body">
                <form id="formAccountSettings" action="update.emp" method="POST">
                  <h5 class="card-header secondHeader" style="margin-bottom: 50px;">ðï¸ââï¸ My Profile</h5>
                  <div class="row">
	                <div class="d-flex align-items-start align-items-sm-center gap-4">
                 	 <!-- 
                 	 <<c:choose>
	                  	<c:when test="${empty loginUser.empPhoto }">
	                  		<img  id="roundPhoto" src='resources/profile_images/defaultProfile.png' onclick="$('#empPhoto').click();" >
	                  	</c:when>
	                  	 
	                  	<c:otherwise>
	                  		<input type="hidden"  name="empPhoto" value="${ loginUser.empPhoto }">
	                  		<img  id="roundPhoto" src="<c:out value='${  loginUser.empPhoto }' />" onclick="$('#empPhoto').click();" >
	                  	</c:otherwise>
	                  </c:choose>
	                  -->
	                  
	                  <img id="roundPhoto" src="<c:out value='${ loginUser.empPhoto }' default='resources/profile_images/defaultProfile.png' />" onclick="$('#empPhoto').click();">
                	  <input type="file" id="empPhoto" style="display:none;">
	                </div>
	                
	                <script>
	                
	                $(function(){
	                    $('#empPhoto').change(function(){
	                    let roundPhoto = $('#roundPhoto');
	             		// AJAXë¡ íì¼ì ëê¸°ê³ ì í  ê²½ì° ê°ìì form ììë¥¼ ë§ë¤ì´ì ë´ì í ì ë¬
	             		// => FormData ê°ì²´
	             		let formData = new FormData();
	             		let uploadFile = this.files[0]; // íì¬ ì íë íì¼ê°ì²´ (ì¬ì©ìê° ì íí ì²¨ë¶íì¼)
	             		
	             		formData.append("uploadFile", uploadFile); // ì·¨ìë²í¼ í´ë¦­ì undefinedê° ë´ê¹
	             		formData.append("empNo", "${loginUser.empNo}");
	             		formData.append("originalFile", "${loginUser.empPhoto}"); // ê¸°ì¡´ì íë¡í ì´ë¯¸ì§ê° ìììê²½ì° "" ë¬¸ìì´ ëì´ê°
	             		
	             		$.ajax({
	             			url:"uploadProfile2.emp",
	             			data:formData, // íì¼ìì²´ê° ë´ê²¨ìë ê°ìì form ê·¸ëë¡ ì ë¬
	             			processData: false,
	             			contentType: false,
	             			type:"POST",
	             			success:function(){
	             				location.reload();
	             				roundPhoto.attr( 'class', 'd-block rounded');
	             			},
	             			error:function(){
	             				console.log("íë¡í ì´ë¯¸ì§ íì¼ì ì¡ì ìí ajax íµì  ì¤í¨");
	              			}
	             		})
	             	})
	             }) 
	                
	                
	                
	                </script>
                    <div class="mb-3 col-md-6">
                      <label for="empName" class="form-label">ì´ë¦</label>
                      <input class="form-control" type="text" id="empName" value="${loginUser.empName }" name="empName" placeholder="ì´ë¦" autofocus required/>
                    </div>
                    <div class="mb-3 col-md-3">
                      <label for="empGrade" class="form-label">ì§ê¸</label>
                      <div style="height : 10px"></div>
                      <input class="form-check-input"  type="radio" name="empGrade" value="T">í¸ë ì´ë&nbsp&nbsp&nbsp&nbsp&nbsp
                      <input class="form-check-input"  type="radio" name="empGrade" value="A">ê´ë¦¬ì&nbsp&nbsp&nbsp&nbsp&nbsp
                      <input class="form-check-input"  type="radio" name="empGrade" value="C">ëí
                      
                    </div>
                    <div class="mb-3 col-md-3">
                      <label for="empGender" class="form-label">ì±ë³</label>
                      <div style="height : 10px"></div>
                      <input class="form-check-input"  type="radio" name="empGender" value="M">ë¨ì&nbsp&nbsp&nbsp&nbsp&nbsp
                      <input class="form-check-input"  type="radio" name="empGender" value="F">ì¬ì
                    </div>
                    <div class="mb-3 col-md-6">
                      <label for="empNo" class="form-label">ì¬ë²</label>
                      <input class="form-control" type="text" name="empNo" id="empNo" value="${ loginUser.empNo }" readonly/>
                    </div>
                         <c:if test="${ not empty loginUser.empGrade }">
                    	<script>
                    		$(function(){
								$("input[value=${loginUser.empGrade}]").attr("checked", true);                  			
                    		})
                    		
                    	</script>
                    	
                    </c:if>
                    
                    <c:if test="${ not empty loginUser.empGender }">
                    	<script>
                    		$(function(){
								$("input[value=${loginUser.empGender}]").attr("checked", true);                  			
                    		})
                    		
                    	</script>
                    	
                    </c:if>
                    
                    <div class="mb-3 col-md-6">
                      <label for="empMail" class="form-label">ì´ë©ì¼</label>
                      <input class="form-control" type="text" id="empMail" name="empMail" value="${ loginUser.empMail }" readonly/>
                    </div>
                    <div class="mb-3 col-md-6">
                      <label class="form-label" for="empPhone">ì íë²í¸</label>
                      <div class="input-group input-group-merge">
                        <input type="text" id="empPhone" name="empPhone" class="form-control"  value="${ loginUser.empPhone }" />
                      </div>
                    </div>
                    <div class="mb-3 col-md-6">
                      <label for="empBirth" class="form-label">ìëìì¼</label>
                      <input type="text" class="form-control" id="empBirth" name="empBirth" value="${ loginUser.empBirth }"  />
                    </div>
                  </div>
                  <div class="mt-2 enrollBtnDiv">
                    <button type="submit" class="btn btn-primary me-2">ìì íê¸°</button>
                    <button type="button" class="btn btn-secondary me-2" onclick="go('login.emp')">ëª©ë¡ì¼ë¡</button>
                  </div>
                </form>
              </div>
            </div>
            <!-- /Account -->
          </div>
        </div>
      
</body>
</html>