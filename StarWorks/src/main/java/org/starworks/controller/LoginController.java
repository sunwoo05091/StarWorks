package org.starworks.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.starworks.domain.LoginDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/check/*")
@AllArgsConstructor
public class LoginController {

	@PostMapping("/")
	public LoginDTO check(@RequestBody LoginDTO login) {
		
		log.info("check..........");
		log.info(login.getUsername());
		log.info(login.getPassword());
		
		return login;
		
	}
}
