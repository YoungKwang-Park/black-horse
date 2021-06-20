<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
	<c:when test="${empty list || fn:length(list) == 0 }">
		<script>
			alert("해당 정보가 삭제되거나 없습니다");
			history.back();
		</script>
	</c:when>
<c:otherwise>
	 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>읽기</title>
</head>
<!-- 
<script>

function chkDelete(uid){
	// 삭제 여부, 다시 확인 하고 진행하기
	var r = confirm("삭제하시겠습니까?");
	
	if(r){
		location.href = 'deleteOk.do?uid=' + uid;
	}
} // chkDelete

</script>
 -->
<body>	
	<h2>회원 보기 ${dto.id}</h2>
		<br>
		id : ${list[0].id }<br>
		비밀번호 : ${list[0].pw }<br>
		이름 : ${list[0].name }<br> 
		주소 : ${list[0].addr }-${list[0].addr2 },${list[0].addr3 }<br>
		핸드폰 번호 : ${list[0].phone } - ${list[0].phone2 } - ${list[0].phone3 }<br>
		email:      ${list[0].email }@${list[0].email2 } <br>
		<hr>
		<hr>
		<br>
		<button onclick="location.href='update.do?id=${list[0].id }'">수정하기</button>
		<button onclick="location.href='list.do'">목록보기</button>
		<button onclick="chkDelete(${list[0].id })">삭제하기</button>
		<button onclick="location.href='write.do'">신규등록</button>
</body>
</html>
				
	</c:otherwise>
</c:choose>

