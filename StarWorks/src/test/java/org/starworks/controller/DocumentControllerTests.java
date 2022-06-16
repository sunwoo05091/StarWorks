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
	private WebApplicationContext ctx;		// ������ �����̳�
	
	private MockMvc mockMvc;
	
	// ��� ��ü�� ����(�׻� ����)
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	 // ��� ó��
	@Test
	public void testList() throws Exception {

		log.info(
				mockMvc.perform(MockMvcRequestBuilders 
						.get("/document/listDocument"))	
						.andReturn()
						.getModelAndView()
						.getModelMap());
	}
	
	// �Ϻ� ��� ��ȸ ó��
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
	
	// ��� ó��
//	@Test
//	public void testinsert() throws Exception {
//
//		String resultPage = mockMvc
//				.perform(MockMvcRequestBuilders
//				.post("/document/register")
//				.param("dc_title", "�׽�Ʈ ���� ����")
//				.param("dc_contents", "�׽�Ʈ ���� ����")
//				.param("dc_date_end", "2022/06/09")
//				.param("dc_drafter", "user00")
//				.param("dc_state", "������"))
//				.andReturn()
//				.getModelAndView()
//				.getViewName();
//
//		log.info(resultPage);
//
//	}
	
	// ���� ó��
//	@Test
//	public void testUpdate() throws Exception {
//
//		String resultPage = mockMvc
//				.perform(MockMvcRequestBuilders
//						.post("/document/modify")
//						.param("dc_no", "1")		
//						.param("dc_title", "������ �׽�Ʈ ���� ����")
//						.param("dc_contents", "������ �׽�Ʈ ���� ����"))
//						.andReturn()
//						.getModelAndView()
//						.getViewName();
//
//		log.info(resultPage);
//
//	}
	
	// ���� ó��
//	@Test
//	public void testDelete() throws Exception {
//		// ������ �����ͺ��̽��� �Խù� ��ȣ Ȯ���� ��
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders
//				.post("/document/remove")
//				.param("dc_no", "5"))
//				.andReturn()
//				.getModelAndView()
//				.getViewName();
//
//		log.info(resultPage);
//	}
	
	// ����¡  ó��
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
