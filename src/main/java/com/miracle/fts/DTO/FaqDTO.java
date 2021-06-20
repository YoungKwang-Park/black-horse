package com.miracle.fts.DTO;

public class FaqDTO {
	private int uid;	// f_uid
	private String Subject;		// f_subject
	private String Content;		// f_content	
	private int viewcnt;	// f_viewcnt
	private String id;

	public String getId() {
		return id;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getSubject() {
		return Subject;
	}

	public void setSubject(String subject) {
		Subject = subject;
	}

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public void setId(String id) {
		this.id = id;
	}

	// 생성자
	public FaqDTO() {
		super();
	//	system.out.println("FAQDTO() 객체 생성");
	}

	public FaqDTO(int uid, String subject, String content, String id,
			int viewcnt) {
		this.uid = uid;
		this.id = id;
		this.Subject = subject;
		this.Content = content;
		this.viewcnt = viewcnt;
}
}
