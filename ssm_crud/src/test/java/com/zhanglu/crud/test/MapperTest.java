package com.zhanglu.crud.test;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zhanglu.crud.bean.Department;
import com.zhanglu.crud.bean.Employee;
import com.zhanglu.crud.dao.DepartmentMapper;
import com.zhanglu.crud.dao.EmployeeMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class MapperTest {
	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	EmployeeMapper employeeMapper;
	@Test
	public void test() {
//		System.out.println(departmentMapper);
//		Department dept1 = new Department(001,"開發部");
//		Department dept2 = new Department(002,"測試部");
//		departmentMapper.insertSelective(dept1);
//		departmentMapper.insertSelective(dept2);
//		Department dept3 = new Department();
//		dept3 = departmentMapper.selectByPrimaryKey(dept1.getDeptId());
//		System.out.print(dept3);
		
//		Department dept3 = new Department(003,"运维部");
//		departmentMapper.insert(dept3);
//		Department dept4 = new Department(004,"销售部");
//		departmentMapper.insert(dept4);
//		Department dept5 = new Department(005,"需求部");
//		departmentMapper.insert(dept5);
//		Employee emp1 = new Employee(666,"Savege","女","savegewho@gmail.com",5);
//		employeeMapper.insert(emp1);
//		System.out.print(emp1);
	}

}




