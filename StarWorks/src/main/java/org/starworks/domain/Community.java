package org.starworks.domain;

import java.io.Serializable;

public class Community implements Serializable{

	private int cm_no;
	private String cm_price;
	private String cm_contents;
	private String cm_date;
	private String cm_title;
	private int cm_hitcount;
	private String cm_category;
	private String cm_fname;
	private int cm_fin;
	private String e_no;
	private String cm_state;
	
	public Community() {
		
	}

	public Community(int cm_no, String cm_price, String cm_contents, String cm_date, String cm_title, int cm_hitcount,
			String cm_category, String cm_fname, int cm_fin, String e_no, String cm_state) {
		super();
		this.cm_no = cm_no;
		this.cm_price = cm_price;
		this.cm_contents = cm_contents;
		this.cm_date = cm_date;
		this.cm_title = cm_title;
		this.cm_hitcount = cm_hitcount;
		this.cm_category = cm_category;
		this.cm_fname = cm_fname;
		this.cm_fin = cm_fin;
		this.e_no = e_no;
		this.cm_state = cm_state;
	}

	public int getCm_no() {
		return cm_no;
	}

	public void setCm_no(int cm_no) {
		this.cm_no = cm_no;
	}

	public String getCm_price() {
		return cm_price;
	}

	public void setCm_price(String cm_price) {
		this.cm_price = cm_price;
	}

	public String getCm_contents() {
		return cm_contents;
	}

	public void setCm_contents(String cm_contents) {
		this.cm_contents = cm_contents;
	}

	public String getCm_date() {
		return cm_date;
	}

	public void setCm_date(String cm_date) {
		this.cm_date = cm_date;
	}

	public String getCm_title() {
		return cm_title;
	}

	public void setCm_title(String cm_title) {
		this.cm_title = cm_title;
	}

	public int getCm_hitcount() {
		return cm_hitcount;
	}

	public void setCm_hitcount(int cm_hitcount) {
		this.cm_hitcount = cm_hitcount;
	}

	public String getCm_category() {
		return cm_category;
	}

	public void setCm_category(String cm_category) {
		this.cm_category = cm_category;
	}

	public String getCm_fname() {
		return cm_fname;
	}

	public void setCm_fname(String cm_fname) {
		this.cm_fname = cm_fname;
	}

	public int getCm_fin() {
		return cm_fin;
	}

	public void setCm_fin(int cm_fin) {
		this.cm_fin = cm_fin;
	}

	public String getE_no() {
		return e_no;
	}

	public void setE_no(String e_no) {
		this.e_no = e_no;
	}

	public String getCm_state() {
		return cm_state;
	}

	public void setCm_state(String cm_state) {
		this.cm_state = cm_state;
	}

	@Override
	public String toString() {
		return "Community [cm_no=" + cm_no + ", cm_price=" + cm_price + ", cm_contents=" + cm_contents + ", cm_date="
				+ cm_date + ", cm_title=" + cm_title + ", cm_hitcount=" + cm_hitcount + ", cm_category=" + cm_category
				+ ", cm_fname=" + cm_fname + ", cm_fin=" + cm_fin + ", e_no=" + e_no + ", cm_state=" + cm_state + "]";
	}
	
	
	
	
}
