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
public class DocumentUploadController {

	// uploadForm.jsp까지 잘 가는지 확인하는 코드
	@GetMapping("/uploadForm")
	public void uploadForm() {

		log.info("upload form");
	}

	// 실제로 파일 처리를 하는 코드 form 버전(경로를 통해서 파일이 들어간 것을 확인할 수 있다.)
	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {

		String uploadFolder = "C:\\project\\starworks\\StarWorks\\upload";

		for (MultipartFile multipartFile : uploadFile) {

			log.info("-------------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());

			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
													
			try {
				multipartFile.transferTo(saveFile);	
			} catch (Exception e) {
				log.error(e.getMessage());
			} // end catch
		} // end for

	}

	// uploadAjax.jsp까지 잘 가는지 확인하는 코드
	@GetMapping("/uploadAjax")
	public void uploadAjax() {

		log.info("upload ajax");
	}

	// 파일 업로드 시, 오늘 날짜에 대한 폴더를 생성하는 코드
	private String getFolder() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");	

		Date date = new Date();	

		String str = sdf.format(date);	

		return str.replace("-", File.separator);	
	}

	// 썸네일 코드(이미지 파일인지 체크하는 용도의 코드)
	private boolean checkImageType(File file) {

		try {
			String contentType = Files.probeContentType(file.toPath());

			return contentType.startsWith("image");		

		} catch (IOException e) {
			e.printStackTrace();
		}

		return false;
	}

	// 실제로 파일 처리를 하는 코드 ajax 버전(파일 생성 추가 및 고유한 파일명 UUID 적용 및 이미지 썸네일 생성 파일 생성 및 업로드한 정보를 브라우저에 json으로 전달)
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)		// produces는 ajax에서 데이터 타입을 json으로 지정했기 때문이다.
	@ResponseBody		
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {

		List<AttachFileDTO> list = new ArrayList<>();
		String uploadFolder = "C:\\project\\starworks\\StarWorks\\upload";

		String uploadFolderPath = getFolder();
		// make folder --------
		File uploadPath = new File(uploadFolder, uploadFolderPath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		// make yyyy/MM/dd folder

		for (MultipartFile multipartFile : uploadFile) {

			AttachFileDTO attachDTO = new AttachFileDTO();	

			String uploadFileName = multipartFile.getOriginalFilename();

			// IE has file path(익스플러어 코드)
//			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name: " + uploadFileName);
			attachDTO.setFileName(uploadFileName);		

			UUID uuid = UUID.randomUUID();

			uploadFileName = uuid.toString() + "_" + uploadFileName;

			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);

				attachDTO.setUuid(uuid.toString());	
				attachDTO.setUploadPath(uploadFolderPath);	

				// check image type file
				if (checkImageType(saveFile)) {

					attachDTO.setImage(true);		

					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));

					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);

					thumbnail.close();
				}

				// add to List
				list.add(attachDTO);		

			} catch (Exception e) {
				e.printStackTrace();
			}

		} // end for
		return new ResponseEntity<>(list, HttpStatus.OK);
	}

	// 이미지 파일의 썸네일 파일을 보여주기 위한 코드
	@GetMapping("/display")		
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {

		log.info("fileName: " + fileName);

		File file = new File("C:\\project\\starworks\\StarWorks\\upload\\" + fileName);

		log.info("file: " + file);

		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();

			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {							
			e.printStackTrace();
		}
		return result;
	}

	// 실질적으로 첨부파일 다운로드를 위한 코드(UUID가 없이 순수한 파일로 저장될 수 있게 한다.)
	 @GetMapping(value="/download" ,
	 produces=MediaType.APPLICATION_OCTET_STREAM_VALUE)
	 @ResponseBody
	 public ResponseEntity<Resource>
	 downloadFile(@RequestHeader("User-Agent")String userAgent, String fileName){
	
	 Resource resource = new FileSystemResource("C:\\project\\starworks\\StarWorks\\upload\\" + fileName);
	
	 if(resource.exists() == false) {
	 return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	 }
	
	 String resourceName = resource.getFilename();
	
	 //remove UUID
	 String resourceOriginalName =
	 resourceName.substring(resourceName.indexOf("_")+1);		
	
	 HttpHeaders headers = new HttpHeaders();
	 try {
	
	 boolean checkIE = (userAgent.indexOf("MSIE") > -1 ||
	 userAgent.indexOf("Trident") > -1);
	
	 String downloadName = null;
	
	 if(checkIE) {
	 downloadName = URLEncoder.encode(resourceOriginalName,
	 "UTF8").replaceAll("\\+", " ");
	 }else {
	 downloadName = new
	 String(resourceOriginalName.getBytes("UTF-8"),"ISO-8859-1");
	 }
	
	 headers.add("Content-Disposition", "attachment; filename="+downloadName);
	
	 } catch (UnsupportedEncodingException e) {
	 e.printStackTrace();
	 }
	
	 return new ResponseEntity<Resource>(resource, headers,HttpStatus.OK);
	 }

	 // 일반 파일과 이미지 파일(썸네일 파일 포함)을 삭제하기 위한 처리
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {

		log.info("deleteFile: " + fileName);

		File file;

		try {
			file = new File("C:\\project\\starworks\\StarWorks\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));

			file.delete();	

			if (type.equals("image")) {		

				String largeFileName = file.getAbsolutePath().replace("s_", "");

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
