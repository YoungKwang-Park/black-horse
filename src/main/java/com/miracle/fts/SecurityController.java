package com.miracle.fts;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class SecurityController {
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		System.out.println("access Denied : " + auth);
		model.addAttribute("msg", "접근 권한 거부");
	}
	
	@GetMapping("/login")
	public String loginInput(String error, String logout, HttpServletRequest request, Model model) {
		
		String uri = request.getHeader("Referer");
		if (!uri.contains("/login")) {
			request.getSession().setAttribute("prevPage", request.getHeader("Referer"));
		}
		
		System.out.println("error: " + error);
		System.out.println("logout: " + logout);
		
		if(error != null) {
			model.addAttribute("error", "로그인 에러, 계정정보 확인요망");
		}
		if(logout != null) {
			model.addAttribute("logout", "로그아웃 합니다");
		}
		return "/login/login";
	}

	@GetMapping("/logout")
	public String logoutGET() {
		System.out.println("GET: custom logout");
		return "/login/logout";
	}
	
	@PostMapping("/logout")
	public String logoutPOST() {
		System.out.println("POST: custom logout");
		return "/login/logout";
	}
	
}
