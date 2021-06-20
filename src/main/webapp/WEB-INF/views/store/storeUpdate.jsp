<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
  
<c:choose>
	<c:when test="${empty list || fn:length(list) == 0 }">
		<script>
			alert("가게 정보가 불충분합니다.");
			history.back();
		</script>
	</c:when>	
	<c:otherwise>
	    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>정보 수정: ${list[0].sname }</title> 	
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
		
			
	<%-- 테스트 용으로 넣어둔 것  --%>
	<link rel="stylesheet" href="/bower_components/bootstrap/dist/css/bootstrap.min.css">
	
	<!-- Font Awesome -->
	<link rel="stylesheet" href="/bower_components/font-awesome/css/font-awesome.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="/bower_components/Ionicons/css/ionicons.min.css">
	<!-- iCheck -->
	<link rel="stylesheet" href="/plugins/iCheck/square/blue.css">
	<%--lightbox--%>
	<link rel="stylesheet" href="/bower_components/lightbox/css/lightbox.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="/dist/css/AdminLTE.min.css">
	<!-- AdminLTE Skins -->
	<link rel="stylesheet" href="/dist/css/skins/skin-blue.min.css">
	<%--fileupload--%>
	<link rel="stylesheet" media="screen" href="/bower_components/fileupload/css/jasny-bootstrap.min.css">
    
    
				
	<style>
		th {background-color: tomato; font-size: 12px; text-align: left; width:20%;}
		#c_type {color: tomato; font-size: 12px; text-align: left;}
		table {width:80%;}
		#td {width:20%;}
		#td1 {width:40%;}
	</style>
			
			
				
				
	</head>
			
			
			
			
			
	<script>
		function chkSubmit(){
			frm = document.forms["frm"];
			
			var sname = frm["sname"].value.trim();
		    if (sname == "") {
		        alert("포차 이름은 반드시 작성해야 합니다");
		        frm["sname"].focus();
		        return false;
		    }
			var sbiznum = frm["sbiznum"].value.trim();
		    if (sbiznum == "") {
		        alert("사업자 등록번호는 반드시 입력해야 합니다");
			        frm["sbiznum"].focus();
		        return false;
		    }
			var saddr = frm["saddr"].value.trim();
		    if (saddr == "") {
		        alert("주소를 입력 해주시기 바랍니다");
		        frm["saddr"].focus();
		        return false;
		    }
			var scomt = frm["scomt"].value.trim();
		    if (scomt == "") {
		        alert("사장님의 한마디를 작성해주시기 바랍니다");
		        frm["scomt"].focus();
		        return false;
		    }
			var sopinfo = frm["sopinfo"].value.trim();
		    if (sopinfo == "") {
		        alert("영업 시간을 입력 해주시기 바랍니다");
		        frm["sopinfo"].focus();
		        return false;
		    }
			var slat = frm["slat"].value.trim();
		    if (slat == "") {
		        alert("포차의 위도가 어떻게 되나요?");
		        frm["slat"].focus();
		        return false;
		    }
			var slng = frm["slng"].value.trim();
		    if (slng == "") {
		        alert("포차의 경도가 어떻게 되나요?");
		        frm["slng"].focus();
		        return false;
		    }
			var spic = frm["spic"].value.trim();
		    if (spic == "") {
		        alert("포차의 메인 사진을 업로드 해주시기 바랍니다");
		        frm["spic"].focus();
		        return false;
		    }
			var sthn = frm["sthn"].value.trim();
		    if (sthn == "") {
		        alert("메뉴 사진을 업로드 해주시기 바랍니다");
		        frm["sthn"].focus();
		        return false;
		    }
		    
		    return true;
		} // end chkSubmit()
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
	<!-- Preloader End -->

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
                     <h2>About Miracle7</h2>
                 </div>
             </div>
         </div>
     </div>
 </div>
 <!--Hero End -->

