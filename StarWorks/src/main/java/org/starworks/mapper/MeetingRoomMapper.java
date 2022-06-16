package org.starworks.mapper;

import java.util.List;

import org.starworks.domain.MeetingRoomVO;

public interface MeetingRoomMapper {
	
	public List<MeetingRoomVO> listMeetingRoom();
	public void insertMeetingRoom(MeetingRoomVO meetingroom);
}
