package org.starworks.domain;

import java.util.Date;


import lombok.Data;

@Data
public class MeetingRoomVO {

	private int mr_no;
	private String mr_title;
	private String mr_memo;
	private String mr_start;
	private String mr_end;
	
	
}
