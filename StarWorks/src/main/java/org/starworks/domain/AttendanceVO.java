package org.starworks.domain;

import lombok.Data;

@Data
public class AttendanceVO {

	private String a_date;
	private String a_checkin;
	private String a_checkout;
	private int e_no;
	
	private double worktime;
	
	public void setWorktime() {
		int inHour = Integer.parseInt(a_checkin.substring(0,2));
		int outHour = Integer.parseInt(a_checkout.substring(0,2));
		double inMin = Integer.parseInt(a_checkin.substring(3))/60;
		double outMin = Integer.parseInt(a_checkin.substring(3))/60;
		
		double in = inHour + inMin;
		double out = outHour + outMin;
		
		this.worktime = out-in;
	}
}
