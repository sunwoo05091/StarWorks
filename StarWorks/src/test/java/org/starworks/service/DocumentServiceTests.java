package org.starworks.service;

import static org.junit.Assert.assertNotNull;

import java.time.LocalDate;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.starworks.domain.Criteria;
import org.starworks.domain.DocumentVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)		
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")	
@Log4j
public class DocumentServiceTests {
	
	@Autowired
	private DocumentService service;
	
	// 정상적으로 BoardService가 생성되고 DocumentMapper가 주입되는지 확인하는 용도
//		@Test
//		public void testExist() {
//
//			log.info(service);
//			assertNotNull(service);		// assertNotNull : 변수가 실존하는 객체이면 테스트 성공!!
//		}
		
	// 등록 작업
//	@Test
//	public void testInset() {
//
//		DocumentVO document = new DocumentVO();
//		LocalDate date = LocalDate.now();
//		document.setDc_title("새로 작성하는 글");
//		document.setDc_contents("새로 작성하는 내용");
//		document.setDc_date_end(date);
//		document.setDc_drafter("newbie");
//		document.setDc_state("결재중");
//
//		service.registerDocument(document);
//
//		log.info("생성된 게시물의 번호: " + document.getDc_no());
//	}
	
	// 일부 조회
//	@Test
//	public void testGet() {
//
//		log.info("조회 : " + service.getDocument(1L));
//	}
	
	// 전체 조회 (페이징 적용)
//	@Test
//	public void testGetList() {
//
//		service.listDocument(new Criteria(2, 10)).forEach(document -> log.info(document));
//	}
	
	// 게시글 삭제
//	@Test
//	public void testDelete() {
//
//		// 게시물 번호의 존재 여부를 확인하고 테스트할 것
//		log.info("REMOVE RESULT: " + service.removeDocument(2L));
//
//	}
	
	// 게시글 수정
//	@Test
//	public void testUpdate() {
//
//		DocumentVO document = service.getDocument(1L);
//
//		if (document == null) {
//			return;
//		}
//
//		document.setDc_title("제목 수정합니다.");
//		log.info("MODIFY RESULT: " + service.modifyDocument(document));
//	}
	
	
	// 전체 조회 (페이징 적용)
//	@Test
//	public void testGetList() {
//		
//		service.listDocumentSignCompanion(new Criteria(2, 10)).forEach(document -> log.info(document));
//	}
	
	// listDocumentSign
//	@Test
//	public void testGetList() {
//		
//		service.listDocumentSignComplete(new Criteria(2, 10)).forEach(document -> log.info(document));
//	}
	
	
		

}
