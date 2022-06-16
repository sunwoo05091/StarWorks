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
	
	// ��� ó�� (����¡ ó�� �߰� �� ����¡ ó�� ȭ�� ���� �ڵ� �߰�(���� �����ͺ��̽��� �Խñ� ���� total�� �Ѱܿ´�.))
	@GetMapping("/listDocument")
	public void listDocument(Criteria cri, Model model) {

		log.info("list: " + cri);
		model.addAttribute("list", service.listDocument(cri));

		int total = service.getTotal(cri);
		
		log.info("total: " + total);

		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}
	
	 // �Ϻ� ��� ��ȸ�ϰ� �������� ó���ϰ�, ������ �Խñ��� ����¡���� �̵� ó�� (�̵��ϴ� �뵵)
	@GetMapping({ "/getDocument", "/modifyDocument" })
	public void getDocument(@RequestParam("dc_no") Long dc_no, @ModelAttribute("cri") Criteria cri, Model model) {

		log.info("/getDocument or modifyDocument");
		model.addAttribute("document", service.getDocument(dc_no));
		
	}

	
	// ��� ó��	< ÷������ ��� �� DB ó�� >
		@PostMapping("/registerDocument")
		public String registerDocument(DocumentVO document, RedirectAttributes rttr) {

			// BoardService�� ȣ���ϱ� ����, log�� �̿��ؼ� Ȯ���ϴ� �۾�
			log.info("==========================");

			
			log.info("register: " + document);

			if (document.getAttachList() != null) {

				document.getAttachList().forEach(attach -> log.info(attach));

			}

			log.info("==========================");
			// Ȯ�� ��.

			service.registerDocument(document);

			rttr.addFlashAttribute("result", document.getDc_no());

			return "redirect:/document/listDocument";
		}
		
		// ��� �� �̵� ó�� < �̰� �־�� �������� �̵��� �� �ִ�. >
		@GetMapping("/registerDocument")
		public void registerDocument() {}		
		
		 // ���� ó��(���񽺿��� blooen�� ����)�ϰ�, ������ �� ��� �������� ó��
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
		
		// ���� ó��
		@PostMapping("/removeDocument")
		public String removeDocument(@RequestParam("dc_no") Long dc_no, Criteria cri, RedirectAttributes rttr) {

			log.info("remove..." + dc_no);

			List<DocumentAttachVO> attachList = service.getAttachList(dc_no);

			if (service.removeDocument(dc_no)) {		// DB ����

				// delete Attach Files
				deleteFiles(attachList);

				rttr.addFlashAttribute("result", "success");
			}
			return "redirect:/document/listDocument" + cri.getListLink();
		}
		
		// Ư���� �Խù� ��ȣ�� ���Ͽ� ÷�����ϰ� ���õ� �����͸� JSON���� ��ȯ ó��
		@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody	// @RestController�� �ۼ����� �ʾƼ�, @ResponseBody�� �����Ͽ� ���� JSON���� ��ȯ
		public ResponseEntity<List<DocumentAttachVO>> getAttachList(Long dc_no) {

		log.info("getAttachList " + dc_no);

		return new ResponseEntity<>(service.getAttachList(dc_no), HttpStatus.OK);

		}
		
		// ���� ���� ó��( /remove���� deleteFiles(attachList);�� �ش��ϴ� �޼��� ���)
		private void deleteFiles(List<DocumentAttachVO> attachList) {
		    
		    if(attachList == null || attachList.size() == 0) {
		      return;
		    }
		    
		    log.info("delete attach files...................");
		    log.info(attachList);
		    
		    attachList.forEach(attach -> {
		      try {        
		        Path file  = Paths.get("C:\\project\\starworks\\StarWorks\\upload\\"+attach.getUploadPath()+"\\" + attach.getUuid()+"_"+ attach.getFileName());
		        
		        Files.deleteIfExists(file);		// ������ ���� ����
		        
		        if(Files.probeContentType(file).startsWith("image")) {		// ����, �̹��� �����̶��?
		        
		          Path thumbNail = Paths.get("C:\\project\\starworks\\StarWorks\\upload\\"+attach.getUploadPath()+"\\s_" + attach.getUuid()+"_"+ attach.getFileName());
		          
		          Files.delete(thumbNail);	// ����� ���� ����
		        }
		
		      }catch(Exception e) {
		        log.error("delete file error" + e.getMessage());
		      }//end catch
		    });//end foreachd
		  }
		
		// ���� ���� ������
		@GetMapping("/listDocumentSignProgress")
		public void listDocumentSignProgress(Criteria cri, Model model) {

			log.info("list: " + cri);
			model.addAttribute("list", service.listDocumentSignProgress(cri));

			int total = service.getTotal(cri);

			log.info("total: " + total);

			model.addAttribute("pageMaker", new PageDTO(cri, total));

		}
		
		
		// ���� �Ϸ� ������
		@GetMapping("/listDocumentSignComplete")
		public void listDocumentSignComplete(Criteria cri, Model model) {

			log.info("list: " + cri);
			model.addAttribute("list", service.listDocumentSignComplete(cri));

			int total = service.getTotal(cri);

			log.info("total: " + total);

			model.addAttribute("pageMaker", new PageDTO(cri, total));

		}
		
		// ���� �ݷ� ������
		@GetMapping("/listDocumentSignCompanion")
		public void listDocumentSignCompanion(Criteria cri, Model model) {

			log.info("list: " + cri);
			model.addAttribute("list", service.listDocumentSignCompanion(cri));

			int total = service.getTotal(cri);

			log.info("total: " + total);

			model.addAttribute("pageMaker", new PageDTO(cri, total));

		}
		
		// �μ� ������
		@GetMapping("/listDocumentSignCompleteDepartment")
		public void listDocumentSignCompleteDepartment(Criteria cri, Model model) {

			log.info("list: " + cri);
			model.addAttribute("list", service.listDocumentSignCompleteDepartment(cri));

			int total = service.getTotal(cri);

			log.info("total: " + total);

			model.addAttribute("pageMaker", new PageDTO(cri, total));

		}
		
		// ���缱 ��� ����Ʈ
		@GetMapping("/listDocumentSign")
		public void listDocumentSign(Criteria cri, Model model) {

			log.info("list: " + cri);
			model.addAttribute("list", service.listDocumentSign(cri));

			int total = service.getTotal(cri);

			log.info("total: " + total);

			model.addAttribute("pageMaker", new PageDTO(cri, total));

		}
		
		
		
		
		

}
