package org.starworks.domain;

import lombok.Data;

@Data
public class AttachFileDTO {

	private String fileName;		// 파일 이름
	private String uploadPath;	// 파일 경로
	private String uuid;					// 고유값
	private boolean image;			// 이미지의 판별 유무

}
