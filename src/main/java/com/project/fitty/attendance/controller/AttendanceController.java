package com.project.fitty.attendance.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.project.fitty.attendance.model.service.AttendanceService;
import com.project.fitty.attendance.model.vo.Attendance;
import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.common.template.Pagination;
import com.project.fitty.employee.model.service.EmployeeService;
import com.project.fitty.employee.model.vo.Employee;
import com.project.fitty.vacation.model.service.VacationService;

@Controller
public class AttendanceController {
	
	@Autowired
	private AttendanceService aService;
	@Autowired	
	private EmployeeService eService;
	@Autowired
	private VacationService vService;
	
	
	@RequestMapping("main.fitty")
	public String goMain() {
		return "common/mainPage";
	}
	
	
	
	public ModelAndView makeDate() {
		
		ModelAndView mv = new ModelAndView();
		ArrayList<Integer> yearList = new ArrayList<>();
		ArrayList<Integer> monthList = new ArrayList<>();
		int thisYear = Calendar.getInstance().get(Calendar.YEAR);
		int thisMonth = Calendar.getInstance().get(Calendar.MONTH) + 1;
		int thisDay = Calendar.getInstance().get(Calendar.DATE);
		
		for(int i=(Calendar.getInstance().get(Calendar.YEAR) - 5); i<10; i++) {
			yearList.add(i);
		}
		
		for(int i=1; i<=12; i++) {
			monthList.add(i);
		}
		
		mv.addObject("yearList", yearList).addObject("monthList", monthList).
		   addObject("thisYear", thisYear).addObject("thisMonth", thisMonth).
		   addObject("thisDay", thisDay);
		   
		return mv;
	}
	
	public ArrayList<Attendance> makeAttStatusKr(ArrayList<Attendance> list) {
		for(Attendance a : list) {
			switch(a.getAttStatus()) {
				case "X" : a.setAttStatus("??????"); ; break; //??????
				case "L" : a.setAttStatus("??????"); ; break; // ??????
				case "E" : a.setAttStatus("??????"); ; break; // ??????
				case "Q" : a.setAttStatus("????????????"); ; break; // ????????????
				case "Z" : a.setAttStatus("????????????"); ; break; // ????????????
				case "V" : a.setAttStatus("??????"); ; break; // ??????
				case "Y" : a.setAttStatus("?????????"); ; break; // ?????????
				case "B" : a.setAttStatus("??????"); ; break; // ?????????
				case "O" : a.setAttStatus("????????????"); ; break; // ????????????
				case "P" : a.setAttStatus("????????????"); ; break; // ????????????
				default : a.setAttStatus("??????"); break;  // ??????
			}
		}
		return list;
	}
	
	public ArrayList<Attendance> makeAttPlusWorkKr(ArrayList<Attendance> list) {
		for(Attendance a : list) {
			switch(a.getAttPlusWork()) {
				case "N" : a.setAttPlusWork("????????????"); ; break; 
				case "P" : a.setAttPlusWork("????????????"); ; break; 
				default : a.setAttPlusWork("????????????"); break; 
			}
		}
		return list;
	}
	
	public String selectTodayAttList(@RequestParam(value="cpage", defaultValue="1")int currentPage, HttpSession session,
			String addSqlGrade, String addSqlStatus, String sqlEmpName, String searchFlag,
			String thisYear, String thisMonth, String thisDay) {
		int listCount = 0;
		
		if(thisMonth.length() == 1) {
			thisMonth = "0" + thisMonth;
		}
		HashMap <String, Object> sqlMap = new HashMap<String, Object>();
		sqlMap.put("addSqlGrade", addSqlGrade);
		sqlMap.put("addSqlStatus", addSqlStatus);
		sqlMap.put("sqlEmpName", sqlEmpName);
		sqlMap.put("searchFlag", searchFlag);
		sqlMap.put("thisYear", thisYear);
		sqlMap.put("thisMonth", thisMonth);
		sqlMap.put("thisDay", thisDay);
		
		
		listCount = eService.selectTodaySearchListCount(sqlMap);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Attendance> aList = aService.selectTodaySearchList(pi, sqlMap);
		aList = makeAttStatusKr(aList);
		aList = makeAttPlusWorkKr(aList);
		HashMap <String, Object> map = new HashMap<String, Object>();
		map.put("pi", pi);
		map.put("aList", aList);
		return new Gson().toJson(map);
		
	}
	
