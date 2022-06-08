package org.starworks.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.starworks.domain.LoginDTO;
import org.starworks.service.MemberService;

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
}
