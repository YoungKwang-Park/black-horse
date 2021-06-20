package com.miracle.fts.DTO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StoreDTO {

	private Integer suid;
	private String sname; 
	private String sbiznum; 
	private String saddr; 
	private String scomt;
	private String sopinfo; 
	private Double slat; 
	private Double slng;
	private String spic;
	private String sthn;
	private String uid;
	private Integer sccnt;	// 댓글 갯수
	private String av;
	
	private String[] files;		// 첨부파일 이름 저장용
	private Integer fileCnt;	// 첨부파일 갯수
	
	private String spicString;
	
	public void setFiles(String[] files) {
		this.files = files;
		setFileCnt(files.length);
	}
	
	public static String[] getFiles;
	
	private void setFileCnt(Integer fileCnt) {
		this.fileCnt = fileCnt;
	}
	
}	// end StoreDTO()
	





