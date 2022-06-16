package org.starworks.domain;

import java.io.Serializable;

public class MemberVO implements Serializable{
	private int e_no;
	private String id;
	private String pass;
	private String name;
	private String phone_number;
	private String hiredate;
	private String sign;
	private int c_no;
	private int d_no;
	private String grade;
	private int signupcheck;
	
	public MemberVO() {}

	public MemberVO(int e_no, String id, String pass, String name, String phone_number, String hiredate, String sign,
			int c_no, int d_no, String grade, int signupcheck) {
		super();
		this.e_no = e_no;
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.phone_number = phone_number;
		this.hiredate = hiredate;
		this.sign = sign;
		this.c_no = c_no;
		this.d_no = d_no;
		this.grade = grade;
		this.signupcheck = signupcheck;
	}

	public int getE_no() {
		return e_no;
	}

	public void setE_no(int e_no) {
		this.e_no = e_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getHiredate() {
		return hiredate;
	}

	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public int getD_no() {
		return d_no;
	}

	public void setD_no(int d_no) {
		this.d_no = d_no;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getSignupcheck() {
		return signupcheck;
	}

	public void setSignupcheck(int signupcheck) {
		this.signupcheck = signupcheck;
	}

	
}
