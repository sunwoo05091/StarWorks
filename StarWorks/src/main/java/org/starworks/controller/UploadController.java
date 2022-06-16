package org.starworks.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.starworks.domain.AttachFileDTO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class UploadController {

	@GetMapping("/uploadForm")
	public void uploadForm() {
		log.info("upload form");
	}

	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {

		String uploadFolder = "D:\\upload";

		for (MultipartFile multipartFile : uploadFile) {

			log.info("-------------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());

			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename()); //파일이름

			try {
				multipartFile.transferTo(saveFile); //실질적인 파일업로드가 이루어짐
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
	}

	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("upload ajax");
	}

	/*
	 * @PostMapping("/uploadAjaxAction") public void uploadAjaxPost(MultipartFile[]
	 * uploadFile) {
	 * 
	 * log.info("update ajax post.........");
	 * 
	 * String uploadFolder = "D:\\upload";
	 * 
	 * for (MultipartFile multipartFile : uploadFile) {
	 * 
	 * log.info("-------------------------------------");
	 * log.info("Upload File Name: " + multipartFile.getOriginalFilename());
	 * log.info("Upload File Size: " + multipartFile.getSize());
	 * 
	 * String uploadFileName = multipartFile.getOriginalFilename();
	 * 
	 * // IE has file path uploadFileName =
	 * uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
	 * log.info("only file name: " + uploadFileName);
	 * 
	 * File saveFile = new File(uploadFolder, uploadFileName);
	 * 
	 * try { multipartFile.transferTo(saveFile); } catch (Exception e) {
	 * log.error(e.getMessage()); } } }
	 */

	private String getFolder() { //날짜 월 일 단위 폴더 생성

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date); //날짜가 찍힘

		return str.replace("-", File.separator); //폴더가 생성됨
	}

	private boolean checkImageType(File file) {

		try {

			String contentType = Files.probeContentType(file.toPath()); //MIME타입으로 변환?해줌
				
			return contentType.startsWith("image"); //MIME타입이 image로 시작하는걸로 리턴해줌 

		} catch (IOException e) {
			e.printStackTrace();
		}

		return false;
	}

	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		log.info("aaa");

		List<AttachFileDTO> list = new ArrayList<>(); //첨부파일들의 데이터를 저장
		String uploadFolder = "D:\\upload";

		String uploadFolderPath = getFolder();

		// 년/월/일 폴더의 생성
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs(); //파일이 생성됨
		}

		for (MultipartFile multipartFile : uploadFile) {

			AttachFileDTO attachDTO = new AttachFileDTO();

			String uploadFileName = multipartFile.getOriginalFilename();

			// IE의 경우에는 전체 파일 경로가 전송되므로, 마지막에 \\를 기준으로 잘라낸 문자열이 실제 파일 이름
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);

			// 원본 파일의 이름
			attachDTO.setFileName(uploadFileName);

			// 중복 방지를 위한 UUID 적용
			UUID uuid = UUID.randomUUID(); //고유한 id를 생성해준다
			uploadFileName = uuid.toString() + "_" + uploadFileName; // 파일 앞에는 고유id + 뒤에는 기존의 파일명
			log.info("bbb");
			try {

				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);

				// UUID 값
				attachDTO.setUuid(uuid.toString());
				// 업로드 경로
				attachDTO.setUploadPath(uploadFolderPath);

				// 이미지 파일 체크
				if (checkImageType(saveFile)) {
					log.info("ccc");
					// 이미지 여부
					attachDTO.setImage(true);

					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));// 이미지파일은 s_로 시작함

					// Thumbnailator는 InputStream과 java.io.File 객체를 이용해서 파일을 생성할 수 있고, 뒤에 사이즈에 대한 부분을 파라미터로 witdh와 height를 지정할 수 있음
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);

					thumbnail.close();
				}
				log.info("ddd");
				list.add(attachDTO);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {  //업로드 이미지 출력

		log.info("fileName: " + fileName);

		File file = new File("d:\\upload\\" + fileName);

		log.info("file: " + file);

		ResponseEntity<byte[]> result = null;

		try {

			HttpHeaders header = new HttpHeaders();
			
			//File객체를 Path로 변환하여 MIME 타입을 판단하여 HTTPHeaders의 Content-Type에  값으로 들어갑니다.
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			//바이트 단위로 홈페이지에 출력
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			 
		} catch (IOException e) {
			e.printStackTrace();
		}

		return result;
	}
	
	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName) {

		Resource resource = new FileSystemResource("d:\\upload\\" + fileName);

		if (resource.exists() == false) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		String resourceName = resource.getFilename();

		// UUID 제거하여 resourceOriginalName에 저장하여,브라우저에서는 순수한 파일 이름으로 다운로드 되게함
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);
		
		//익스플로어에서의 한글 인코딩과 다운?
		HttpHeaders headers = new HttpHeaders();
		try {

			boolean checkIE = (userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("Trident") > -1);

			String downloadName = null;

			if (checkIE) {
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF8").replaceAll("\\+", "");
			} else {
				downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");
			}

			headers.add("Content-Disposition", "attachment; filename=" + downloadName);

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	@PostMapping("/deleteFile")
	@ResponseBody
	//파일이름과 종류를 파라미터로 받아서 파일의 종류에 따라 다르게 동작한다.
	//이미지의경우 섬네일이 존재하므로,원본이미지 파일도 같이 삭제한다
	//일반파일의 경우에는 파일만 삭제한다.
	public ResponseEntity<String> deleteFile(String fileName, String type) {

		log.info("deleteFile: " + fileName);

		File file;

		try {
			
			file = new File("d:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));

			file.delete();

			if (type.equals("image")) {

				String largeFileName = file.getAbsolutePath()
				                           .replace("s_", "");

				log.info("largeFileName: " + largeFileName);

				file = new File(largeFileName);

				file.delete();
			}

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}


}