package org.starworks.mapper;

import java.util.List;

import org.starworks.domain.DocumentAttachVO;


public interface DocumentAttachMapper {

	// 첨부파일 등록
	public void insertDocument(DocumentAttachVO vo);

	// 첨부파일 삭제(x 누르면 삭제되는 것)
	public void deleteDocument(String uuid);

	// 여러 개의 첨부파일에 대하여 bno로 정보를 저장
	public List<DocumentAttachVO> findByDcno(Long dc_no);

	// 첨부파일 삭제 처리(게시물이 포함된 첨부파일 같이 삭제)
	public void deleteAllDocument(Long dc_no);

	public List<DocumentAttachVO> getOldFiles();
	

}