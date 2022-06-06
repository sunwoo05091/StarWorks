package org.starworks.domain;

import java.util.List;

import lombok.Data;

@Data
public class EmpVO{
	private int e_no;
	private String id;
	private String pass;
	private String name;
	private String phone_number;
	private String hiredate;
	private String sign;
	private int c_no;
	private String dep;
	private String grade;
	private int signupcheck;
	
	private List<AuthVO> authList;
	
	
}
