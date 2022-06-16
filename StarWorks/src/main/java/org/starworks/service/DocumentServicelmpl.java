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
	
	// ����۾� < ÷������ ��� �� DB ó�� >
	@Transactional
	@Override
	public void registerDocument(DocumentVO document) {
		log.info("register......" + document);

		mapper.insertSelectKeyDocument(document);

		if (document.getAttachList() == null || document.getAttachList().size() <= 0) {
			return;		// ���� ���ε带 ���ߴٸ�, ����
		}

		document.getAttachList().forEach(attach -> {

			attach.setDc_no(document.getDc_no());
			attachMapper.insertDocument(attach);
		});
		
	}

	// ��� ��ȸ
	@Override
	public DocumentVO getDocument(Long dc_no) {
		log.info("get......" + dc_no);

		return mapper.getDocument(dc_no);
	}

	// ��ü ��� ��ȸ	(����¡ ó���� ���)
	@Override
	public List<DocumentVO> listDocument(Criteria cri) {
		log.info("List with criteria: " + cri);

		return mapper.getListWithPaging(cri);
	}

	// ��ü ��� ����
	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		
		return mapper.getTotalCount(cri);
	}

	// ��� ����
	@Override
	public boolean modifyDocument(DocumentVO document) {
		log.info("modify......" + document);

		return mapper.updateDocument(document) == 1;			// �����ϸ� 1����
	}

	// ��� ����
	@Transactional
	@Override
	public boolean removeDocument(Long dc_no) {
		log.info("remove...." + dc_no);

		attachMapper.deleteAllDocument(dc_no);			// ÷������ ����

		return mapper.deleteDocument(dc_no) == 1;		// ���� �� ����
	}

	// �Խù��� ÷������ ����� ��������
	@Override
	public List<DocumentAttachVO> getAttachList(Long dc_no) {
		log.info("get Attach list by bno" + dc_no);

		return attachMapper.findByDcno(dc_no);		// dc_no : �Խñ� ��ȣ
	}

	// ���� ���� ������
	@Override
	public List<DocumentVO> listDocumentSignProgress(Criteria cri) {
		log.info("List with criteria: " + cri);

		return mapper.listDocumentSignProgress();
	}

	// ���� �Ϸ� ������
	@Override
	public List<DocumentVO> listDocumentSignComplete(Criteria cri) {
		log.info("List with criteria: " + cri);
		
		return mapper.listDocumentSignComplete();
	}

	// �ݷ� ������
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
