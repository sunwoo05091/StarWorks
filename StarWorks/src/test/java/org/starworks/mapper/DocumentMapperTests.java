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

@RunWith(SpringJUnit4ClassRunner.class)		// 스프링을 실행하는 역할을 할 것이라는 어노테이션
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")		// 설정에 관한 것이다.
@Log4j
public class DocumentMapperTests {
	
	@Autowired
	private DocumentMapper mapper;
	
	// list
//	@Test
//	public void test() {
//		mapper.listDocument().forEach(document -> log.info(document));	
//	}
	
	// 글 작성	
//	@Test
//	public void testInsert() {
//		DocumentVO document = new DocumentVO();
//		LocalDate date = LocalDate.now();
//		document.setDc_title("새로 작성하는 글");
//		document.setDc_contents("새로 작성하는 내용");
//		document.setDc_date_end(date);
//		document.setDc_drafter("newbie");
//		document.setDc_state("결재중");
//		
//		mapper.insertDocument(document);
//
//		log.info(document);
//	} 
	
	// 글작성을 dc_no로 값을 처리
//	@Test
//	public void testInsertSelectKey() {
//
//		DocumentVO document = new DocumentVO();
//		LocalDate date = LocalDate.now();
//		document.setDc_title("새로 작성하는 글");
//		document.setDc_contents("새로 작성하는 내용");
//		document.setDc_date_end(date);
//		document.setDc_drafter("newbie");
//		document.setDc_state("결재중");
//
//		mapper.insertSelectKeyDocument(document);
//
//		log.info(document);
//	} 
	
	// 상세보기
//	@Test
//	public void testGet() {
//		
//		// 존재하는 게시물 번호로 테스트
//		DocumentVO document = mapper.getDocument(11);
//		log.info(document);
//	}
	
	// 삭제
//	@Test
//	public void testDelete() {
//
//		// 게시물 번호의 존재 여부를 확인하고 테스트할 것
//		log.info("DELETE COUNT: " + mapper.deleteDocument(6));
//
//	}
	
	// 수정
//	@Test
//	public void testUpdate() {
//
//		// 게시물 번호의 존재 여부를 확인하고 테스트할 것
//		DocumentVO document = new DocumentVO();
//
//		document.setDc_no(11);
//		document.setDc_title("수정하는 글");
//		document.setDc_contents("수정하는 내용");
//		
//		int count = mapper.updateDocument(document);
//		log.info("UPDATE COUNT: " + count);
//	}
	
	// 페이징 처리
//	@Test
//	public void testPaging() {
//
//		Criteria cri = new Criteria();
//		
//	    //10개씩 3페이지 
//	    cri.setPageNum(3);
//	    cri.setAmount(10);
//
//
//		List<DocumentVO> list = mapper.getListWithPaging(cri);
//
//		list.forEach(document -> log.info(document));
//
//	}
	
	// 검색 기능 처리
//	  @Test
//	  public void testSearch() {
//
//	    Criteria cri = new Criteria();
//	    cri.setKeyword("키워드");
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
