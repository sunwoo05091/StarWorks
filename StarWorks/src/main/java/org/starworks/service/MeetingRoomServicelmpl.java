package org.starworks.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.starworks.domain.MeetingRoomVO;
import org.starworks.mapper.MeetingRoomMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class MeetingRoomServicelmpl implements MeetingRoomService {

	@Autowired
	private MeetingRoomMapper mrMapper;
	
	@Override
	public List<MeetingRoomVO> listMeetingRoom() {
		
		
		return mrMapper.listMeetingRoom();
	}
	
	@Override
	public void registerMeetingRoom(MeetingRoomVO meetingroom) {
		
		mrMapper.insertMeetingRoom(meetingroom);
	}

}
