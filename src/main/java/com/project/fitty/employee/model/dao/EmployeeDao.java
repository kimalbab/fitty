package com.project.fitty.employee.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.fitty.employee.model.vo.Employee;

@Repository
public class EmployeeDao {
	
	public String selectNextEmpNo(SqlSessionTemplate sqlSession) {
		return  sqlSession.selectOne("employeeMapper.selectNextEmpNo");
		
	}

	
	public int insertEmployee(Employee e, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("employeeMapper.insertEmployee", e);
	}
	
}