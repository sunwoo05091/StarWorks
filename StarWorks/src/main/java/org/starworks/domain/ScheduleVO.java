package org.starworks.domain;

import java.io.Serializable;

import org.springframework.context.annotation.Primary;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ScheduleVO implements Serializable{
	private int s_no; //스케쥴 번호
	private String s_title; //제목
	private String s_contents; //내용
	private String s_type; //글종류
	private String s_startday;
	private String s_finishday;
	private String s_date;//작성일
	private int e_no; //사원번호
	private String situation;
	private int remainingdays;
	
	public ScheduleVO(){}
	
	public ScheduleVO(int s_no, String s_title, String s_contents, String s_type, String s_startday, String s_finishday,
			String s_date, int e_no, String situation, int remainingdays) {
		super();
		this.s_no = s_no;
		this.s_title = s_title;
		this.s_contents = s_contents;
		this.s_type = s_type;
		this.s_startday = s_startday;
		this.s_finishday = s_finishday;
		this.s_date = s_date;
		this.e_no = e_no;
		this.situation = situation;
		this.remainingdays = remainingdays;
	}

	
	
	
}
