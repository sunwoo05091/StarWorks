package org.starworks.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class DocumentVO {
	
	// Document
	private long dc_no;										// 문서 번호(결재 번호)
	private String dc_title;								// 문서 제목
	private String dc_contents;						// 문서 내용
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date dc_date_start;						// 기안일자
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date dc_date_end;						// 마감일자
	
	private String dc_state;								// 문서상태
	private int e_no;											// 사원번호
	private String dc_drafter;							// 기안자

	private List<DocumentAttachVO> attachList;		// 첨부파일 list처리
	
	// DirectSign
	private int dsi_seq;								// 결재 순서(합의자, 결재자)
	private char dsi_check;						// 결재유무
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date dsi_date;						// 결재일
	
	private String dsi_approver;			// 결재자
	private String dsi_consensus;			// 합의자
	
	// InDirectSign
	private int idsi_seq;									// 결재 순서(참조자, 시행자)
	private char idsi_check;								// 결재 유무
	private String idsi_referrer;						// 참조자
	private String idsi_implementer;			// 시행자
	
	// DirectSign and InDirectSign
	private String dc_type;									// 결재구분
	
	// emp
	private String name;		// 이름
	private String grade;		// 직급
	private String dep;			// 부서
	
	
	

	
}
