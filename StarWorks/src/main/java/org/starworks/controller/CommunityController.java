package org.starworks.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.starworks.domain.CommunityListModel;
import org.starworks.domain.CommunityVO;
import org.starworks.domain.Criteria;
import org.starworks.domain.Search;
import org.starworks.service.CommunityService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/community/*")
@AllArgsConstructor
public class CommunityController {

	@Autowired
	private CommunityService service;
	
	@GetMapping("/trade/list")
	public void list(Model model)  {
		
		model.addAttribute("list", service.listCommunity());
		
		
	}
	
	@GetMapping("/trade/register")
	public void register() {
		
	}
	
	@PostMapping("/trade/register")
	public String registerTrade(MultipartFile cm_fname, CommunityVO vo) {
		
		String uploadFolder = "C:\\project\\StarWorks\\StarWorks\\src\\main\\webapp\\resources\\upload";
		
		
		
		File saveFile = new File(uploadFolder, cm_fname.getOriginalFilename());
		
		try {
			cm_fname.transferTo(saveFile);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		
		vo.setCm_fname(cm_fname.getOriginalFilename());
		
		service.insertCommunityTrade(vo);
		
		return "redirect:/community/trade/list";
	}
	
	@GetMapping({"/trade/get", "/trade/modify"})
	public void getTrade(@RequestParam("cm_no") int cm_no, Model model) {
		
		model.addAttribute("community", service.detailCommunityTrade(cm_no));
	}
	
	/*
	 * @GetMapping("/trade/modify") public void modify(@RequestParam("cm_no") int
	 * cm_no, Model model) {
	 * 
	 * }
	 */
	
	@PostMapping("/trade/modify")
	public String modifyTrade(CommunityVO vo, RedirectAttributes rttr) {
		
		rttr.addAttribute("community", service.updateCommunityTrade(vo));
		log.info(vo);
		
		
		return "redirect:/community/trade/list";
	}
}
