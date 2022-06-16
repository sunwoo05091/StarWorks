package org.starworks.service;

import java.util.List;

import org.starworks.domain.DocumentAttachVO;
import org.starworks.domain.Criteria;
import org.starworks.domain.DocumentVO;

public interface DocumentService {
	
	// 등록 처리
	public void registerDocument(DocumentVO document);
	
	// 목록 조회 처리
	public DocumentVO getDocument(Long dc_no);
	
	// 조회 처리
	public List<DocumentVO> listDocument(Criteria cri);		// 페이징 처리 추가
	
	// 게시물 총합
	public int getTotal(Criteria cri);

	// 수정 처리
	public boolean modifyDocument(DocumentVO document);

	// 삭제 처리
	public boolean removeDocument(Long dc_no);
	
	// 게시물 조회에서 첨부파일을 Ajax를 이용해서 별도로 처리
	public List<DocumentAttachVO> getAttachList(Long dc_no);
	
	// 결재 진행 문서함
	public List<DocumentVO> listDocumentSignProgress(Criteria cri);
	
	// 결재 완료 문서함
	public List<DocumentVO> listDocumentSignComplete(Criteria cri);
	
	// 반려 문서함
	public List<DocumentVO> listDocumentSignCompanion(Criteria cri);
	
	// 부서 문서함
	public List<DocumentVO> listDocumentSignCompleteDepartment(Criteria cri);
	
	// 결재선 사원 리스트
	public List<DocumentVO> listDocumentSign(Criteria cri);

}
