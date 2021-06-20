<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Logout</title>
</head>


<body>
<h1> 정말 로그아웃 하시겠습니까? </h1>
<form action="${pageContext.request.contextPath}/logout" method='post'>
<input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>
<button>로그아웃</button>
</form>
</body>
</html>


