package com.miracle.fts.DTO;

public class LoginDTO {
	private String id; // m_id
	private String pw; // m_pw
	private String name; // m_name
	private String addr; // m_addr
	private String addr2; // m_addr
	private String addr3; // u_addr3
	private String email; // m_email
	private String email2; // m_email
	private String pn; // m_pn
	private String pn2;
	private String pn3;
	private String auth;
	
	// 생성자
	public LoginDTO() {
		super();
//		System.out.println("WriteDTO() 객체 생성");
	}
	
	public LoginDTO(String id, String pw, String name, String addr, String addr2, String addr3, String pn, String email,
			String email2, String pn2, String pn3, String auth) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.addr = addr;
		this.addr2 = addr2;
		this.addr3 = addr3;
		this.email = email;
		this.email2 = email2;
		this.pn = pn;
		this.pn2 = pn2;
		this.pn3 = pn3;
		this.auth = auth;
	}

	// 웹개발시...
	// 가능한, 다음 3가지는 이름을 일치시켜주는게 좋습니다.
	// 클래스 필드명 = DB 필드명 = form의 name명

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPn() {
		return pn;
	}

	public void setPn(String pn) {
		this.pn = pn;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	
	
	public String getPn2() {
		return pn2;
	}

	public void setPn2(String pn2) {
		this.pn2 = pn2;
	}

	public String getPn3() {
		return pn3;
	}

	public void setPn3(String pn3) {
		this.pn3 = pn3;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	public String getAddr3() {
		return addr3;
	}

	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}

	@Override
	public String toString() {
		return String.format("LoginDTO] %s : %s : %s : %s : %s : %s : %s : %s : %s : %s : %s", 
				id, pw, name, addr, addr2, addr3, email, email2, pn, pn2, pn3);
	}
}
