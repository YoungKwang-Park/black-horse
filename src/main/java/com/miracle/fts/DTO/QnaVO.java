package com.miracle.fts.DTO;

import java.util.Date;

public class QnaVO {
	
	private int q_uid;
	private String q_category;
	private String q_subject;
	private String q_content;
	private String u_id;
	private Date q_regdate;
	private int q_viewcnt;
	
	
	public int getQ_uid() {
		return q_uid;
	}
	public void setQ_uid(int q_uid) {
		this.q_uid = q_uid;
	}
	public String getQ_category() {
		return q_category;
	}
	public void setQ_category(String q_category) {
		this.q_category = q_category;
	}
	public String getQ_subject() {
		return q_subject;
	}
	public void setQ_subject(String q_subject) {
		this.q_subject = q_subject;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public Date getQ_regdate() {
		return q_regdate;
	}
	public void setQ_regdate(Date q_regdate) {
		this.q_regdate = q_regdate;
	}
	public int getQ_viewcnt() {
		return q_viewcnt;
	}
	public void setQ_viewcnt(int q_viewcnt) {
		this.q_viewcnt = q_viewcnt;
	}
	

	
	

	
	
	
	
}
