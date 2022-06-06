package org.starworks.controller;

import java.security.Principal;
import java.util.Locale;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.server.ui.LoginPageGeneratingWebFilter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.starworks.domain.EmpVO;
import org.starworks.domain.LoginDTO;
import org.starworks.service.MemberService;

import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@Log4j
public class CommonController {
	
	private MemberService service;
	
	@GetMapping("/")
	public String main(Locale locale, Model model, Principal principal) {
		
		if (service.getAttendance(principal.getName()) != null) {
			model.addAttribute("attendance", service.getAttendance(principal.getName()));
			log.info("checkin date" + service.getAttendance(principal.getName()).getA_checkin());
		}
		
		return "main";
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(EmpVO emp, RedirectAttributes rttr) {
		
		log.info(emp);
		
		service.register(emp);
		
		rttr.addFlashAttribute("result", emp.getE_no());
		
		return "redirect:/login";
	}

	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {

		log.info("access Denied : " + auth);

		model.addAttribute("msg", "Access Denied");
	}

	@GetMapping("/login")
	public void loginInput(String error, String logout, Model model) {

		log.info("error: " + error);
		log.info("logout: " + logout);
		
		if (error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}

		if (logout != null) {
			model.addAttribute("logout", "Logout!!");
		}
	}

	@GetMapping("/logout")
	public void logoutGET() {

		log.info("custom logout");
	}

	@PostMapping("/logout")
	public void logoutPost() {

		log.info("post custom logout");
	}
	


}
