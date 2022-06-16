package org.starworks.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class DocumentVO {
	
	// Document
	private long dc_no;										// ���� ��ȣ(���� ��ȣ)
	private String dc_title;								// ���� ����
	private String dc_contents;						// ���� ����
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date dc_date_start;						// �������
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date dc_date_end;						// ��������
	
	private String dc_state;								// ��������
	private int e_no;											// �����ȣ
	private String dc_drafter;							// �����

	private List<DocumentAttachVO> attachList;		// ÷������ listó��
	
	// DirectSign
	private int dsi_seq;								// ���� ����(������, ������)
	private char dsi_check;						// ��������
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date dsi_date;						// ������
	
	private String dsi_approver;			// ������
	private String dsi_consensus;			// ������
	
	// InDirectSign
	private int idsi_seq;									// ���� ����(������, ������)
	private char idsi_check;								// ���� ����
	private String idsi_referrer;						// ������
	private String idsi_implementer;			// ������
	
	// DirectSign and InDirectSign
	private String dc_type;									// ���籸��
	
	// emp
	private String name;		// �̸�
	private String grade;		// ����
	private String dep;			// �μ�
	
	
	

	
}
