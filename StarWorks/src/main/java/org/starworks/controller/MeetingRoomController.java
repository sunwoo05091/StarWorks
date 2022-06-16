package org.starworks.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.starworks.domain.MeetingRoomVO;
import org.starworks.service.MeetingRoomService;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
/* @RequiredArgsConstructor */
@AllArgsConstructor
@RequestMapping("/meetingroom/*")
public class MeetingRoomController {

	private final MeetingRoomService service;

	
	@RequestMapping("/meetingroom")
	public String Calendar() {
		return "/meetingroom/meetingroom";
	}
	 

	@GetMapping("/meetingroom/index")
	public void list(Model model) {
		log.info("list");

		model.addAttribute("list", service.listMeetingRoom());
	}
	
	//일정 관리 페이지
		@RequestMapping(value = "/schedule")
		public String schedule(Model model)throws Exception {
			
			model.addAttribute("showSchedule" , service.listMeetingRoom());
			
			return "/meetingroom/Schedule";
		}
		
		//일정 추가 팝업
		@RequestMapping(value = "/schedulePopup")
		public String test2() throws Exception {
			return "/meetingroom/schedulePopup";
		}
		
		//일정 추가 버튼 클릭 Ajax
		@ResponseBody
		@RequestMapping(value = "/addSchedule", method = RequestMethod.POST)
		public Map<Object,Object> addSchedule(@RequestBody MeetingRoomVO vo) throws Exception{
			Map<Object,Object>map = new HashMap<Object, Object>();

			service.registerMeetingRoom(vo);
		
			return map;
		}

		//일정 보이기 (임시)
		
//		  @ResponseBody
//		  
//		  @RequestMapping(value = "/showSchedule") public List<MeetingRoomVO>
//		  showSchedule() throws Exception { Authentication auth =
//		  SecurityContextHolder.getContext().getAuthentication(); String id =
//		  auth.getName();
//		  
//		  List<MeetingRoomVO> list = service.listMeetingRoom();
//		  
//		  return list; }
		 

}// end controller
