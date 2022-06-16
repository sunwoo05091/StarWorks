package org.starworks.domain;

import lombok.Data;

@Data
public class Criteria {
	
	private int pageNum; // 현재 페이지
	private int amount; //한 페이지당 글 갯수 
	
	
	private String type;
	private String keyword;
	
	
	public Criteria(){
		this(1, 10);
	}

	public Criteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type == null ? new String[] {}: type.split("");
	}
	
}
