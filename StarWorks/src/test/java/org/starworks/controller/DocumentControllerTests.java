package org.starworks.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Log4j
public class DocumentControllerTests {
	
	@Autowired
	private WebApplicationContext ctx;		// 스프링 컨테이너
	
	private MockMvc mockMvc;
	
	// 목업 객체의 서버(항상 실행)
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	 // 목록 처리
	@Test
	public void testList() throws Exception {

		log.info(
				mockMvc.perform(MockMvcRequestBuilders 
						.get("/document/listDocument"))	
						.andReturn()
						.getModelAndView()
						.getModelMap());
	}
	
	// 일부 목록 조회 처리
//	@Test
//	public void testGet() throws Exception {
//
//		log.info(mockMvc.perform(MockMvcRequestBuilders
//				.get("/document/get")
//				.param("dc_no", "1"))
//				.andReturn()
//				.getModelAndView()
//				.getModelMap());
//	}
	
	// 등록 처리
//	@Test
//	public void testinsert() throws Exception {
//
//		String resultPage = mockMvc
//				.perform(MockMvcRequestBuilders
//				.post("/document/register")
//				.param("dc_title", "테스트 새글 제목")
//				.param("dc_contents", "테스트 새글 내용")
//				.param("dc_date_end", "2022/06/09")
//				.param("dc_drafter", "user00")
//				.param("dc_state", "결재중"))
//				.andReturn()
//				.getModelAndView()
//				.getViewName();
//
//		log.info(resultPage);
//
//	}
	
	// 수정 처리
//	@Test
//	public void testUpdate() throws Exception {
//
//		String resultPage = mockMvc
//				.perform(MockMvcRequestBuilders
//						.post("/document/modify")
//						.param("dc_no", "1")		
//						.param("dc_title", "수정된 테스트 새글 제목")
//						.param("dc_contents", "수정된 테스트 새글 내용"))
//						.andReturn()
//						.getModelAndView()
//						.getViewName();
//
//		log.info(resultPage);
//
//	}
	
	// 삭제 처리
//	@Test
//	public void testDelete() throws Exception {
//		// 삭제전 데이터베이스에 게시물 번호 확인할 것
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders
//				.post("/document/remove")
//				.param("dc_no", "5"))
//				.andReturn()
//				.getModelAndView()
//				.getViewName();
//
//		log.info(resultPage);
//	}
	
	// 페이징  처리
//	@Test
//	public void testListPaging() throws Exception {
//
//		log.info(mockMvc.perform(
//				MockMvcRequestBuilders.get("/document/list")
//				.param("pageNum", "2")
//				.param("amount", "50"))
//				.andReturn().getModelAndView().getModelMap());
//	}
	
	


}
