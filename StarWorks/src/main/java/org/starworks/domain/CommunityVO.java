package org.starworks.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class CommunityVO implements Serializable{

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
}
