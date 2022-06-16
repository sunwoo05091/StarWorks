package org.starworks.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.starworks.domain.DocumentAttachVO;
import org.starworks.domain.Criteria;
import org.starworks.domain.DocumentVO;
import org.starworks.mapper.DocumentAttachMapper;
import org.starworks.mapper.DocumentMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class DocumentServicelmpl implements DocumentService {
	
	private DocumentMapper mapper;
	private DocumentAttachMapper attachMapper;
	
	// 등록작업 < 첨부파일 등록 및 DB 처리 >
	@Transactional
	@Override
	public void registerDocument(DocumentVO document) {
		log.info("register......" + document);

		mapper.insertSelectKeyDocument(document);

		if (document.getAttachList() == null || document.getAttachList().size() <= 0) {
			return;		// 파일 업로드를 안했다면, 리턴
		}

		document.getAttachList().forEach(attach -> {

			attach.setDc_no(document.getDc_no());
			attachMapper.insertDocument(attach);
		});
		
	}

	// 목록 조회
	@Override
	public DocumentVO getDocument(Long dc_no) {
		log.info("get......" + dc_no);

		return mapper.getDocument(dc_no);
	}

	// 전체 목록 조회	(페이징 처리한 목록)
	@Override
	public List<DocumentVO> listDocument(Criteria cri) {
		log.info("List with criteria: " + cri);

		return mapper.getListWithPaging(cri);
	}

	// 전체 목록 총합
	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		
		return mapper.getTotalCount(cri);
	}

	// 목록 수정
	@Override
	public boolean modifyDocument(DocumentVO document) {
		log.info("modify......" + document);

		return mapper.updateDocument(document) == 1;			// 성공하면 1리턴
	}

	// 목록 삭제
	@Transactional
	@Override
	public boolean removeDocument(Long dc_no) {
		log.info("remove...." + dc_no);

		attachMapper.deleteAllDocument(dc_no);			// 첨부파일 삭제

		return mapper.deleteDocument(dc_no) == 1;		// 원본 글 삭제
	}

	// 게시물의 첨부파일 목록을 가져오기
	@Override
	public List<DocumentAttachVO> getAttachList(Long dc_no) {
		log.info("get Attach list by bno" + dc_no);

		return attachMapper.findByDcno(dc_no);		// dc_no : 게시글 번호
	}

	// 결재 진행 문서함
	@Override
	public List<DocumentVO> listDocumentSignProgress(Criteria cri) {
		log.info("List with criteria: " + cri);

		return mapper.listDocumentSignProgress();
	}

	// 결재 완료 문서함
	@Override
	public List<DocumentVO> listDocumentSignComplete(Criteria cri) {
		log.info("List with criteria: " + cri);
		
		return mapper.listDocumentSignComplete();
	}

	// 반려 문서함
	@Override
	public List<DocumentVO> listDocumentSignCompanion(Criteria cri) {
		log.info("List with criteria: " + cri);

		return mapper.listDocumentSignCompanion();
	}

	@Override
	public List<DocumentVO> listDocumentSignCompleteDepartment(Criteria cri) {
		log.info("List with criteria: " + cri);

		return mapper.listDocumentSignCompleteDepartment();
	}

	@Override
	public List<DocumentVO> listDocumentSign(Criteria cri) {
		log.info("List with criteria: " + cri);

		return mapper.listDocumentSign();
	}
	
	

}
