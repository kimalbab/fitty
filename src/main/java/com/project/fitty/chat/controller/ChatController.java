package com.project.fitty.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.project.fitty.chat.model.service.ChatService;
import com.project.fitty.chat.model.vo.Chat;
import com.project.fitty.employee.model.service.EmployeeService;
import com.project.fitty.employee.model.vo.Employee;

@Controller
public class ChatController {
	
	@Autowired	
	private EmployeeService eService;
	@Autowired
	private ChatService cService;
	
	@RequestMapping("chat.ch")
	public String goChat() {
		return "chat/chatEmpList";
	}
	
	@ResponseBody
	@RequestMapping(value="chatEmp.ch", produces="application/json; charset=utf-8" )
	public String selectChatEmpList(String searchText){
		ArrayList<Employee> list = cService.selectChatEmpList(searchText);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="bubbleList.ch",  produces="application/json; charset=utf-8")
	public String selectChatRoomOne( String invEmpNo, String empNo, HttpSession session) {
		//System.out.println("invEmpNo : " + invEmpNo + "  empNo : " + empNo);
		/*HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("invEmpNo", invEmpNo);*/
		Chat empC = new Chat();
		empC.setInvEmpNo(invEmpNo);
		empC.setEmpNo(empNo);
		Chat c= cService.countRoomFlag(empC);
		ArrayList<Chat> bubbleList = new ArrayList<>();
		Chat invC = cService.selectInvEmp(invEmpNo);
		
		HashMap<String, Object> invMap = new HashMap<String, Object>();
		
		if(c != null) {
			//이미 채팅방이 존재하기때문에 채팅대화내용을 불러오면 됨
			bubbleList = cService.selectBubbleList(empC);
		} else {
			// 채팅방이 없는경우 채팅방을 만들어주고, 초대해줘야함
			int result = cService.insertChatInviteFirst(empC);
			
			if(result > 1) {
				
			} else {
				session.setAttribute("alertMsg", "채팅창 로딩 실패");
			}
		}
		invMap.put("c", c);
		invMap.put("invC", invC);
		invMap.put("bubbleList", bubbleList);
		return new Gson().toJson(invMap);
	}
	
	@RequestMapping("testChat")
	public String selectChatRoomOne() {
		return "chat/test";
	}
}
