package org.starworks.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.starworks.domain.LoginDTO;
import org.starworks.service.MemberService;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/check/*")
@AllArgsConstructor
public class LoginController {
	
	private MemberService service;
	
	private PasswordEncoder pwencoder;

	@PostMapping("/check")
	public ResponseEntity<String> check(@RequestBody LoginDTO login, Model model) {
		
		log.info("check..........");
		
		int insertCount = service.checkid(login.getUsername());
		
		if (service.checkid(login.getUsername()) != 1) {
			log.info("worng id");
			
			return new ResponseEntity<>("1", HttpStatus.OK);
		}
	
		if (pwencoder.matches(login.getPassword(), service.checkpass(login.getUsername())) == false) {
			log.info("worng pass");
		
			return new ResponseEntity<>("2", HttpStatus.OK);
		
		}
		
		if (service.checkAppend(login.getUsername()) != 1) {
			log.info("not append");
			
			return new ResponseEntity<>("3", HttpStatus.OK);
			
		}
		
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
//	@ResponseBody
//	@RequestMapping("/attendance")
//	public void selectChart(String type, String year, String day, ModelAndView mv, HttpSession session, HttpServletResponse response) throws JsonIOException, IOException {
//	  // year과 day 변수를 조합해서 date를 만듦 (생략)
//	  // ArrayList에 DB에서 조회한 값 담아줌
//	  ArrayList<List> chartList = service.chartList(type, date);
//
//	  // Json형태로 넘겨줌
//	  response.setContentType("application/json; charset=UTF-8");
//	  Gson gson = new Gson();
//	  gson.toJson(chartList, response.getWriter());
//	}
}
