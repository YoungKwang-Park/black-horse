<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Login</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

<!-- CSS here -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/slicknav.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/flaticon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/animate.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/magnific-popup.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/themify-icons.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/slick.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/nice-select.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/alter.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/login.css">

</head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 유효성 검사!!!! -->
<script type="text/javascript" >
function chkSubmit() {
	join = document.forms['join'];
	
	//아이디 입력여부 확인 
    if(join.id.value == ''){
    	alert("아이디를 입력해주세요");
    	document.join.id.focus();
    	return false;
    }
	for (var i = 0; i < document.join.id.value.length; i++){
		ch = document.join.id.value.charAt(i)
		if(!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') && !(ch >= 'A' && ch <= 'Z')) {
			alert("아이디는 영문 대소문자, 숫자만 입력가능합니다.")
			document.join.id.focus();
			document.join.id.select();
			return false;
		}
	}
	//아이디에 공백 사용하지 않기
	if (document.join.id.value.indexOf(" ") >= 0) {
            alert("아이디에 공백을 사용할 수 없습니다.")
            document.join.id.focus();
            document.join.id.select()
            return false;
        }
	// 아이디 길이 체크 (4~12자)
	
	  if (document.join.id.value.length<4 || document.join.id.value.length>12) {
            alert("아이디를 4~12자까지 입력해주세요.")
            document.join.id.focus();
            document.join.id.select();
            return false;
        }
	//비밀번호 입력여부 체크
    if(document.join.pw.value == ""){
    	 alert("패스워드를 입력해주세요");
    	 document.join.pw.focus();
    	 return false;
     }
	 
    if (join.pw.value == join.id.value) {
        alert("아이디와 비밀번호가 같습니다!!! 다르게 입력해주세요!")
        document.join.pw.focus();
        return false;
    }
	//비밀번호 길이 체크(4~12자 까지 허용)
    
	 if (document.join.pw.value.length < 4 || document.join.pw.value.length > 12) {
            alert("비밀번호를 4~12자까지 입력해주세요.")
            document.join.pw.focus();
            document.join.pw.select();
            return false;
        }
    
     //비밀번호와 비밀번호 확인이 맞지 않다면..
     if (document.join.pw.value != document.join.pw2.value) {
         alert("2개의 비밀번호가 일치하지 않습니다.");
         document.join.pw.value = "";
         document.join.pw2.value = "";
         document.join.pw2.focus();
    	 return false;
     }
     //이름
	if(document.join.name.value == ""){
		alert("이름은 반드시 입력해주세요");
		document.join.name.focus();
		return false;
	}
	  if(document.join.name.value.length < 2){
          alert("이름을 2자 이상 입력해주십시오.")
          document.join.name.focus();
          return false;
      }
	  
	  
	 if(document.join.addr.value == ''){
			alert("우편번호는 반드시 입력해주세요");
			document.join.addr.focus();
			return false;
	 }
	if(document.join.addr2.value == ''){
			alert("도로명주소를 입력시켜주세요");
			document.join.addr2.focus();
			return false;
	}
	if(document.join.addr3.value == ''){
			alert("상세주소를 입력시켜주세요");
			document.join.addr3.focus();
			return false;
	}
	  
	  
 
	if(document.join.pn2.value.length < 3){
		alert("앞자리 번호를 3자리 이상 입력해주세요");
		document.join.pn2.focus();
		return false;
	}
	if(document.join.pn3.value.length < 3){
		alert("뒤자리 번호를 3자리 이상 입력해주세요");
		document.join.pn3.focus();
		return false;
	}
	if(document.join.email.value == ''){
		alert("메일 등록해주세요");
		document.join.email.focus();
		return false;
	}
	//if(document.join.email2.value == 0){
		//alert("이메일을 확인해주세요");
		//document.join.email2.focus();
		//return false;
	//}
	
	var idChkVal = $("#idChk").val();
	if(idChkVal == "N"){
		alert("중복확인 버튼을 눌러주세요.");
		return false;
	}else if(idChkVal == "Y"){
		$("#regForm").submit();
	}

	//function fn_idChk(){
	//	$.ajax({
		//	url : "idChk",
		//	type : "post",
		//	dataType : "json",
		//	data : {"id" : $("#id").val()},
		//	success : function(data){
			//	if(data == 1){
				//	alert("중복된 아이디입니다.");
				//}else if(data == 0){
				//	$("#idChk").attr("value", "Y");
				//	alert("사용가능한 아이디입니다.");
			//	}
		//	}
		//})
	//}
	
	//return true;
}
</script>
<body>
<!-- Preloader Start -->
 <div id="preloader-active">
     <div class="preloader d-flex align-items-center justify-content-center">
         <div class="preloader-inner position-relative">
             <div class="preloader-circle"></div>
             <div class="preloader-img pere-text">
                 <img src="assets/img/logo/logoOne.jpg" alt="">
             </div>
         </div>
     </div>
 </div>
<!-- header Start -->
<%@include file="../nav/nav.jsp"  %>
<!-- header End -->
<main>

 <!-- Hero Start-->
 <div class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center ">
     <div class="container">
         <div class="row">
             <div class="col-xl-12">
                 <div class="hero-cap text-center pt-50">
                     <h2>회원가입</h2>
                 </div>
             </div>
         </div>
     </div>
 </div>
 <!--Hero End -->

<br><br><br><br><br>
<script type="text/javascript">

