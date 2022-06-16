package org.starworks.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.starworks.domain.EmpVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class MemberMapperTests {

	@Autowired
	private MemberMapper mapper;
	
	@Test
	public void testRead() {
		
		EmpVO vo = mapper.read("1111");
		
		log.info(vo);
		
		vo.getAuthList().forEach(authVO -> log.info(authVO));
	}

}
