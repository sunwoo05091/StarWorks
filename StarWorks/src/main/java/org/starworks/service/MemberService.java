package org.starworks.service;

import java.util.List;

import org.starworks.domain.AttendanceVO;
import org.starworks.domain.EmpVO;

public interface MemberService {

	public void register(EmpVO emp);

	public List<EmpVO> getList(String dep);
	
	public List<EmpVO> getListCheck();

	public void checkUpdate(EmpVO emp, String auth);

	public AttendanceVO getAttendance(String id);

	public void checkin(String id);

	public void checkout(String id);
}