function email_change(){
    // alert("TEST");
    var email2 = document.getElementById("email2");
    var email_sel = document.getElementById("email_sel");
   // var email2 = document.join.email2.value();
    
    
    //var idx = email_sel.options.value;
//    var idx = email_sel.options.selectedIndex;
    var idx = email_sel.options.selectedIndex;
    // alert(idx);
    
    //if(email_sel.options[idx].value == ''){
    if(idx == 0){
//        email2.disabled = false;
        email2.disabled = false;
    } else {
    	email2.disabled = true;
    }
    
    
    // var val = email_sel.options[1].text;
    var val = email_sel.options[idx].value;
    // alert(val);
    
    email2.value = val;
}
</script>

<script type="text/javascript">


function fn_idChk(){
	var id = $("#id").val();
	var csrfName = $("#csrfName").val();
	var csrfValue = $("#csrfValue").val();
	var param = {"id" : id }
	
	console.log(csrfValue);
	console.log(csrfName);
	param[csrfName] = csrfValue;
	$.ajax({
		url : "idChk",
		type : "post",
		dataType : "json",
		data : param,
		success : function(data){
			if(data == 1){
				alert("중복된 아이디입니다.");
			}else if(data == 0){
				$("#idChk").attr("value", "Y");
				alert("사용가능한 아이디입니다.");
			};
		}
	});
};

/*
var idChkVal = $("#idChk").val();
if(idChkVal == "N"){
	alert("중복확인 버튼을 눌러주세요.");
}else if(idChkVal == "Y"){
	$("#regForm").submit();
};
*/

</script>
 

<script> 
function execPostCode() {
         new daum.Postcode({
             oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                console.log(data.zonecode);
                console.log(fullRoadAddr);
                
                
                $("[name=addr]").val(data.zonecode);
                $("[name=addr2]").val(fullRoadAddr);
                
                /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
                document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
            }
         }).open();
     }
</script>

<div class="signcontainer" style="width:40%; margin:auto;">
<h2>Miracle7 회원가입</h2>
<form name="join" action="writeOk" method="post" id="regForm" onsubmit="return chkSubmit()" >
가입구분 <br>
<input type="radio" name="auth" value="ROLE_MEMBER" checked/>일반회원
<input type="radio" name="auth" value="ROLE_CEO"/>상인회원
<br><br><br>
아이디 <br>
<input type="text" name="id" id="id" /> 영문 대소문자, 숫자만 사용가능! (4 ~ 12글자)

<button name="idChk" class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button><br><br>
비밀번호 <br>
<input type="password" name="pw" id="pw"/>아이디와 동일하면 안됩니다! (4 ~ 12 글자)<br><br>
비밀번호 확인<br>
<input type="password" name="pw2" id="pw2"/><br><br>
이름<br>
<input type="text" name="name" id="name"/>2글자 이상 입력주세요!<br><br>

주소<br>
<input class="form-control" style="width: 10%; display: inline;" placeholder="우편번호" name="addr" id="addr" type="text" readonly="readonly" />
    <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>  <br>                             
<input class="form-control" style="top: 5px; width: 20%;"   placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" /> <br>
<input class="form-control" placeholder="상세주소" name="addr3" id="addr3" type="text"  />
<br>

휴대폰번호<br>
<select name="pn" id="pn" style="width:60px" class="mgr8">
		<option value="010">010</option>
		<option value="011">011</option>
		<option value="016">016</option>
		<option value="017">017</option>
		<option value="018">018</option>
		<option value="019">019</option>
</select> -
	<input name="pn2" id="pn2" maxlength="4" type="text" pattern="[0-9]+" style="width:45px"/> -
	<input name="pn3" id="pn3" maxlength="4" type="text" pattern="[0-9]+" style="width:45px"/> 숫자만 입력해주세요!!^^
<br><br>

e-mail<br>
<input type="text" name="email" id="email">  @  <input type="text" name="email2" id="email2" >

<select  name="email2" id="email_sel" onchange="email_change()" class="enb" >
	<option value=''>직접입력</option>
    <option value='naver.com'>네이버</option>
    <option value='hanmail.net'>다음</option>
    <option value='gmail.com'>구글</option>
</select>



<br><br>
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
<input type="hidden" id="csrfName" name="csrfName" value="${_csrf.parameterName }"/>
<input type="hidden" id="csrfValue" name="csrfValue" value="${_csrf.token }"/>
<input type="submit" value="가입하기" />
</form>

</div>
<br><br><br><br><br>


</main>
<!-- footer Start -->
<%@include file="../nav/footer.jsp" %>
<!-- footer End -->
<!-- Scroll Up -->
<div id="back-top" >
    <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>

<!-- JS here -->
<!-- All JS Custom Plugins Link Here here -->
<script src="${pageContext.request.contextPath }/assets/js/vendor/modernizr-3.5.0.min.js"></script>

<!-- Jquery, Popper, Bootstrap -->
<script src="${pageContext.request.contextPath }/assets/js/vendor/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/bootstrap.min.js"></script>

<!-- Jquery Mobile Menu -->
<script src="${pageContext.request.contextPath }/assets/js/jquery.slicknav.min.js"></script>

<!-- Jquery Slick , Owl-Carousel Plugins -->
<script src="${pageContext.request.contextPath }/assets/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/slick.min.js"></script>

<!-- One Page, Animated-HeadLin -->
<script src="${pageContext.request.contextPath }/assets/js/wow.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/animated.headline.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/jquery.magnific-popup.js"></script>

<!-- Nice-select, sticky -->
<script src="${pageContext.request.contextPath }/assets/js/jquery.nice-select.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/jquery.sticky.js"></script>

<!-- contact js -->
<script src="${pageContext.request.contextPath }/assets/js/contact.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/jquery.form.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/mail-script.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/jquery.ajaxchimp.min.js"></script>

<!-- Jquery Plugins, main Jquery -->	
<script src="${pageContext.request.contextPath }/assets/js/plugins.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/main.js"></script>
</body>
</html>