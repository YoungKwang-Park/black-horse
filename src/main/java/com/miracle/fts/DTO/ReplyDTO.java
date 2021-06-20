package com.miracle.fts.DTO;

import java.util.Date;

public class ReplyDTO {

	private int s_uid;
	private int c_uid;
	private int c_point;
	private String c_content;
	private String u_id;
	private Date c_regdate;
	
	
	
	public int getS_uid() {
		return s_uid;
	}
	public void setS_uid(int s_uid) {
		this.s_uid = s_uid;
	}
	public int getC_uid() {
		return c_uid;
	}
	public void setC_uid(int c_uid) {
		this.c_uid = c_uid;
	}
	public int getC_point() {
		return c_point;
	}
	public void setC_point(int c_point) {
		this.c_point = c_point;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public Date getC_regdate() {
		return c_regdate;
	}
	public void setC_regdate(Date c_regdate) {
		this.c_regdate = c_regdate;
	}
	
	@Override
	public String toString() {
		return "ReplyDTO [s_uid=" + s_uid + ", c_uid=" + c_uid + ", c_point=" + c_point + ", c_content=" + c_content + ", u_id=" + u_id + ", c_regdate="
						+ c_regdate + "]";
	}

}

