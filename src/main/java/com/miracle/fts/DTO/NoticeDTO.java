package com.miracle.fts.DTO;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class NoticeDTO {
	private int uid;
	private String Subject;
	private String Content;
	private int viewcnt;
	private LocalDateTime regDate;
	private String id;

	// 생성자
	public NoticeDTO() {
		super();	
		//		system.out.println("NoticeDTO() 객체 생성");
	}

	public NoticeDTO(int uid, String id, String subject, String content, int viewcnt, LocalDateTime regdate) {
		this.uid = uid;
		this.id = id;
		this.Subject = subject;
		this.Content = content;
		this.viewcnt = viewcnt;
		this.regDate = regdate;
}
	
	public int getUid() {
//		System.out.println("getUid() 호출");
		return uid;
	}
	public void setUid(int uid) {
//		System.out.println("setUid(" + uid + ") 호출");
		this.uid = uid;
	}
	public String getSubject() {
//		System.out.println("getSubject() 호출");
		return Subject;
	}
	public void setSubject(String subject) {
//		System.out.println("setSubject(" + subject + ") 호출");
		Subject = subject;
	}
	public String getContent() {
//		System.out.println("getContent() 호출");		
		return Content;
	}
	public void setContent(String content) {
//		System.out.println("setContent(" + content + ") 호출");		
		Content = content;
	}
	public int getViewcnt() {
//		System.out.println("getViewCnt() 호출");
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
//		System.out.println("setViewCnt(" + viewCnt + ") 호출");
		this.viewcnt = viewcnt;
	}
	public LocalDateTime getRegdate() {
//		System.out.println("getRegDate() 호출");
		return regDate;
	}
	public void setRegdate(LocalDateTime regdate) {
//		System.out.println("setRegDate(" + regDate + ") 호출");
		this.regDate = regdate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
//	regDate를 String으로 리턴하는 getter
	public String getRegDateTime() {
		if(this.regDate == null) return "";
		return this.regDate.format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일"));
	}
	
	@Override
	public String toString() {
		return String.format("NoticeDTO] %d: %s : %s : %s : %d : %s",
				uid, id, Subject, Content, viewcnt, regDate);
	}
	
}	// end DTO
