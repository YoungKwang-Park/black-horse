package com.miracle.fts;

import java.io.FileInputStream;
import java.io.InputStream;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.miracle.fts.DTO.StoreFileDTO;
import com.miracle.fts.DTO.UploadFileUtils;
import com.miracle.fts.service.StoreFileService;

@RestController
@RequestMapping("/store/file")
public class StoreFileController {

	private StoreFileService storeFileService;

	@Inject
	public void setFileController(StoreFileService storeFileService) {
		this.storeFileService = storeFileService;
	}

	public StoreFileController() {
		System.out.println("StoreFileController() 생성");
	}
	@RequestMapping(value = "/display/img", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayImg(Integer fuid,String type, HttpServletRequest request) throws Exception {
		ResponseEntity<byte[]> entity = null;
		if(fuid == null)return entity;
		
		StoreFileDTO storeFile = storeFileService.getStoreFile(fuid);
		if(storeFile == null) return entity;
		HttpHeaders httpHeaders = UploadFileUtils.getHttpHeaders(storeFile.getF_name()); // Http 헤더 설정 가져오기
		String fileUrl = storeFile.getF_url();

		// 파일데이터, HttpHeader 전송
		try (InputStream inputStream = new FileInputStream(fileUrl)) {
			entity = new ResponseEntity<>(IOUtils.toByteArray(inputStream), httpHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}	
	
	// 
	// 게시글 파일 업로드
//	@RequestMapping(value = "/upload", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8") // 한글 전달용
//	public ResponseEntity<String> uploadFile(MultipartFile file, HttpServletRequest request) {
//		ResponseEntity<String> entity = null;
//		try {
//			String savedFilePath = UploadFileUtils.uploadFile(file, request);
//			entity = new ResponseEntity<>(savedFilePath, HttpStatus.CREATED);
//		} catch (Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
//		}
//		return entity;
//	}

//	 클라이언트로부터 전달받은 file과 request를 UploadFileUtils클래스의 uploadFile()메서드의 매개변수로 전달한다.
//	 uploadFile()메서드는 파일업로드 처리를 수행하고, “/년/월/일/UUID_파일명”의 문자열을 리턴한다.
//	 uploadFile()메서드로부터 리턴 받은 문자열을 호출한 클라이언트 화면으로 리턴한다.

	// 게시글 첨부파일 출력
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(String fname, HttpServletRequest request) throws Exception {

		HttpHeaders httpHeaders = UploadFileUtils.getHttpHeaders(fname); // Http 헤더 설정 가져오기
		String rootPath = UploadFileUtils.getRootPath(fname, request); // 업로드 기본경로 경로

		ResponseEntity<byte[]> entity = null;

		// 파일데이터, HttpHeader 전송
		try (InputStream inputStream = new FileInputStream(rootPath + fname)) {
			entity = new ResponseEntity<>(IOUtils.toByteArray(inputStream), httpHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

//	 클라이언트로부터 전달받은 첨부파일명(fname)과 request를 UploadFileUtils클래스의 getHttpHeaders()메서드의 매개변수로 전달한다.
//	 getHttpHeaders()메서드는 첨부파일명(fname)을 통해 파일타입을 판별하여 적절한 MINE타입을 지정하고, 클라이언트에게 전송할 HttpHeaders객체를 리턴한다.
//	 getHttpHeaders()메서드로부터 리턴받은 HttpHeaders객체와 첨부파일 데이터를 호출한 클라이언트 화면으로 리턴한다.

	// 게시글 파일 삭제 : 게시글 작성
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fname, HttpServletRequest request) {
		ResponseEntity<String> entity = null;

		try {
			UploadFileUtils.deleteFile(fname, request);
			entity = new ResponseEntity<>("DELETED", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

//	 클라이언트로부터 전달 받은 첨부파일명(fname)과 request를 UploadFileUtils클래스의 deleteFile()메서드의 매개변수로 전달.
//	 deleteFile()메서드는 첨부파일명을 MediaUtils클래스의 getMediaType()메서드의 매개변수로 전달하고, 이미지 타입 여부 판별.
//	 이미지 파일인 경우 원본 이미지 파일을 삭제 처리하고, 썸네일 파일도 삭제 처리
//	 일반 파일인 경우 파일을 삭제 처리

//	게시글 수정화면에서 첨부파일을 삭제할 경우, 게시글 입력페이지의 첨부파일 삭제와 다르게 
//	서버에 저장된 파일뿐만 아니라 테이블의 파일정보도 함께 삭제 처리 해야함. 
//	특정 게시글의 첨부파일들을 조회할 수 있도록 @PathVariable애너테이션을 통해 게시글 번호가져옴.

	// 게시글 첨부파일 삭제 : 게시글 수정
	@RequestMapping(value = "/delete/{suid}", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(@PathVariable("suid") Integer suid, String fname,
			HttpServletRequest request) {
		ResponseEntity<String> entity = null;

		try {
			UploadFileUtils.deleteFile(fname, request);
			//storeFileService.deleteFile(fname, suid);
			entity = new ResponseEntity<>("DELETED", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 게시글을 수정처리 시에 서버에 저장된 게시글의 기존 첨부파일들을 삭제처리하기 위한 매핑 메서드
	// 게시글 파일 전체 삭제
	@RequestMapping(value = "/deleteAll", method = RequestMethod.POST)
	public ResponseEntity<String> deleteAllFiles(@RequestParam("files[]") String[] files, HttpServletRequest request) {

		if (files == null || files.length == 0)
			return new ResponseEntity<>("DELETED", HttpStatus.OK);

		ResponseEntity<String> entity = null;

		try {
			for (String fname : files)
				UploadFileUtils.deleteFile(fname, request);
			entity = new ResponseEntity<>("DELETED", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

}
