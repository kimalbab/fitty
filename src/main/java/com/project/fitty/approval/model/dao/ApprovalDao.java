package com.project.fitty.approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.fitty.approval.model.vo.ApprOvertime;
import com.project.fitty.approval.model.vo.ApprVacation;
import com.project.fitty.approval.model.vo.Approval;
import com.project.fitty.approval.model.vo.ApprovalMember;
import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.employee.model.vo.Employee;

@Repository
public class ApprovalDao {
	
	public ArrayList<Employee> selectEmpList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("approvalMapper.selectEmpList");
	}
	
	public int insertApproval(SqlSessionTemplate sqlSession, Approval ap) {
		return sqlSession.insert("approvalMapper.insertApproval", ap);
	}
	
	public int insertApprMember(SqlSessionTemplate sqlSession, ArrayList<ApprovalMember> list) {
		int result = 0;
		for(int i=0; i<list.size(); i++) {
			result = sqlSession.insert("approvalMapper.insertApprMember", list.get(i));
		}
		return result;
	}
	
	public int insertApprVct(SqlSessionTemplate sqlSession, ApprVacation vct) {
		return sqlSession.insert("approvalMapper.insertApprVct", vct);
	}
	
	public int insertApprOvt(SqlSessionTemplate sqlSession, ApprOvertime ovt) {
		return sqlSession.insert("approvalMapper.insertApprOvt", ovt);
	}
	
	public int selectScheduleListCount(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.selectOne("approvalMapper.selectScheduleListCount", empNo);
	}
	
	public ArrayList<Approval> selectScheduleList(SqlSessionTemplate sqlSession, PageInfo pi, String empNo){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectScheduleList", empNo, rowBounds);
	}
	
	public int selectListCount(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.selectOne("approvalMapper.selectListCount", empNo);
	}
	
	public ArrayList<Approval> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String empNo){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectList", empNo, rowBounds);
	}
	
	public int ajaxSelectListCount(SqlSessionTemplate sqlSession, Approval ap) {
		return sqlSession.selectOne("approvalMapper.ajaxSelectListCount", ap);
	}
	
	public ArrayList<Approval> ajaxSelectList(SqlSessionTemplate sqlSession, PageInfo pi, Approval ap){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.ajaxSelectList", ap, rowBounds);
	}
	
	public int selectStorageListCount(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.selectOne("approvalMapper.selectStorageListCount", empNo);
	}
	
	public ArrayList<Approval> selectStorageList(SqlSessionTemplate sqlSession, PageInfo pi, String empNo){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectStorageList", empNo, rowBounds);
	}
	
	public int selectSignListCount(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.selectOne("approvalMapper.selectSignListCount", empNo);
	}
	
	public ArrayList<Approval> selectSignList(SqlSessionTemplate sqlSession, PageInfo pi, String empNo){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectSignList", empNo, rowBounds);
	}
	
	public int ajaxSelectSignListCount(SqlSessionTemplate sqlSession, Approval ap) {
		return sqlSession.selectOne("approvalMapper.ajaxSelectSignListCount", ap);
	}
	
	public ArrayList<Approval> ajaxSelectSignList(SqlSessionTemplate sqlSession, PageInfo pi, Approval ap){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.ajaxSelectSignList", ap, rowBounds);
	}

}
