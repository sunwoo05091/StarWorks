package org.starworks.domain;


import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class BoardVO {
	private Long b_no; //글번호
	private String b_title;//글제목
	private String b_contents;//글내용
	private String b_fname;//파일이름
	
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date b_date;//작성일
	
	private String b_category;//카테고리
	private int b_fin;//상단고정상태
	private int e_no;//사원번호
	
	private List<BoardAttachVO> attachList;
}
