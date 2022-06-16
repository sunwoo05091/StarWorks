package org.starworks.mapper;

import java.util.List;

import org.starworks.domain.LoginDTO;
import org.starworks.domain.MemberVO;

public interface MemberMapper {
	MemberVO loginEmp(LoginDTO login);

	int insertEmp(MemberVO emp);

	int checkId(String id);

	List<MemberVO> listSignUpApprove();

	int updateEmp(MemberVO emp);

	int checkIn(int e_no);
	
	int checkOut(int e_no);

	List<MemberVO> listEmp(int d_no);
}
