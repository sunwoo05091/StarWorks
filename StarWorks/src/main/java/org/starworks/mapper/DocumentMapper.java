package org.starworks.mapper;

import java.util.List;

import org.starworks.domain.Criteria;
import org.starworks.domain.DocumentVO;

public interface DocumentMapper {
	
	// ���
	public void insertDocument(DocumentVO document);
	
	// ����� dc_no ��� �� ���
	public Integer insertSelectKeyDocument(DocumentVO document);
	
	// ���
	public List<DocumentVO> listDocument();			// List�� import java.util.List;�� ����Ʈ �Ѵ�.
	
	// �󼼺���
	public DocumentVO getDocument(Long dc_no);

	// ����
	public int deleteDocument(Long dc_no);

	// ����
	public int updateDocument(DocumentVO document);

	// ����¡ ó��
	public List<DocumentVO> getListWithPaging(Criteria cri);
	
	// �Խù� ����(���� �Խù� ���� ���� total)
	public int getTotalCount(Criteria cri);
	
	// ���� ���� ������
	List<DocumentVO> listDocumentSignProgress();
	
	// ���� �Ϸ� ������
	List<DocumentVO> listDocumentSignComplete();
	
	// �ݷ� ������
	List<DocumentVO> listDocumentSignCompanion();
	
	// �μ� ������
	List<DocumentVO> listDocumentSignCompleteDepartment();
	
	// ���缱 ��� ����Ʈ
	public List<DocumentVO> listDocumentSign();
	

}
