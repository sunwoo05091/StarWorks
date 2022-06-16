package org.starworks.service;

import java.util.List;

import org.starworks.domain.DocumentAttachVO;
import org.starworks.domain.Criteria;
import org.starworks.domain.DocumentVO;

public interface DocumentService {
	
	// ��� ó��
	public void registerDocument(DocumentVO document);
	
	// ��� ��ȸ ó��
	public DocumentVO getDocument(Long dc_no);
	
	// ��ȸ ó��
	public List<DocumentVO> listDocument(Criteria cri);		// ����¡ ó�� �߰�
	
	// �Խù� ����
	public int getTotal(Criteria cri);

	// ���� ó��
	public boolean modifyDocument(DocumentVO document);

	// ���� ó��
	public boolean removeDocument(Long dc_no);
	
	// �Խù� ��ȸ���� ÷�������� Ajax�� �̿��ؼ� ������ ó��
	public List<DocumentAttachVO> getAttachList(Long dc_no);
	
	// ���� ���� ������
	public List<DocumentVO> listDocumentSignProgress(Criteria cri);
	
	// ���� �Ϸ� ������
	public List<DocumentVO> listDocumentSignComplete(Criteria cri);
	
	// �ݷ� ������
	public List<DocumentVO> listDocumentSignCompanion(Criteria cri);
	
	// �μ� ������
	public List<DocumentVO> listDocumentSignCompleteDepartment(Criteria cri);
	
	// ���缱 ��� ����Ʈ
	public List<DocumentVO> listDocumentSign(Criteria cri);

}
