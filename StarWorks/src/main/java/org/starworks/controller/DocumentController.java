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
import org.starworks.domain.DocumentAttachVO;
import org.starworks.domain.Criteria;
import org.starworks.domain.DocumentVO;
import org.starworks.domain.PageDTO;
import org.starworks.service.DocumentService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/document/*")
@AllArgsConstructor
public class DocumentController {
	
	private DocumentService service;
	
	// 목록 처리 (페이징 처리 추가 및 페이징 처리 화면 구현 코드 추가(실제 데이터베이스의 게시글 수를 total에 넘겨온다.))
	@GetMapping("/listDocument")
	public void listDocument(Criteria cri, Model model) {

		log.info("list: " + cri);
		model.addAttribute("list", service.listDocument(cri));

		int total = service.getTotal(cri);
		
		log.info("total: " + total);

		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}
	
	 // 일부 목록 조회하고 수정까지 처리하고, 수정한 게시글의 페이징으로 이동 처리 (이동하는 용도)
	@GetMapping({ "/getDocument", "/modifyDocument" })
	public void getDocument(@RequestParam("dc_no") Long dc_no, @ModelAttribute("cri") Criteria cri, Model model) {

		log.info("/getDocument or modifyDocument");
		model.addAttribute("document", service.getDocument(dc_no));
		
	}

	
	// 등록 처리	< 첨부파일 등록 및 DB 처리 >
		@PostMapping("/registerDocument")
		public String registerDocument(DocumentVO document, RedirectAttributes rttr) {

			// BoardService를 호출하기 전에, log를 이용해서 확인하는 작업
			log.info("==========================");

			
			log.info("register: " + document);

			if (document.getAttachList() != null) {

				document.getAttachList().forEach(attach -> log.info(attach));

			}

			log.info("==========================");
			// 확인 끝.

			service.registerDocument(document);

			rttr.addFlashAttribute("result", document.getDc_no());

			return "redirect:/document/listDocument";
		}
		
		// 등록 폼 이동 처리 < 이게 있어야 페이지로 이동할 수 있다. >
		@GetMapping("/registerDocument")
		public void registerDocument() {}		
		
		 // 수정 처리(서비스에서 blooen값 설정)하고, 수정된 글 목록 페이지로 처리
		@PostMapping("/modifyDocument")
		public String modifyDocument(DocumentVO document, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
			log.info("modify:" + document);

			if (service.modifyDocument(document)) {
				rttr.addFlashAttribute("result", "success");
			}

			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());

			return "redirect:/document/listDocument";
		}
		
		// 삭제 처리
		@PostMapping("/removeDocument")
		public String removeDocument(@RequestParam("dc_no") Long dc_no, Criteria cri, RedirectAttributes rttr) {

			log.info("remove..." + dc_no);

			List<DocumentAttachVO> attachList = service.getAttachList(dc_no);

			if (service.removeDocument(dc_no)) {		// DB 삭제

				// delete Attach Files
				deleteFiles(attachList);

				rttr.addFlashAttribute("result", "success");
			}
			return "redirect:/document/listDocument" + cri.getListLink();
		}
		
		// 특정한 게시물 번호에 대하여 첨부파일과 관련된 데이터를 JSON으로 반환 처리
		@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody	// @RestController로 작성되지 않아서, @ResponseBody를 적용하여 직접 JSON으로 반환
		public ResponseEntity<List<DocumentAttachVO>> getAttachList(Long dc_no) {

		log.info("getAttachList " + dc_no);

		return new ResponseEntity<>(service.getAttachList(dc_no), HttpStatus.OK);

		}
		
		// 파일 삭제 처리( /remove에서 deleteFiles(attachList);에 해당하는 메서드 기능)
		private void deleteFiles(List<DocumentAttachVO> attachList) {
		    
		    if(attachList == null || attachList.size() == 0) {
		      return;
		    }
		    
		    log.info("delete attach files...................");
		    log.info(attachList);
		    
		    attachList.forEach(attach -> {
		      try {        
		        Path file  = Paths.get("C:\\project\\starworks\\StarWorks\\upload\\"+attach.getUploadPath()+"\\" + attach.getUuid()+"_"+ attach.getFileName());
		        
		        Files.deleteIfExists(file);		// 물리적 파일 삭제
		        
		        if(Files.probeContentType(file).startsWith("image")) {		// 만약, 이미지 파일이라면?
		        
		          Path thumbNail = Paths.get("C:\\project\\starworks\\StarWorks\\upload\\"+attach.getUploadPath()+"\\s_" + attach.getUuid()+"_"+ attach.getFileName());
		          
		          Files.delete(thumbNail);	// 썸네일 파일 삭제
		        }
		
		      }catch(Exception e) {
		        log.error("delete file error" + e.getMessage());
		      }//end catch
		    });//end foreachd
		  }
		
		// 결재 진행 문서함
		@GetMapping("/listDocumentSignProgress")
		public void listDocumentSignProgress(Criteria cri, Model model) {

			log.info("list: " + cri);
			model.addAttribute("list", service.listDocumentSignProgress(cri));

			int total = service.getTotal(cri);

			log.info("total: " + total);

			model.addAttribute("pageMaker", new PageDTO(cri, total));

		}
		
		
		// 결재 완료 문서함
		@GetMapping("/listDocumentSignComplete")
		public void listDocumentSignComplete(Criteria cri, Model model) {

			log.info("list: " + cri);
			model.addAttribute("list", service.listDocumentSignComplete(cri));

			int total = service.getTotal(cri);

			log.info("total: " + total);

			model.addAttribute("pageMaker", new PageDTO(cri, total));

		}
		
		// 결재 반려 문서함
		@GetMapping("/listDocumentSignCompanion")
		public void listDocumentSignCompanion(Criteria cri, Model model) {

			log.info("list: " + cri);
			model.addAttribute("list", service.listDocumentSignCompanion(cri));

			int total = service.getTotal(cri);

			log.info("total: " + total);

			model.addAttribute("pageMaker", new PageDTO(cri, total));

		}
		
		// 부서 문서함
		@GetMapping("/listDocumentSignCompleteDepartment")
		public void listDocumentSignCompleteDepartment(Criteria cri, Model model) {

			log.info("list: " + cri);
			model.addAttribute("list", service.listDocumentSignCompleteDepartment(cri));

			int total = service.getTotal(cri);

			log.info("total: " + total);

			model.addAttribute("pageMaker", new PageDTO(cri, total));

		}
		
		// 결재선 사원 리스트
		@GetMapping("/listDocumentSign")
		public void listDocumentSign(Criteria cri, Model model) {

			log.info("list: " + cri);
			model.addAttribute("list", service.listDocumentSign(cri));

			int total = service.getTotal(cri);

			log.info("total: " + total);

			model.addAttribute("pageMaker", new PageDTO(cri, total));

		}
		
		
		
		
		

}
