package org.starworks.domain;

import lombok.Data;

@Data
public class AuthDTO {

	private int e_no;
	private int auth;
	
	public AuthDTO(int e_no, int auth) {
		super();
		this.e_no = e_no;
		this.auth = auth;
	}
}