	public String[] getDate() {
		Calendar calendar = Calendar.getInstance();
		int tYear = Calendar.getInstance().get(Calendar.YEAR);
		int bYear = Calendar.getInstance().get(Calendar.YEAR)-1;
		int bMonth = Calendar.getInstance().get(Calendar.MONTH);
		calendar.set(bYear, bMonth, 1);
		int lDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		String thisYear = Integer.toString(tYear);
		String beforeYear = Integer.toString(bYear);
		String thisMonth = Integer.toString(bMonth+1);
		String beforeMonth = Integer.toString(bMonth);
		String lastDay = Integer.toString(lDay);
		
		String[] dateStr = new String[5];
		dateStr[0] = thisYear;
		dateStr[1] = beforeYear;
		dateStr[2] = thisMonth;
		dateStr[3] = beforeMonth;
		dateStr[4] = lastDay;
		
		return dateStr;
	}
	
	@RequestMapping("workIn.att")
	public ModelAndView updateWorkIn(HttpSession session, Attendance a, ModelAndView mv) {
		int result = aService.updateWorkIn(a);
		Attendance att = aService.selectInAttendance(a);
		
		Employee e = new Employee();
		e.setEmpNo(a.getEmpNo());
		Employee loginUser = eService.loginEmployee(e);
		
		if(result > 0 && att != null && loginUser != null) {
			Employee attFlag = eService.attFlag(e);
			loginUser.setAttIn(attFlag.getAttIn());
			loginUser.setAttOut(attFlag.getAttOut());
			session.setAttribute("alertMsg", a.getEmpNo() + "??? ????????? ??????????????????!????");
			mv.addObject("att", att).setViewName("common/mainPage");
			session.setAttribute("loginUser", loginUser);
		} else {
			session.setAttribute("alertMsg", a.getEmpNo() + "??? ?????? ?????? ??????????????? ???????????????????");
			mv.setViewName("common/mainPage");
		}
		
		return mv;
	}
	
	
	
