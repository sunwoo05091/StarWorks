package org.starworks.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.starworks.domain.AttendanceVO;
import org.starworks.domain.AuthDTO;
import org.starworks.domain.EmpVO;
import org.starworks.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServicelmpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private PasswordEncoder pwencoder;

	@Override
	public void register(EmpVO emp) {
		String pass = pwencoder.encode(emp.getPass());
		emp.setPass(pass);
		mapper.insertEmp(emp);
		
	}

	@Override
	public List<EmpVO> getList(String dep) {
		
		return mapper.listEmp(dep);
		
	}

	@Override
	public void checkUpdate(EmpVO emp, String auth) {
		
		int authority = 1;
		if (auth.equals("관리자")) authority = 2;
		
		AuthDTO au = new AuthDTO(emp.getE_no(), authority);
		mapper.checkUpdate(emp);
		mapper.insertAuth(au);
		
	}

	@Override
	public List<EmpVO> getListCheck() {
		return mapper.getListCheck();
	}

	@Override
	public AttendanceVO getAttendance(String id) {
		return mapper.getAttendance(id);
	}

	@Override
	public void checkin(String id) {
		mapper.checkin(id);
	}

	@Override
	public void checkout(String id) {
		mapper.checkout(id);
		
	}

}
