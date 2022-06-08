package org.starworks.mapper;

import java.util.List;

import org.starworks.domain.AttendanceVO;
import org.starworks.domain.AuthDTO;
import org.starworks.domain.EmpVO;

public interface MemberMapper {
	int insertEmp(EmpVO emp);


	List<EmpVO> listSignUpApprove();

	int updateEmp(EmpVO emp);

	List<EmpVO> listEmp(String dep);
	
	public EmpVO read(String id);

	void checkUpdate(EmpVO emp);

	List<EmpVO> getListCheck();

	AttendanceVO getAttendance(String id);

	void checkin(String id);

	void checkout(String id);

	void insertAuth(AuthDTO auth);
	
	int checkId(String username);

	String checkPass(String username);

	int checkAppend(String username);
}
