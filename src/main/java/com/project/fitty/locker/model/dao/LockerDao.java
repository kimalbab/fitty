package com.project.fitty.locker.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.locker.model.vo.Locker;
import com.project.fitty.user.model.vo.User;

@Repository
public class LockerDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("lockerMapper.selectListCount");
	}
	
	public ArrayList<Locker> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("lockerMapper.selectList", null, rowBounds);
	}
	
	public int addLocker(SqlSessionTemplate sqlSession) {
		return sqlSession.insert("lockerMapper.addLocker");
	}
	
	public int deleteLocker(SqlSessionTemplate sqlSession, String lkNo) {
		return sqlSession.delete("lockerMapper.deleteLocker", lkNo);
	}
	
	public ArrayList<User> selectUserList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("lockerMapper.selectUserList");
	}
	
	public ArrayList<User> selectUserList2(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("lockerMapper.selectUserList2");
	}
	
	public ArrayList<Locker> selectUsedLkNo(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("lockerMapper.selectUsedLkNo");
	}
	
	public ArrayList<Locker> selectNotUsedLkNo(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("lockerMapper.selectNotUsedLkNo");
	}
	
	public int assignLocker(SqlSessionTemplate sqlSession, Locker l) {
		return sqlSession.insert("lockerMapper.assignLocker", l);
	}
	
	public ArrayList<Locker> selectConditionLkNo(SqlSessionTemplate sqlSession, int userNo){
		return (ArrayList)sqlSession.selectList("lockerMapper.selectConditionLkNo", userNo);
	}
	
	public Locker selectLockerInfo(SqlSessionTemplate sqlSession, int lkNo) {
		return sqlSession.selectOne("lockerMapper.selectLockerInfo",lkNo);
	}
	
	public int moveLocker(SqlSessionTemplate sqlSession, Locker info) {
		return sqlSession.update("lockerMapper.moveLocker", info);
	}
	
	public int recoverLocker(SqlSessionTemplate sqlSession, int lkNo) {
		return sqlSession.update("lockerMapper.recoverLocker", lkNo);
	}
	
	public int updateLockerBroken(SqlSessionTemplate sqlSession, int lkNo) {
		return sqlSession.update("lockerMapper.updateLockerBroken", lkNo);
	}
	
	public int repairLocker(SqlSessionTemplate sqlSession, String lkNo) {
		return sqlSession.update("lockerMapper.repairLocker", lkNo);	
	}
	

}
