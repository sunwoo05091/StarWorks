package org.starworks.mapper;

import java.time.LocalDate;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.starworks.domain.Criteria;
import org.starworks.domain.DocumentVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)		// �������� �����ϴ� ������ �� ���̶�� ������̼�
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")		// ������ ���� ���̴�.
@Log4j
public class DocumentMapperTests {
	
	@Autowired
	private DocumentMapper mapper;
	
	// list
//	@Test
//	public void test() {
//		mapper.listDocument().forEach(document -> log.info(document));	
//	}
	
	// �� �ۼ�	
//	@Test
//	public void testInsert() {
//		DocumentVO document = new DocumentVO();
//		LocalDate date = LocalDate.now();
//		document.setDc_title("���� �ۼ��ϴ� ��");
//		document.setDc_contents("���� �ۼ��ϴ� ����");
//		document.setDc_date_end(date);
//		document.setDc_drafter("newbie");
//		document.setDc_state("������");
//		
//		mapper.insertDocument(document);
//
//		log.info(document);
//	} 
	
	// ���ۼ��� dc_no�� ���� ó��
//	@Test
//	public void testInsertSelectKey() {
//
//		DocumentVO document = new DocumentVO();
//		LocalDate date = LocalDate.now();
//		document.setDc_title("���� �ۼ��ϴ� ��");
//		document.setDc_contents("���� �ۼ��ϴ� ����");
//		document.setDc_date_end(date);
//		document.setDc_drafter("newbie");
//		document.setDc_state("������");
//
//		mapper.insertSelectKeyDocument(document);
//
//		log.info(document);
//	} 
	
	// �󼼺���
//	@Test
//	public void testGet() {
//		
//		// �����ϴ� �Խù� ��ȣ�� �׽�Ʈ
//		DocumentVO document = mapper.getDocument(11);
//		log.info(document);
//	}
	
	// ����
//	@Test
//	public void testDelete() {
//
//		// �Խù� ��ȣ�� ���� ���θ� Ȯ���ϰ� �׽�Ʈ�� ��
//		log.info("DELETE COUNT: " + mapper.deleteDocument(6));
//
//	}
	
	// ����
//	@Test
//	public void testUpdate() {
//
//		// �Խù� ��ȣ�� ���� ���θ� Ȯ���ϰ� �׽�Ʈ�� ��
//		DocumentVO document = new DocumentVO();
//
//		document.setDc_no(11);
//		document.setDc_title("�����ϴ� ��");
//		document.setDc_contents("�����ϴ� ����");
//		
//		int count = mapper.updateDocument(document);
//		log.info("UPDATE COUNT: " + count);
//	}
	
	// ����¡ ó��
//	@Test
//	public void testPaging() {
//
//		Criteria cri = new Criteria();
//		
//	    //10���� 3������ 
//	    cri.setPageNum(3);
//	    cri.setAmount(10);
//
//
//		List<DocumentVO> list = mapper.getListWithPaging(cri);
//
//		list.forEach(document -> log.info(document));
//
//	}
	
	// �˻� ��� ó��
//	  @Test
//	  public void testSearch() {
//
//	    Criteria cri = new Criteria();
//	    cri.setKeyword("Ű����");
//	    cri.setType("TCW");
//
//	    List<DocumentVO> list = mapper.getListWithPaging(cri);
//
//	    list.forEach(document -> log.info(document));
//	  }
	
	// listDocumentSignCompanion
//	@Test
//	public void test() {
//		mapper.listDocumentSignCompanion().forEach(document -> log.info(document));	
//	}
	
	// listDocumentSignCompanion
//	@Test
//	public void test() {
//		mapper.listDocumentSignCompanion().forEach(document -> log.info(document));	
//	}
	
	// listDocumentSign
//	@Test
//	public void test() {
//		mapper.listDocumentSign().forEach(document -> log.info(document));	
//	}

}
