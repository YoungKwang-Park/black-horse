<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- JSTL 버젼으로 바뀌니, import 의 번잡함도 사라진다!  JAVA 변수 선언도 사라진다! -->

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<style>
table {width: 100%;}
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body>
	<hr>
	<h2>회원 리스트</h2>
	<table>
		<tr>
			<th>ID</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>주소</th>
			<th>상세주소</th>
			<th>핸드폰</th>
			<th>e-mail</th>
		</tr>

		<c:choose>
		<c:when test="${empty list || fn:length(list) == 0 }">
		</c:when>
		<c:otherwise>
			<c:forEach var="dto" items="${list }">
				<tr>
					<td><a href="view.do?id=${dto.id }">${dto.id }</a></td>  <%-- dto.getUid() --%>
					<td>${dto.pw }</td>
					<td>${dto.name }</td>
					<td>${dto.addr } - ${dto.addr2 }, ${dto.addr3 }</td> 
					<td>${dto.phone } - ${dto.phone2 } - ${dto.phone3 }</td>
					<td>${dto.email }@${dto.email2 }</td> 
				</tr>			
			</c:forEach>
		</c:otherwise>
		</c:choose>

	</table>
	<br>
	<button onclick="location.href='write.do'">신규등록</button>
</body>
</html>




























