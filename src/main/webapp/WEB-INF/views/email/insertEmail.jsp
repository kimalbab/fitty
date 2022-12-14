<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="resources/css/mail.css" />
</head>
<body>
		<jsp:include page="../common/header.jsp"/>
          <div class="content-wrapper">
            <div class="container-xxl flex-grow-1 container-p-y" style="padding : 0px;">
              <div class="row">
              
                  <!-- 메일 리스트 -->
                  <div class="col-md-2 ">
                  <form>
                    <div class="card mb-4 vacDetailDiv">
                        <h2 class="card-header"><b>E-MAIL</b></h2>
                        <div class="card-body">
						              <a href="insert.em" type="button" class="btn btn-primary modifyBtn">메일 쓰기</a>
                          <br><br><br>
                          
                          <div class="mailList">
                           <div class="mail-content" style="border: 0px;">
                            <br>
                            <a href="received.em" type="button" class="btn btn-outline-primary" style="border: 0px;">받은메일함</a>
                            <a href="sent.em" type="button" class="btn btn-outline-primary" style="border: 0px;">보낸메일함</a>
                            <a href="stm.em" type="button" class="btn btn-outline-primary" style="border: 0px;">내게쓴메일함</a>
                            <a href="tem.em" type="button" class="btn btn-outline-primary" style="border: 0px;">임시보관함</a><br>
                            <a href="trash.em" type="button" class="btn btn-outline-primary" style="border: 0px;">휴지통</a>
                            <br><br>
                           </div>
                          
                          
                          </div>
                      
                        </div>
                    </div>
                  </div>
                
                  <!-- 메일쓰기 -->
                  <form>
                  <div class="col-md-10 ">
                    <div class="card mb-4 vacDetailDiv">
                      <div class="demo-inline-spacing">
                        <!-- &nbsp;&nbsp;&nbsp;&nbsp; -->
                        
                          &nbsp;&nbsp;&nbsp;
              
                        <button type="button" class="btn btn-sm btn-primary">보내기</button>
                        <button type="button" class="btn btn-sm btn-warning">임시저장</button>
                        <button type="button" class="btn btn-sm btn-danger">다시쓰기</button>
                        <hr>
                      </div>
                      
                      <div class="card-body">
                       
                          <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-name">받는사람 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-check-input" type="checkbox" value="" id="defaultCheck1" />&nbsp;&nbsp;나에게</label>
                            <div class="col-sm-9 input-group" style="width: 900px;">
                               <input
                                type="text"
                                class="form-control"
                                placeholder="Recipient's username"
                                aria-label="Recipient's username"
                                aria-describedby="button-addon2"
                              />
                              <button class="btn btn-outline-primary" type="button">+</button> 
                              <button class="btn btn-outline-primary" type="button" id="button-addon2"  data-bs-toggle="modal"
                              data-bs-target="#largeModal">주소록</button>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-company" style="float:left">숨은참조</label>
                            <div class="col-sm- input-group" style="width: 900px;">
                              <input
                                type="text"
                                class="form-control"
                                placeholder="Recipient's username"
                                aria-label="Recipient's username"
                                aria-describedby="button-addon2"
                              />
                               <button class="btn btn-outline-primary" type="button" onclick="emailCheck();">+</button> 
                              <button class="btn btn-outline-primary" type="button" id="button-addon2"  data-bs-toggle="modal"
                              data-bs-target="#largeModal">주소록</button>
                            </div>
                          </div>

                          <!--주소록 모달-->
                          <div class="modal fade" id="largeModal" tabindex="-1" aria-hidden="true">
                            <div class="modal-dialog modal-lg" role="document">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title" id="exampleModalLabel3">주소록</h5>
                                  <button
                                    type="button"
                                    class="btn-close"
                                    data-bs-dismiss="modal"
                                    aria-label="Close"
                                  ></button>
                                </div>
                                <div class="modal-body">
                                            
                                  <div class="table-responsive text-nowrap">
                                    <table class="table table-bordered">
                                      <thead>
                                        <tr style="background-color: rgb(245, 245, 249)">
                                          <th>이름</th>
                                          <th>직위</th>
                                          <th>이메일</th>
                                        </tr>
                                      </thead>
                                      <tbody class="table-border-bottom-0">
                                        <tr>
                                          <td><input class="form-check-input" type="checkbox" value="" id="defaultCheck1" />&nbsp;&nbsp;김사장</td>
                                          <td>사장</td>
                                          <td>admin@naver.com</td>
                                        </tr>
                                        <tr>
                                          <td><input class="form-check-input" type="checkbox" value="" id="defaultCheck1" />&nbsp;&nbsp;이헬트</td>
                                          <td>관리자</td>
                                          <td>vicead@gmail.com</td>
                                        </tr>
                                        <tr>
                                          <td><input class="form-check-input" type="checkbox" value="" id="defaultCheck1" />&nbsp;&nbsp;박근육</td>
                                          <td>트레이너</td>
                                          <td>muscle@naver.com</td>
                                        </tr>
                                        <tr>
                                          <td><input class="form-check-input" type="checkbox" value="" id="defaultCheck1" />&nbsp;&nbsp;한이두</td>
                                          <td>트레이너</td>
                                          <td>trainer@daum.net</td>
                                        </tr>
                                      </tbody>
                                    </table> 
                                  </div>
                                </div>
                                <div class="modal-footer">
                                  <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                                    닫기
                                  </button>
                                  <button type="button" class="btn btn-primary">확인</button>
                                </div>
                              </div>
                            </div>
                          </div>


                          <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-email">제목 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-check-input" type="checkbox" value="" id="defaultCheck1" />&nbsp;&nbsp;중요❗</label>
                            <div class="col-sm-10">
                              <div class="input-group input-group-merge">
                                <input
                                type="text"
                                id="basic-default-email"
                                  class="form-control"
                                  placeholder="john.doe"
                                  aria-label="john.doe"
                                  aria-describedby="basic-default-email2"
                                />
                                <span class="input-group-text" id="basic-default-email2"></span>
                              </div>
                            </div>
                          </div>
                          <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-phone">파일첨부</label>
                            <div class="col-sm-10">
                              <div class="mb-3">
                                <input class="form-control" type="file" id="formFileMultiple" multiple />
                              </div>
                            </div>
                          </div>

                          <div class="mail-content">
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="17" style="resize: none;"></textarea>
                          </div>
               
                  </form>
                      </div>
                     
                    </div>
                    </div>


          </div>
      </div>
      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>

</body>
</html>