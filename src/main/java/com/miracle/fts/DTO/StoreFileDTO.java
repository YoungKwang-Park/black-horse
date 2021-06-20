package com.miracle.fts.DTO;

import java.time.LocalDateTime;

import lombok.Data;


@Data
public class StoreFileDTO {
	Integer f_uid;
	String f_name;		// 파일 원본 이름
	String f_sname;		// 파일 저장된 이름
	Integer s_uid;
	String f_url; 		//파일 저장 원본  url
	String f_thurl; 	// 파일 섬네일 저장 url
	LocalDateTime f_regdate;
	
	
}
