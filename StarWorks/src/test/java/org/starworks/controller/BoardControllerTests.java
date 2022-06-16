package org.starworks.controller;


import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;


import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class BoardControllerTests {

	@Autowired
	private WebApplicationContext ctx;
	private MockMvc mockMvc; //가상의 톰캣(WAS)
	
	@Before // before가 적용된 메서드는 모든 테스트 전에 매번 실행되는 메서드가 된다
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
//	@Test //리스트는 불러와지는데 오류남
//	public void testList() throws Exception{
//		
//		log.info(
//				mockMvc.perform(MockMvcRequestBuilders.get("/board/list"))//Get방식의 호출을 하게한다
//				.andReturn()
//				.getModelAndView()
//				.getModelMap());
//			
//	}
	
//	@Test
//	public void testRegister()throws Exception{
//		
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/register")
//				.param("b_title", "테스트 새글 제목")
//				.param("b_contents", "테스트 새글 내용")
//				).andReturn().getModelAndView().getViewName();
//		
//		log.info(resultPage);								
//	}
	
//	@Test
//	public void testGet()throws Exception{
//		
//		log.info(mockMvc.perform(MockMvcRequestBuilders
//				.get("/board/get")
//				.param("bno", "152"))
//				.andReturn()
//				.getModelAndView().getModel());
//	}
	
	@Test //오류남
	public void testModify() throws Exception{
		
		String resultPage = mockMvc
				.perform(MockMvcRequestBuilders.post("/board/notice/modifyNotice")
						.param("b_no", "224")
						.param("b_title", "수정된 테스트 새글 제목")
						.param("b_contents", "수정된 테스트 새글 내용"))
						
					.andReturn().getModelAndView().getViewName();
				
		log.info(resultPage);						
	}
//	
//	@Test //오류남
//	public void testRemove()throws Exception {
//		
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/remove")
//				.param("bno", "171")
//				).andReturn().getModelAndView().getViewName();
//		
//		log.info(resultPage);		
//	}
//	
//	@Test
//	public void testListPaging() throws Exception{
//		
//		log.info(mockMvc.perform(
//				MockMvcRequestBuilders.get("/board/list")
//				.param("pageNum", "2")
//				.param("amount", "50"))
//				.andReturn().getModelAndView().getModelMap());
//	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
