package org.starworks.mapper;

import java.util.List;

import org.starworks.domain.Criteria;
import org.starworks.domain.DocumentVO;

public interface DocumentMapper {
	
	// 등록
	public void insertDocument(DocumentVO document);
	
	// 등록한 dc_no 출력 및 등록
	public Integer insertSelectKeyDocument(DocumentVO document);
	
	// 목록
	public List<DocumentVO> listDocument();			// List는 import java.util.List;로 인폴트 한다.
	
	// 상세보기
	public DocumentVO getDocument(Long dc_no);

	// 삭제
	public int deleteDocument(Long dc_no);

	// 수정
	public int updateDocument(DocumentVO document);

	// 페이징 처리
	public List<DocumentVO> getListWithPaging(Criteria cri);
	
	// 게시물 종합(실제 게시물 수에 대한 total)
	public int getTotalCount(Criteria cri);
	
	// 결재 진행 문서함
	List<DocumentVO> listDocumentSignProgress();
	
	// 결재 완료 문서함
	List<DocumentVO> listDocumentSignComplete();
	
	// 반려 문서함
	List<DocumentVO> listDocumentSignCompanion();
	
	// 부서 문서함
	List<DocumentVO> listDocumentSignCompleteDepartment();
	
	// 결재선 사원 리스트
	public List<DocumentVO> listDocumentSign();
	

}
