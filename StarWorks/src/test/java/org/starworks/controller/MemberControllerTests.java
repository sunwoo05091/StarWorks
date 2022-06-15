package org.starworks.controller;

import static org.junit.Assert.*;

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
import org.starworks.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class MemberControllerTests {
	
	@Autowired
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Autowired
	private MemberMapper mapper;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
//	@Test
//	public void testList() throws Exception {
//		
//		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/list"))
//				.andReturn().getModelAndView().getModelMap());
//	}
	
//	@Test
//	public void testRegister() throws Exception{
//		
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/member/register")
//				.param("e_no", "20220531")
//				.param("id", "5555")
//				.param("pass", "5555")
//				.param("name", "5555")
//				.param("phone_number", "5555")
//			).andReturn().getModelAndView().getViewName();
//		
//		log.info(resultPage);
//	}
	
//	@Test
//	public void testList() {
//		mapper.listEmp(1).forEach(emp -> log.info(emp));
//	}
	
	@Test
	public void testUpdateCheck() throws Exception{
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/member/register")
				.param("e_no", "20220531")
				.param("id", "5555")
				.param("pass", "5555")
				.param("name", "5555")
				.param("phone_number", "5555")
			).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}

}
