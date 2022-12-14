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
	
	public ArrayList<User> selectUserList(){
		return lDao.selectUserList(sqlSession);
	}
	
	public ArrayList<User> selectUserList2(){
		return lDao.selectUserList2(sqlSession);
	}
	
	public ArrayList<Locker> selectUsedLkNo(){
		return lDao.selectUsedLkNo(sqlSession);
	}
	
	public ArrayList<Locker> selectNotUsedLkNo(){
		return lDao.selectNotUsedLkNo(sqlSession);
	}
	
	public int addLocker() {
		return lDao.addLocker(sqlSession);
	}
	
	public int deleteLocker(String lkNo) {
		return lDao.deleteLocker(sqlSession, lkNo);
	}
	
	public int assignLocker(Locker l) {
		return lDao.assignLocker(sqlSession, l);
	}
	
	public ArrayList<Locker> selectConditionLkNo(int userNo){
		return lDao.selectConditionLkNo(sqlSession, userNo);
	}
	
	public Locker selectLockerInfo(int lkNo) {
		return lDao.selectLockerInfo(sqlSession, lkNo);
	}
	
	public int moveLocker(Locker info) {
		return lDao.moveLocker(sqlSession, info);
	}
	
	public int recoverLocker(int lkNo) {
		return lDao.recoverLocker(sqlSession, lkNo);
	}
	
	public int updateLockerBroken(int lkNo) {
		return lDao.updateLockerBroken(sqlSession, lkNo);
	}
	
	public int repairLocker(String lkNo) {
		return lDao.repairLocker(sqlSession, lkNo);
	}
}