<!-- Main Start -->

	
	
	
	
	
		<h2>포차 정보 수정</h2>
		<form id="modifyForm" name="frm" action="storeUpdateOk" method="post" onsubmit="return chkSubmit()">
			<input type="hidden" name="suid" value="${list[0].suid }"/>
			<table>
				<tr>
					<th>포차 이름: </th>
					<td id="td1"><input type="text" name="sname" value="${list[0].sname }" placeholder="20글자 제한"></input></td>
					<td id="c_type"> ★ 20글자까지</td>
				</tr>
				<tr>
					<th>사업자 등록 번호: </th>
					<td id="td1"><input type="text" name="sbiznum" value="${list[0].sbiznum }" placeholder="000-00-00000"></input> </td>
					<td id="c_type"> ★ xxx-xx-xxxxx </td>
				</tr>
				<tr>
					<th>포차 주소: </th>
					<td id="td1"><input type="text" name="saddr" value="${list[0].saddr }" placeholder="도로명 주소"/></td>
				</tr>
				<tr>
					<th>사장님의 한마디:</th>
					<td id="td1"><input type="text" name="scomt" value="${list[0].scomt }" placeholder="매출 100만원!!!"/></td>
				</tr>
				<tr>
					<th>영업 시간:</th>
					<td id="td1"><textarea name="sopinfo" rows="10" 
									placeholder="월 10:00~22:00     화 12:00~22:00      수~금 10:00~22:00         주말 13:00~20:00" 
									style="resize: none;">${list[0].sopinfo }</textarea></td>
					<td id="c_type" style="vertical-align:text-bottom;"> ★ (예시)<br>월 10:00~22:00<br>화 12:00~22:00<br>수~금 10:00~22:00<br>주말 13:00~20:00 </td>
				</tr>
				<tr>
					<th>위도:</th>
					<td id="td1"><input type="text" name="slat" value="${list[0].slat }" placeholder="3x.xxxxxx"/></td>
				</tr>
				<tr>
					<th>경도:</th>
					<td id="td1"><input type="text" name="slng" value="${list[0].slng }" placeholder="1xx.xxxxxx"/></td>
				</tr>
				<tr>
					<th>포차 메인 사진:</th>
					<td id="td1"><input type="file" name="file0" id="storeMain"></td>
				</tr>
				<tr>
					<th>썸네일용 사진:</th>
					<td id="td1"><input type="text" name="file1" value="${list[0].sthn }"/></td>
				</tr>
				<tr>
					<th>포차 파일 업로드: </th>
					<td id="td1">
						<input type="file" name="file1" id="storeThn1">
						<input type="text" name="menu1" id="storeMenu1">	
					</td>		
				</tr>
				
				
			</table>
			
			<!-- 왜 ul을 여기서 넣는거지..? 이해 못하고 걍 넣네;ㅅ;)... -->
			<div class="box-footer">
	             <ul class="mailbox-attachments clearfix uploadedFileList"></ul>
	        </div>
				
			<br>	 
			<button type="submit" class="btn btn-success modBtn"><i class="fa fa-save"></i> 수정 저장</button>
		</form>
		<hr>
		
		<button onclick="history.go(-1);" class="btn btn-warning cancelBtn"><i class="fa fa-trash"></i> 취소</button>
		<button onclick="location.href='storeList'" class="btn btn-success listBtn"><i class="fa fa-list"></i>소유 포차 목록</button>
		<br>
		
			
		
		
<script id="fileTemplate" type="text/x-handlebars-template">
    <li>
        <span class="mailbox-attachment-icon has-img">
            <img src="{{imgSrc}}" alt="Attachment">
        </span>
        <div class="mailbox-attachment-info">
            <a href="{{originalFileUrl}}" class="mailbox-attachment-name">
                <i class="fa fa-paperclip"></i> {{originalFileName}}
            </a>
            <a href="{{fullName}}" class="btn btn-default btn-xs pull-right delBtn">
                <i class="fa fa-fw fa-remove"></i>
            </a>
        </div>
    </li>
</script>
<script type="text/javascript" src="/resources/dist/js/article_file_upload.js"></script>
<script>
    $(document).ready(function () {

        // 전역 변수 선언
        var suid = "${dto.suid}"; // 현재 게시글 번호

        // 파일 삭제 버튼 클릭 이벤트
        $(document).on("click", ".delBtn", function (event) {
            event.preventDefault();
            if (confirm("삭제하시겠습니까? 삭제된 파일은 복구할 수 없습니다.")) {
                var that = $(this);
                deleteFileModPage(that, suid);
            }
        });

        getFiles(suid);

        // 수정 처리시 파일 정보도 함께 처리
        $("#modifyForm").submit(function (event) {
            event.preventDefault();
            var that = $(this);
            filesSubmit(that);
        });

        /*================================================게시판 페이지 이동관련===========================================*/

        var formObj = $("form[role='form']");
        console.log(formObj);

        $(".modBtn").on("click", function () {
            formObj.submit();
        });

        $(".cancelBtn").on("click", function () {
            self.location = "/store/paging/search/read?page=${searchCriteria.page}"
                + "&perPageNum=${searchCriteria.perPageNum}"
                + "&searchType=${searchCriteria.searchType}"
                + "&keyword=${searchCriteria.keyword}"
                + "&suid=${dto.suid}";
        });

        $(".listBtn").on("click", function () {
            self.location = "/store/paging/search/list?page=${searchCriteria.page}"
                + "&perPageNum=${searchCriteria.perPageNum}"
                + "&searchType=${searchCriteria.searchType}"
                + "&keyword=${searchCriteria.keyword}";
        });

    });
</script>		
		
		
		
		
		



<!-- Main End -->

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


</c:otherwise>
</c:choose>























