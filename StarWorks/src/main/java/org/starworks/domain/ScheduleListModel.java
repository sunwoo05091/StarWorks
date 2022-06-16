package org.starworks.domain;

import java.util.List;

import lombok.Data;

@Data
public class ScheduleListModel {
	private List<ScheduleVO> list;
	private int requestPage;
	private int totalPage;
	private int startPage;
	private int endPage;
	
		public ScheduleListModel(){}
	
		public ScheduleListModel(List<ScheduleVO> list, int requestPage, int totalPage, int startPage, int endPage) {
			super();
			this.list = list;
			this.requestPage = requestPage;
			this.totalPage = totalPage;
			this.startPage = startPage;
			this.endPage = endPage;
		}

		
	
}
