package org.starworks.controller;

import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.starworks.domain.EmpVO;
import org.starworks.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {

	private MemberService service;
		
	@GetMapping("/organizationchart")
	public void getOrganizationchart() {
		
	}
	
	@GetMapping("/listOrganizationchart")
	public void listOrganizationchart(@RequestParam("dno") int d_no, Model model) {
		log.info(d_no);
	    String dep = null;
	    
	    switch (d_no) {
	    case 1:
	       dep = "인사"; 
	       break;
	    case 2:
	       dep = "영업"; 
	       break;
	    case 3:
	       dep = "개발"; 
	       break;
	    case 4:
	       dep = "임원"; 
	       break;
	    case 5:
	       dep = "총무"; 
	       break;
	      }
	    model.addAttribute("list", service.getList(dep));
	    model.addAttribute("dep",dep);
	}
	
	@GetMapping("/listEmpCheck")
	public void listEmpCheck(Model model) {
		model.addAttribute("list",service.getListCheck());
	}
	
	@PostMapping("/listEmpCheck")
	public String listEmpCheck(EmpVO emp, String auth) throws UnsupportedEncodingException {
		String grade = new String(emp.getGrade().getBytes("ISO-8859-1"), "UTF-8");
		String dep = new String(emp.getDep().getBytes("ISO-8859-1"), "UTF-8");
		
		emp.setGrade(grade);
		emp.setDep(dep);
		
		service.checkUpdate(emp, auth);
		
		return "redirect:/member/listEmpCheck";
	}
	
	@GetMapping("/checkin")
	public String checkin(Principal principal) {
		service.checkin(principal.getName());
		return "redirect:/";
	}
	
	@GetMapping("/checkout")
	public String checkout(Principal principal) {
		service.checkout(principal.getName());
		return "redirect:/";
		
	}
	
	@GetMapping("/mypage")
	public void getEmp(Principal principal, Model model) {
		EmpVO emp = service.getEmp(principal.getName());
		model.addAttribute("emp",emp);
		
	}
	
	@GetMapping("/listAnnualleave")
	public void listAnnualleave(Principal principal, Model model) {
		List<EmpVO> list = service.listAnnualleave(principal.getName());
		model.addAttribute("list",list);
		
	}
	
	@GetMapping("/listAttendance")
	public void listAttendance(Principal principal, Model model) {
		List<EmpVO> list = service.listAttendance(principal.getName());
		model.addAttribute("list",list);
		
	}
	
	@GetMapping("/listPaystub")
	public void listPaystub(Principal principal, Model model) {
		List<EmpVO> list = service.listPaystub(principal.getName());
		model.addAttribute("list",list);
		
	}
	
	@GetMapping("/listPhoneBook")
	public void listPhoneBook(Principal principal, Model model) {
		List<EmpVO> list = service.listPhoneBook(principal.getName());
		model.addAttribute("list",list);
		
	}

}
