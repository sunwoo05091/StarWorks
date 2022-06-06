package org.starworks.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AttendanceVO {

	private Date a_date;
	private String a_checkin;
	private String a_checkout;
	private int e_no;
}
