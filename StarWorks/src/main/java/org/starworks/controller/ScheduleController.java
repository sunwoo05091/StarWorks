package org.starworks.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.starworks.domain.Criteria;
import org.starworks.domain.ScheduleListModel;
import org.starworks.domain.ScheduleVO;
import org.starworks.domain.pageDTO;
import org.starworks.mapper.ScheduleMapper;
import org.starworks.service.ScheduleService;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sun.javadoc.Type;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/schedule/*")
public class ScheduleController {
	
	//private void test() {};
	private void test(int i) {}
	@Autowired
	private ScheduleService service;
	
//	@GetMapping("/main")
//	public String registerSchedule(Model model) {
//		log.info("move schedule ...");
//		
//		model.addAttribute("ScheduleListModel", service.todaySchedule());
//		
//		return "redirect:/schedule/schedule";
//	}
	
	@RequestMapping("/schedule")
	public String main(Model model) {
		
		model.addAttribute("ScheduleListModel", service.todaySchedule());
		
		return "schedule";
	}
	
	@RequestMapping("insertForm.do")
	public String insertForm() {
		
		log.info("move insertForm");
		
		return "redirect:/schedule/insertSchedule";
	}
	
	@RequestMapping("insertSchedule")
	public String insertSchedule() {
		return "insertForm";
	}
	
	@PostMapping("insertSchedule")
	public String registerSchedule(ScheduleVO vo) {
		log.info(vo);
		String s = vo.getS_startday().substring(0,10);
		String f = vo.getS_finishday().substring(0,10);
		vo.setS_startday(s);
		vo.setS_finishday(f);
		
		service.register(vo);
		
		return "redirect:/schedule/schedule";
	}
	

	
	@GetMapping("/listAction")
	public String listSchedule(Model model, Criteria cri, ScheduleVO vo) {
	int total = service.countSchedule();	
	
	model.addAttribute("ScheduleListModel", service.listSchedule(cri));
	model.addAttribute("pageMaker", new pageDTO(cri, total));
	log.info("list" + model);
	//model.addAttribute("pageMaker", new pageDTO(cri, total));
	return "list";
	}
	
	@GetMapping("/scheduleDetailAction")
	public String scheduleDetailAction(@RequestParam("s_no") int s_no, Model model) {
		model.addAttribute("schedule", service.detailSchedule(s_no));
		
		return"scheduleDetail";
	}
	
	@GetMapping("/deleteScheduleAction")
	public String deleteScheduleAction(@RequestParam("s_no") int s_no, Model model, ScheduleVO vo) {
		model.addAttribute("schedule", service.deleteSchedule(vo));
		
		return "redirect:/schedule/schedule";
	}
	@DeleteMapping("/schedule-click-remove")
	public void dataClickDelete(@RequestBody ScheduleVO vo) {
		log.info("테스트1");
		log.info(vo.getS_title());
		service.deleteClickSchdule(vo);
		log.info("삭제");
	}
	
	
	
	@GetMapping("/moveUpdateScheduleAction")
	public String moveUpdateScheduleAction(@RequestParam("s_no") int s_no, Model model, ScheduleVO vo) {
		
		model.addAttribute("schedule", service.detailSchedule(s_no));
		
		return "UpdateSchedule";
	}
	
	@RequestMapping("moveUpdateSchedulePopup")
	public String moveUpdateSchedulePopup() {
		
		return "UpdateSchedulePopup";
	}
	
	@PostMapping("/updateAction")
	public String updateAction(ScheduleVO vo, RedirectAttributes rttr) {
		rttr.addAttribute("schedule", service.updateSchedule(vo));
		
		return "redirect:/schedule/schedule";
	}
	
	
	@RequestMapping(value = "/updatePopup", method = RequestMethod.POST)
	public void updatePopup(@RequestBody ScheduleVO vo) {
		vo.setS_type("");
		System.out.println(vo.toString());
		service.updateSchedule(vo);
	}
	
	
	
	@PostMapping("/schedule-drag-upadate")
	@ResponseBody
	public ScheduleVO dragUpdate(@RequestBody ScheduleVO vo) {
		
		String s = vo.getS_startday().substring(0,10);
		String f = vo.getS_finishday().substring(0,10);
		vo.setS_startday(s);
		vo.setS_finishday(f);
		
		log.info(vo.getS_title());
		
		log.info(s);
		log.info(f);
		
		log.info(service.dragUpdateTime(vo));
		
		return vo;
	}
	
	@GetMapping("/TypeScheduleAction")
	public String TypeScheduleAction(@RequestParam("s_type") String s_type, RedirectAttributes rttr,Model model) {
		int no = Integer.parseInt(s_type);
		String type = null;
		
		switch (no) {
		case 1:
			type = "개인";
			break;
		case 2:
			type = "미팅";
			break;
		case 3:
			type = "회의";
			break;
		}
		
		rttr.addAttribute("s_type", type);
		List<ScheduleVO> list = service.typeSchedule(type);
		model.addAttribute("schedule", list);
		
		log.info(type);
		return "mainDetailSchedule";
	}
	
	@GetMapping("/test")
	public String test(Model model,Criteria cri) {
		int total = service.countSchedule();
		
		List<ScheduleVO> list = service.showSchedule();
		for(int i=0; i<list.size(); i++) {
			String a = list.get(i).getS_startday().substring(0,10);
			String b = list.get(i).getS_finishday().substring(0,10);
			list.get(i).setS_startday(a);
			list.get(i).setS_finishday(b);
		}
		  log.info(list);
		  
		  model.addAttribute("showSchedule", list);
		  model.addAttribute("ScheduleListModel", service.listSchedule(cri));
		  model.addAttribute("pageMaker", new pageDTO(cri, total));
		 
		
		return "fullcalender";
	}
	
	@RequestMapping("/schedulePopup")
	public String test2() {
		return "schedulePopup";
	}
	
	@ResponseBody
	@RequestMapping(value = "/addSchedule", method = RequestMethod.POST)
	public void addSchedule(@RequestBody ScheduleVO vo)throws Exception{
		service.register(vo);
	}
		
}
