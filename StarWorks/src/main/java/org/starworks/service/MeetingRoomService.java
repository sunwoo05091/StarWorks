package org.starworks.service;

import java.util.List;


import org.starworks.domain.MeetingRoomVO;



public interface MeetingRoomService {

	public List<MeetingRoomVO> listMeetingRoom();
	public void registerMeetingRoom(MeetingRoomVO meetingroom);
}
