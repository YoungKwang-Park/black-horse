package com.miracle.fts.util;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

public class SessionScopeUtil {

	/**
	 * attribute 값을 가져 오기 위한 method
	 *
	 * @param String attribute key name
	 * @return Object attribute obj
	 */
	public static Object getAttribute(String name) {
		return (Object) RequestContextHolder.getRequestAttributes().getAttribute(name, RequestAttributes.SCOPE_SESSION);
	}

	/**
	 * attribute 설정 method
	 *
	 * @param String attribute key name
	 * @param Object attribute obj
	 * @return void
	 */
	public static void setAttribute(String name, Object object) {
		RequestContextHolder.getRequestAttributes().setAttribute(name, object, RequestAttributes.SCOPE_SESSION);
	}

	/**
	 * 설정한 attribute 삭제
	 *
	 * @param String attribute key name
	 * @return void
	 */
	public static void removeAttribute(String name) {
		RequestContextHolder.getRequestAttributes().removeAttribute(name, RequestAttributes.SCOPE_SESSION);
	}

	/**
	 * session id
	 *
	 * @param void
	 * @return String SessionId 값
	 */
	public static String getSessionId() {
		return RequestContextHolder.getRequestAttributes().getSessionId();
	}

	public static String getUserId() {
		//Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//UserDetails userDetails = (UserDetails) principal;
		//String username = userDetails.getUsername();
		//return username;
		return "admin1";
	}
}