package org.starworks.mapper;

import java.util.List;

import org.starworks.domain.DocumentAttachVO;


public interface DocumentAttachMapper {

	// ÷������ ���
	public void insertDocument(DocumentAttachVO vo);

	// ÷������ ����(x ������ �����Ǵ� ��)
	public void deleteDocument(String uuid);

	// ���� ���� ÷�����Ͽ� ���Ͽ� bno�� ������ ����
	public List<DocumentAttachVO> findByDcno(Long dc_no);

	// ÷������ ���� ó��(�Խù��� ���Ե� ÷������ ���� ����)
	public void deleteAllDocument(Long dc_no);

	public List<DocumentAttachVO> getOldFiles();
	

}