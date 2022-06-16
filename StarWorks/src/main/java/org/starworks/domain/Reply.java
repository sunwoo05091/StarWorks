package org.starworks.domain;

import java.io.Serializable;

public class Reply implements Serializable{

	private int cm_r_no;
	private String cm_r_contents;
	private String cm_r_date;
	private int e_no;
	private int cm_no;
	
	public Reply(){
		
	}

	
	public Reply(int cm_r_no, String cm_r_contents, String cm_r_date, int e_no, int cm_no) {
		super();
		this.cm_r_no = cm_r_no;
		this.cm_r_contents = cm_r_contents;
		this.cm_r_date = cm_r_date;
		this.e_no = e_no;
		this.cm_no = cm_no;
	}


	public int getCm_r_no() {
		return cm_r_no;
	}

	public void setCm_r_no(int cm_r_no) {
		this.cm_r_no = cm_r_no;
	}

	public String getCm_r_contents() {
		return cm_r_contents;
	}

	public void setCm_r_contents(String cm_r_contents) {
		this.cm_r_contents = cm_r_contents;
	}

	public String getCm_r_date() {
		return cm_r_date;
	}

	public void setCm_r_date(String cm_r_date) {
		this.cm_r_date = cm_r_date;
	}

	public int getE_no() {
		return e_no;
	}

	public void setE_no(int e_no) {
		this.e_no = e_no;
	}

	public int getCm_no() {
		return cm_no;
	}

	public void setCm_no(int cm_no) {
		this.cm_no = cm_no;
	}


	@Override
	public String toString() {
		return "Reply [cm_r_no=" + cm_r_no + ", cm_r_contents=" + cm_r_contents + ", cm_r_date=" + cm_r_date + ", e_no="
				+ e_no + ", cm_no=" + cm_no + "]";
	}
	
	
	
}