	@RequestMapping("workOut.att")
	public ModelAndView  updateWorkOutLogout(HttpSession session, Attendance a, ModelAndView mv) {
		int result = aService.updateWorkOutLogOut(a);
		Attendance att = aService.selectInAttendance(a);
		
		Employee e = new Employee();
		e.setEmpNo(a.getEmpNo());
		Employee loginUser = eService.loginEmployee(e);

		if(result > 0 && att != null && loginUser != null) {
			Employee attFlag = eService.attFlag(e);
			loginUser.setAttIn(attFlag.getAttIn());
			loginUser.setAttOut(attFlag.getAttOut());
			session.setAttribute("alertMsg", a.getEmpNo() + "??? ?????? ??????????????? " + att.getGapHour() + " ?????? " + att.getGapMinute() + " ??? " + att.getGapSecond() + " ??? ?????????!????");
			mv.addObject("att", att).setViewName("common/mainPage");
			session.setAttribute("loginUser", loginUser);
		} else {
			session.setAttribute("alertMsg", a.getEmpNo() + "??? ?????? ?????? ??????????????? ???????????????????");
			mv.setViewName("common/mainPage");
		}
		
		return mv;
	
	}
	
	
	
	
	@RequestMapping("logout.me")
	public String onlyLogOut(HttpSession session) {
		session.invalidate();
		return "common/login";
	}
	
	
	@RequestMapping("myAtt.att")
	public ModelAndView goMyAtt(HttpSession session, Attendance a, ModelAndView mv) {
		Attendance myAtt = aService.selectMyAttendance(a);
		mv.addObject("myAtt", myAtt).setViewName("attendance/myAttendance");
		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping(value="getWorkTimeOneSec.att", produces="application/json; charset=utf-8")
	public String selectWorkTimeOneSec(Attendance a) {
		Attendance att = aService.selectInAttendance(a);
		return new Gson().toJson(att);
	}
	
	@ResponseBody
	@RequestMapping(value="getLastWorkTime.att", produces="application/json; charset=utf-8")
	public String selectLastWorkTime(Attendance a) {
		Attendance att = aService.selectLastWorkTime(a);
		return new Gson().toJson(att);
	}
	
	
	
	
	@RequestMapping("resetForm.att")
	public String goResetFormAttendance() {
		return "attendance/resetAttendanceForm";
		// ?????? ?????? ????????? ????????????, ???????????? ajax??? ????????? > ajax ???????????????
	}
	
	@ResponseBody
	@RequestMapping(value="reset.att", produces="application/json; charset=utf-8")
	public String goResetAttendance() {
		ArrayList<Employee> levelEmpList =  eService.selectLevelEmployeeList();
		return new Gson().toJson(levelEmpList);
	}
	
	@ResponseBody
	@RequestMapping(value="listInsert.att", produces="application/json; charset=utf-8")
	public String checkEmpNoList(String strInsertListEmpNo){
		String empNo = "(" + strInsertListEmpNo + ")";
		ArrayList<Employee> checkEmpList =  eService.checkEmpNoList(empNo);
		return new Gson().toJson(checkEmpList);
	}
	
	@ResponseBody
	@RequestMapping(value="listDelete.att", produces="application/json; charset=utf-8")
	public String deleteEmpNoList(String strInsertListEmpNo, String deleteEmpNo) {
		
		if(strInsertListEmpNo.trim().isEmpty()) {
			
			String notReadyEmpNo = "";
			ArrayList<Employee> deleteEmpNoList = new ArrayList<Employee>();
			HashMap <String, Object> map = new HashMap<String, Object>();
			map.put("empNo", notReadyEmpNo);
			map.put("deleteEmpNoList", deleteEmpNoList);
		    
			return new Gson().toJson(map);
			
		} else {

			String[] beforeEmpArray = strInsertListEmpNo.split(",");
			final List<String> list =  new ArrayList<String>();
		    Collections.addAll(list, beforeEmpArray); 
		  
		    list.remove(deleteEmpNo);
			
		    String newEmpNo = "";
		    
		    for(int i=0; i<list.size(); i++) {
		    	newEmpNo += list.get(i) + ",";
		    }
		    String notReadyEmpNo = newEmpNo.substring(0, newEmpNo.length() - 1);
		    String empNo = "(" + notReadyEmpNo + ")";
		    
		    ArrayList<Employee> deleteEmpNoList = eService.deleteEmpNoList(empNo);
		    
		    
		    HashMap <String, Object> map = new HashMap<String, Object>();
			map.put("empNo", notReadyEmpNo);
			map.put("deleteEmpNoList", deleteEmpNoList);
		    
			return new Gson().toJson(map);
		}
		
	    
	}
	
	
	
	@RequestMapping(value="centerAtt.att", produces="application/json; charset=utf-8")
	public ModelAndView goCenterAtt(ModelAndView mv) {
		
		mv = makeDate();
		mv.setViewName("attendance/centerAllAttendance");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="attList.att", produces="application/json; charset=utf-8")
	public String selectAllAttList(@RequestParam(value="cpage", defaultValue="1")int currentPage, HttpSession session, 
				String orderByGrade, String searchText, String thisMonth, String thisYear) {
		
		HashMap <String, Object> sqlMap = new HashMap<String, Object>();
		
		sqlMap.put("orderByGrade",orderByGrade);
		sqlMap.put("searchText",searchText);
		
		int listCount =  eService.selectEmpListCount(sqlMap);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Employee> empList =  eService.selectEmpList(pi, sqlMap);
		

		String[] dateStr = getDate();
		String thisMonthFlag = "";

		if(!empList.isEmpty()) {
			if(thisYear.equals(dateStr[0]) && thisMonth.equals(dateStr[2])) {
				thisMonthFlag = "Y";
				for(Employee e : empList) {
					e.setThisMonthFlag(thisMonthFlag);
					e.setThisYear(thisYear);
					e.setThisMonth(thisMonth);
					e.setAttList(aService.selectAllAttList(e));
					e.setCountList(aService.selectCountList(e));
				}
			} else {
				thisMonthFlag = "N";
				sqlMap.put("thisMonthFlag",thisMonthFlag);
				for(Employee e : empList) {
					e.setThisMonthFlag(thisMonthFlag);
					e.setThisYear(thisYear);
					e.setThisMonth(thisMonth);
					e.setAttList(aService.selectAllAttList(e));
					e.setCountList(aService.selectCountList(e));
				}
			}
		}
		
		// HashMap ??? ?????? ????????? 2???????????? ??????
		HashMap <String, Object> map = new HashMap<String, Object>();
		map.put("pi", pi);
		map.put("empList", empList);

		return new Gson().toJson(map);
	}
	
	
	@RequestMapping("resetAtt.att")
	public String resetAttendanceUpdate(String afterEmpNoList, HttpSession session) {
		String[] beforeEmpArray = afterEmpNoList.split(",");
		final List<String> empList =  new ArrayList<String>();
	    Collections.addAll(empList, beforeEmpArray);
	    
	    String thisYear = Integer.toString(Calendar.getInstance().get(Calendar.YEAR));
	    int resetStatusNull = 0;
	    int setWeekDaysX = 0;
	    int count = 0;
	    for(int i=0; i<empList.size(); i++) {
	    	resetStatusNull += aService.insertAttendance(empList.get(i), thisYear);
	    	setWeekDaysX += aService.updateAttendanceStatus(empList.get(i), thisYear);
	    	count = i;
	    }
	    
	    	session.setAttribute("alertMsg", (count+1) + "??? ?????????????????? ??????????????????.");
	    	return "redirect:centerAtt.att";
	   
	}

	
	@RequestMapping("vacControl.att")
	public String goVacControl() {
		return "attendance/centerVacControl";
	}
	
	
	@ResponseBody
	@RequestMapping(value="vacList.att", produces="application/json; charset=utf-8")
	public String goVacControlAtt(@RequestParam(value="cpage", defaultValue="1")int currentPage, HttpSession session, String addSql, String sqlEmpName, String searchFlag) {
		int listCount = 0;
		HashMap <String, Object> sqlMap = new HashMap<String, Object>();
		sqlMap.put("addSql", addSql);
		sqlMap.put("sqlEmpName", sqlEmpName);
		
		if(searchFlag.equals("N")) {
			// ??? ?????? ????????????
			listCount = eService.selectVacEmpListCount();
		} else {
			// ????????? ????????? ???????????? searchFlag = Y
			listCount = eService.selectVacSearchListCount(sqlMap);
		}
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Attendance> aList = aService.selectVacList(pi, sqlMap);

		String[] dateStr = getDate();
		if(aList.isEmpty()) {
			
		} else {
			for(Attendance a: aList) {
				// ??? ??????????????? 1???-?????? ???????????????, ?????? ????????? ?????????
			a.setThisYear(dateStr[0]);
			a.setBeforeYear(dateStr[1]);
			a.setBeforeMonth(dateStr[3]);
			a.setLastDay(dateStr[4]);
			// null?????? null??? ????????? ?????? ??????.. ???????????? undefined ??????..?
			a.setPerYearMonthList(aService.selectPerYearMonthList(a));
			a.setEmpVacList(vService.selectEmpVacList(a));
			}
		}
		HashMap <String, Object> map = new HashMap<String, Object>();
		map.put("pi", pi);
		map.put("aList", aList);
		return new Gson().toJson(map);
		
	}
	
	@ResponseBody
	@RequestMapping(value="orderByVac.att", produces="application/json; charset=utf-8")
	public String selectOrderByVac(String orderByWorkTime, String orderByAtt, String searchText, HttpSession session) {
		String searchFlag = "Y";
		return goVacControlAtt(1, session, orderByWorkTime, searchText, searchFlag );
		
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="todayAttList.att", produces="application/json; charset=utf-8")
	public String realSelectTodayAttList(@RequestParam(value="cpage", defaultValue="1")int currentPage, HttpSession session,
				String addSqlGrade, String addSqlStatus, String sqlEmpName, String searchFlag,
				String thisYear, String thisMonth, String thisDay) {
		String map = selectTodayAttList(currentPage, session, addSqlGrade, addSqlStatus, sqlEmpName, searchFlag, thisYear, thisMonth, thisDay);
		return map;
	}

	
	@RequestMapping("enrollForm.emp")
	public String goEnrollForm() {
		return "attendance/employeeEnrollForm";
	}
	
	@ResponseBody
	@RequestMapping(value="myMonthAttlist.att", produces="application/json; charset=UTF-8")
	public String selectMyMonthAttList(Employee e) {
		String empNo = e.getEmpNo();
		ArrayList<Attendance> list = aService.selectMyMonthAttList(empNo);
		list = makeAttStatusKr(list);
		return new Gson().toJson(list); // "[{}, {}, {}, ...]"
	}
	
	@RequestMapping("today.att")
	public ModelAndView goTodayAttendance(ModelAndView mv) {
		// ?????? ??????????????? ???????????? mv
		mv = makeDate();
		mv.setViewName("attendance/centerTodayAttendance");
		
		
		return mv;
	}
	

}
