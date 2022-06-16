package org.starworks.service;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.starworks.domain.BoardVO;
import org.starworks.domain.Criteria;
import org.starworks.mapper.BoardMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {

	@Autowired
	private BoardService service;

	
	@Autowired
	private BoardMapper mapper;
	
//	@Test
//	public void testExist() {
//		log.info(service);
//		assertNotNull(service);
//	}
	
//	@Test
//	public void testRegister() {
//
//		BoardVO board = new BoardVO();
//		board.setB_title("새로 작성하는 글");
//		board.setB_contents("새로 작성하는 내용");
//		
//
//		service.registerNotice(board);
//		log.info("생성된 게시물의 번호:" + board.getB_no());
//	}
	
//	@Test
//	public void testGetList() {
//		service.listNotice().forEach(board -> log.info(board));
//	}
//	@Test
//	public void testGet() {
//		log.info(service.getNotice(152L));
//	}
//	@Test
//	public void testDelete() {
//		
//		log.info("REMOV RESULT:" + service.removeNotice(168L));
//	}
//	@Test
//	public void testUpdate() {
//		
//		BoardVO board = service.getNotice(168L);
//		
//		if(board == null) {
//			return;
//		}
//		
//		board.setB_title("제목 수정합니다.");
//		board.setB_contents("내용을 수정합니다");
//		log.info("MODIFY RESULT:" + service.modifyNotice(board));
//	}
//	
//	@Test //오류남
//	public void testGetList() {
//		service.listNotice(new Criteria(2,10)).forEach(board -> log.info(board));
//	}
	
//	@Test
//	public void testPaging() {
//		
//		Criteria cri = new Criteria();
//		
//		List<BoardVO> list = mapper.getListWithPaging(cri);
//		
//		list.forEach(board -> log.info(board));
//		
//	}
	
}
