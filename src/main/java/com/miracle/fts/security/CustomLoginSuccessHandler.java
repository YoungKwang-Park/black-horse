package com.miracle.fts.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Service;

@Service
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		System.out.println("AuthenticationSuccessHandler : 로그인 성공");
		
		// Authentication 객체를 이용해서 사용자가 가진 모든 권한들을 문자열로 체크가능
		List<String> roleNames = new ArrayList<>();
		authentication.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		
		System.out.println("ROLE NAMES : " + roleNames);
		
		RequestCache requestCache = new HttpSessionRequestCache();
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		String uri = "/";
		
		String prevPage = (String) request.getSession().getAttribute("prevPage");
		
		if (prevPage != null) {
			request.getSession().removeAttribute("prevPage");
		}
		
		if (savedRequest != null) {
			uri = savedRequest.getRedirectUrl();
		} else if (prevPage != null && !prevPage.equals("")) {
			uri = prevPage;
		}
		
//		if(roleNames.contains("ROLE_ADMIN")) {
//			uri = request.getContextPath() + "/admin";
//		}
		
		response.sendRedirect(uri);
		
		
		
		
//		// 만약 사용자가 ROLE_ADMIN 권한을 가졌다면 로그인 후 곧바로 /sample/admin 으로 이동
//		if(roleNames.contains("ROLE_ADMIN")) {
//			response.sendRedirect(request.getContextPath() + "/index");
//			return;
//		}
//		
//		// 만약 일반 회원 (ROLE_MEMBER) 라면 로그인 후 곧바로 /sample/member 로 이동
//		if(roleNames.contains("ROLE_MEMBER")) {
//			response.sendRedirect(request.getContextPath() + "/index");
//			return;
//		}
//
//		response.sendRedirect(request.getContextPath());
		
	}

}
