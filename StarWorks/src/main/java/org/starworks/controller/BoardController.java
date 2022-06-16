package org.starworks.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.starworks.domain.BoardAttachVO;
import org.starworks.domain.BoardVO;
import org.starworks.domain.Criteria;
import org.starworks.domain.PageDTO;
import org.starworks.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

	
	private BoardService service;
	
	@GetMapping("/notice/registerNotice")
	public void register() {
		
	}
	
	
//	@GetMapping("/list")
//	public void list(Model model) {
//		log.info("list");
//		model.addAttribute("list",service.listNotice());
//	}
	
	@PostMapping("/notice/registerNotice")
	public String register(BoardVO board, RedirectAttributes rttr) {
		
		log.info("========================");
		
		log.info("register:" + board);
		
		if(board.getAttachList() != null) {
			
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		
		log.info("==============================");
		
		service.registerNotice(board);
		rttr.addFlashAttribute("result",board.getB_no());
		
		return "redirect:/board/notice/listNotice";
		
	}
	
	@GetMapping({"/notice/getNotice","/notice/modifyNotice"})
	public void get(@RequestParam("b_no") Long bno, @ModelAttribute("cri") Criteria cri, Model model ) {
		
		log.info("/get or modify");
		model.addAttribute("board", service.getNotice(bno));
	}
	
	
	@PostMapping("/notice/modifyNotice")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify:" + board);
		log.info("컨트롤러 들어왔니");
		if(service.modifyNotice(board)) {
			rttr.addFlashAttribute("result","success");
		}
		
		
		return "redirect:/board/notice/listNotice";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("b_no") Long bno, Criteria cri, RedirectAttributes rttr) {

		log.info("remove..." + bno);
		//첨부파일 목록을 담아둠
		List<BoardAttachVO> attachList = service.getAttachList(bno);

		if (service.removeNotice(bno)) {

			// delete Attach Files
			deleteFiles(attachList);

			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/notice/listNotice" + cri.getListLink();
	}
	
	@GetMapping("/notice/listNotice")
	public void list(Criteria cri, Model model) {
		
		log.info("list:" + cri);
		model.addAttribute("list", service.listNotice(cri));
		//model.addAttribute("pageMaker",new PageDTO(cri,123));
		
		int total = service.getTotal(cri);
		
		log.info("total:" + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}
	
	@GetMapping(value = "/getAttachList",
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno){
		
		log.info("getAttachList" + bno);
		
		return new ResponseEntity<>(service.getAttachList(bno),HttpStatus.OK);
	}
	
	//파일 삭제 처리
	private void deleteFiles(List<BoardAttachVO> attachList) {
	    
	    if(attachList == null || attachList.size() == 0) {
	      return;
	    }
	    
	    log.info("delete attach files...................");
	    log.info(attachList);
	    
	    //파일들의 정보
	    attachList.forEach(attach -> {
	      try {        
	        Path file  = Paths.get("D:\\upload\\"+attach.getUploadPath()+"\\" + attach.getUuid()+"_"+ attach.getFileName());
	        
	        Files.deleteIfExists(file); //물리적 파일 삭제
	        
	        if(Files.probeContentType(file).startsWith("image")) {
	        
	          Path thumbNail = Paths.get("D:\\upload\\"+attach.getUploadPath()+"\\s_" + attach.getUuid()+"_"+ attach.getFileName());
	          
	          Files.delete(thumbNail); //이미지 파일 삭제
	        }
	
	      }catch(Exception e) {
	        log.error("delete file error" + e.getMessage());
	      }//end catch
	    });//end foreachd
	  }
	
	
	
}
