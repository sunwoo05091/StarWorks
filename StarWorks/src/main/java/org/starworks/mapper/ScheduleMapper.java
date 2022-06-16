package org.starworks.mapper;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.starworks.domain.Criteria;
import org.starworks.domain.ScheduleVO;


public interface ScheduleMapper {
	
	public int insertSchedule(ScheduleVO schedule);
//	List<ScheduleVO> listSchedule();
	public List<ScheduleVO> listSchedule(Criteria cri);
	public ScheduleVO detailSchedule(int s_no);
	public int deleteSchedule(ScheduleVO schedule);
	public int updateSchedule(ScheduleVO schedule);
	public int countSchedule();
	public List<ScheduleVO> typeSchedule(String s_type);
	public int countMainPage();
	public List<ScheduleVO> todaySchedule();
	public List<ScheduleVO> showSchedule();
	public int dragUpdateTime(ScheduleVO vo);
	public int deleteClickSchdule(ScheduleVO vo);
}
