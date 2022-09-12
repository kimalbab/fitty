package com.project.fitty.locker.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.locker.model.dao.LockerDao;
import com.project.fitty.locker.model.vo.Locker;
import com.project.fitty.user.model.vo.User;

@Service
public class LockerService {

	@Autowired
	private LockerDao lDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int selectListCount() {
		return lDao.selectListCount(sqlSession);
	}
	
	public ArrayList<Locker> selectList(PageInfo pi){
		return lDao.selectList(sqlSession, pi);
	}
	
	public int addLocker() {
		return lDao.addLocker(sqlSession);
	}
	
	public int deleteLocker(String lkNo) {
		return lDao.deleteLocker(sqlSession, lkNo);
	}
	
	public ArrayList<User> selectUserList(){
		return lDao.selectUserList(sqlSession);
	}
}
