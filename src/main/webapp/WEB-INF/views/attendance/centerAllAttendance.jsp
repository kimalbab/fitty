<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fitty 전직원근태확인</title>
<link type="text/css" rel="stylesheet" href="resources/css/attendance.css" />
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="content-wrapper">
    <div class="container-xxl flex-grow-1 container-p-y" style="padding:0px;">
        <div class="row">

            <!-- <h5 class="py-3 my-4">근태관리 페이지</h5> -->
            <div class="col-xl-12">
            <!-- <h6 class="text-muted">Filled Pills</h6> -->
                <div class="nav-align-top mb-4">
                    <ul class="nav nav-pills mb-3 nav-fill" role="tablist">
                    <li class="nav-item">
                        <button
                        type="button"
                        class="nav-link active"
                        role="tab"
                        data-bs-toggle="tab"
                        aria-selected="true"
                        onclick="go('centerAtt.att')"
                        >
                        📅 전직원 근태확인
                        </button>
                    </li>
                    <li class="nav-item">
                        <button
                        type="button"
                        class="nav-link"
                        role="tab"
                        data-bs-toggle="tab"
                        aria-selected="false"
                        onclick="go('vacControl.att')"
                        >
                        🎁 연차 관리 &nbsp&&nbsp 🎉 휴가 관리
                        </button>
                    </li>
                    <li class="nav-item">
                        <button
                        type="button"
                        class="nav-link"
                        role="tab"
                        data-bs-toggle="tab"
                        aria-selected="false"
                        onclick="go('modifyAtt.att')"
                        >
                        📝 근태 수정
                        </button>
                    </li>
                    </ul>
                    
                    
                    <div class="tab-content">
                    <div class="tab-pane fade show active" id="navs-pills-justified-home" role="tabpanel">
                    	<form class="month">
                    		<table class="monthTable">
                    			<tr>
                    				<td rowspan="2"><button type="button" id="backBtn"><i class='bx bxs-left-arrow arrow'></i></button></td>
                    				<td id="nowMonth"><input type="text" value="${ thisMonth }" id="thisMonth" name="thisMonth"></td>
                    				<td rowspan="2"><button type="button" id="nextBtn"><i class='bx bxs-right-arrow arrow' id="rightArrow"></i></button></td>
                    			</tr>
                    			<tr>
                    				<td><input type="text" value="${ thisYear }" id="thisYear" name="thisYear"></td>
                    			</tr>
                    		</table>
                    	</form>
                        <table class="pull-right" style="margin-top: 20px;">
                        <tr>
                            <td width="22px"></td>
                            <td>
                                <select class="form-control mr-sm-0" name="orderByGrade" id="orderByGrade" style="height: 35px;">                                        
                                    <option value="all" selected>전체선택</option>
                                    <option value="admin">관리자</option>
                                    <option value="trainer">트레이너</option>
                                </select>
                            </td>
                            <td><input type="text" class="form-control" placeholder="검색어 입력" name="searchText" id="searchText"  maxlength="30" style="height: 35px;"></td>
                            <td><button type="button" id="searchBtn" class="btn btn-primary">검색</button></td>
                            <td width="555px"></td>
                            <td><button class="btn btn-primary" onclick="go('enrollForm.emp')">신규직원등록</button></td>
                            <td><button class="btn btn-secondary" onclick="deleteEmp();">직원퇴사</button></td>
                            <td><button class="btn btn-info" type="button" onclick="go('resetForm.att')">근태초기화</button></td>
                        </tr>        
                        </table>
                    </div>
                    
            
                    <div style="height : 5px"></div>
                        <div class="card-body">
                            <div class="table-responsive">
                            <div style="width:83%; float:left;">
                                <table class="table table-bordered attTable table-hover" id="attTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                    <th><input type="checkbox" name="choiceAll" id="choiceAll" onclick="checkAll();"></th>
                                    <th>이&nbsp&nbsp름</th>
                                    <th>01</th>
                                    <th>02</th>
                                    <th>03</th>
                                    <th>04</th>
                                    <th>05</th>
                                    <th>06</th>
                                    <th>07</th>
                                    <th>08</th>
                                    <th>09</th>
                                    <th>10</th>
                                    <th>11</th>
                                    <th>12</th>
                                    <th>13</th>
                                    <th>14</th>
                                    <th>15</th>
                                    <th>16</th>
                                    <th>17</th>
                                    <th>18</th>
                                    <th>19</th>
                                    <th>20</th>
                                    <th>21</th>
                                    <th>22</th>
                                    <th>23</th>
                                    <th>24</th>
                                    <th>25</th>
                                    <th>26</th>
                                    <th>27</th>
                                    <th>28</th>
                                    <th>29</th>
                                    <th>30</th>
                                    <th>31</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                    <th><input type="checkbox" name="choiceAll" id="choiceAll" onclick="checkAll();"></th>
                                    <th>이&nbsp&nbsp름</th>
                                    <th>01</th>
                                    <th>02</th>
                                    <th>03</th>
                                    <th>04</th>
                                    <th>05</th>
                                    <th>06</th>
                                    <th>07</th>
                                    <th>08</th>
                                    <th>09</th>
                                    <th>10</th>
                                    <th>11</th>
                                    <th>12</th>
                                    <th>13</th>
                                    <th>14</th>
                                    <th>15</th>
                                    <th>16</th>
                                    <th>17</th>
                                    <th>18</th>
                                    <th>19</th>
                                    <th>20</th>
                                    <th>21</th>
                                    <th>22</th>
                                    <th>23</th>
                                    <th>24</th>
                                    <th>25</th>
                                    <th>26</th>
                                    <th>27</th>
                                    <th>28</th>
                                    <th>29</th>
                                    <th>30</th>
                                    <th>31</th>
                                    </tr>
                                </tfoot>
                                
                                <tbody id="memListTBody">
                                    
                                </tbody>
                                </table>
                            </div>
                            <form action="delete.emp" method="post" id="deleteEmpForm">
                            	 <input type="hidden" id="strDeleteListEmpNo" name="strDeleteListEmpNo">
                            </form>
                            <div style="width:16%; float:right;">
                                <table class="table table-bordered memberListTable table-hover" id="countList" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
	                                    <th id="illegal">결근</th>
	                                    <th id="late">지각</th>
	                                    <th id="early">조퇴</th>
	                                    <th id="approve">승인</th>
	                                    <th id="vacation">휴가</th>
	                                    <th id="plus">연장</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
	                                    <th id="illegal">결근</th>
	                                    <th id="late">지각</th>
	                                    <th id="early">조퇴</th>
	                                    <th id="approve">승인</th>
	                                    <th id="vacation">휴가</th>
	                                    <th id="plus">연장</th>
                                    </tr>
                                </tfoot>
                                
                                <tbody id="countListTBody">
                                    
                                </tbody>
                                </table>
                                <input type="hidden" value=" ${ empList }" id="empList">
                                <input type="hidden" value="${ pi }" id="pi">
                            </div>
                            <div style="height : 20px"></div>
                            </div>
                            <!-- Basic Pagination -->
                            <nav aria-label="Page navigation pageNav">
                                <ul class="pagination">
                                <!--
	                                <li class="page-item prev">
	                                    <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevron-left"></i></a>
	                                </li>
	                                <li class="page-item">
	                                    <a class="page-link" href="javascript:void(0);">1</a>
	                                </li>
	                                <li class="page-item">
	                                    <a class="page-link" href="javascript:void(0);">2</a>
	                                </li>
	                                <li class="page-item active">
	                                    <a class="page-link" href="javascript:void(0);">3</a>
	                                </li>
	                                <li class="page-item">
	                                    <a class="page-link" href="javascript:void(0);">4</a>
	                                </li>
	                                <li class="page-item">
	                                    <a class="page-link" href="javascript:void(0);">5</a>
	                                </li>
	                                <li class="page-item next">
	                                    <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevron-right"></i></a>
	                                </li>
	                            -->
                                </ul>
                            </nav>
                            <!--/ Basic Pagination -->
                            <button class="btn btn-danger" onclick="go('today.att')">당일근태확인</button>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
</div>


<script type="text/javascript" src="resources/js/attendance.js"></script>
<script type="text/javascript" src="resources/js/attendance/centerAllAttendance.js"></script>
</body>
</html>