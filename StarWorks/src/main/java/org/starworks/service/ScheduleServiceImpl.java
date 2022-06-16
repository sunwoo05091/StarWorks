package org.starworks.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.starworks.domain.Criteria;
import org.starworks.domain.ScheduleVO;
import org.starworks.mapper.ScheduleMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ScheduleServiceImpl implements ScheduleService{
	
	@Autowired
	private ScheduleMapper mapper;
	
	@Override
	public void register(ScheduleVO schedule) {
		log.info("insert schedule");
		System.out.println("test");
		
		mapper.insertSchedule(schedule);
	}

	@Override
	public int deleteSchedule(ScheduleVO schedule) {
		return mapper.deleteSchedule(schedule);
	}

	@Override
	public int updateSchedule(ScheduleVO schedule) {
		// TODO Auto-generated method stub
		return mapper.updateSchedule(schedule);
	}

	@Override
	public int countSchedule() {
		// TODO Auto-generated method stub
		
		return mapper.countSchedule();
	}

	@Override
	public List<ScheduleVO> typeSchedule(String s_type) {
		
		return mapper.typeSchedule(s_type);
	}

	@Override
	public int countMainPage() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ScheduleVO> todaySchedule() {
		return mapper.todaySchedule();
	}


	@Override
	public ScheduleVO detailSchedule(int s_no) {
		// TODO Auto-generated method stub
		return mapper.detailSchedule(s_no);
	}

	@Override
	public List<ScheduleVO> listSchedule(Criteria cri) {
		
		return mapper.listSchedule(cri);
	}

	@Override
	public List<ScheduleVO> showSchedule() {
		return mapper.showSchedule();
	}

	@Override
	public int dragUpdateTime(ScheduleVO vo) {
		log.info("서비스 :::::: " + vo);
		return mapper.dragUpdateTime(vo);
	}

	@Override
	public int deleteClickSchdule(ScheduleVO vo) {
		// TODO Auto-generated method stub
		return mapper.deleteClickSchdule(vo);
	}






	



	
}
