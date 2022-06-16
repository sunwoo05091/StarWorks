package org.starworks.mapper;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.starworks.domain.BoardVO;
import org.starworks.domain.Criteria;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class) 
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml") 
																				
@Log4j 
public class BoardMapperTests {

	@Autowired
	private BoardMapper mapper;

//	@Test
//	
//	  public void test() { 
//		mapper.listNotice().forEach(board -> log.info(board)); 
//	}
//	@Test
//	public void testinsert() {
//		BoardVO board = new BoardVO();
//		board.setB_title("새로 작성하는 글");
//		board.setB_contents("새로 작성하는 내용");
//		
//
//		mapper.insertNotice(board);
//
//		log.info(board);
//	}
//	@Test
//	public void testInsertSelectKey() {
//		BoardVO board = new BoardVO();
//		board.setB_title("새로 작성하는 글 select key");
//		board.setB_contents("새로 작성하는 내용 select key");
//		
//
//		mapper.insertNoticeSelectKey(board);
//		log.info(board);
//	}
//	@Test
//	public void testRead() {
//
//		BoardVO board = mapper.readNotice(146l);
//
//		log.info(board);
//	}
//	@Test
//	public void testDelete() {
//
//		log.info("DELETE COUNT:" + mapper.deleteNotice(161L));
//	}
	@Test
	public void testUpdate() {

		BoardVO board = new BoardVO();

		board.setB_no(155L);
		board.setB_title("수정된 제목");
		board.setB_contents("수정된 내용");
		board.setB_fname("수정된 내용");
		

		int count = mapper.updateNotice(board);
		log.info("UPDATE COUNT:" + count);
	}
	
//	@Test
//	public void testPaging() {
//		
//		Criteria cri = new Criteria();
//		
//		cri.setPageNum(3);
//		cri.setAmount(10);
//		
//		List<BoardVO> list = mapper.getListWithPaging(cri);
//		
//		list.forEach(board -> log.info(board));
//	}
	
//	@Test
//	public void testSearch() {
//		
//		Criteria cri = new Criteria();
//		cri.setKeyword("정현");
//		cri.setType("TC");
//		
//		List<BoardVO> list = mapper.getListWithPaging(cri);
//		
//		list.forEach(board -> log.info(board));
//	}
}
