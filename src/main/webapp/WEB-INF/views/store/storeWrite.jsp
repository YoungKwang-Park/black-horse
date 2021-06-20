<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Pocha</title>
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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/store.css">		
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyDCWiZsFceFXVQPtwtNU7pu7uEet1-FUGY" ></script>
		
			
<!-- 	<link rel="stylesheet" href="/bower_components/bootstrap/dist/css/bootstrap.min.css"> -->
	
<!--     Font Awesome -->
<!--     <link rel="stylesheet" href="/bower_components/font-awesome/css/font-awesome.min.css">     -->
<!--     Ionicons -->
<!--     <link rel="stylesheet" href="/bower_components/Ionicons/css/ionicons.min.css">     -->
<!--     iCheck -->
<!--     <link rel="stylesheet" href="/plugins/iCheck/square/blue.css">     -->
<%--     lightbox --%>
<!--     <link rel="stylesheet" href="/bower_components/lightbox/css/lightbox.css">     -->
<!--     Theme style -->
<!--     <link rel="stylesheet" href="/dist/css/AdminLTE.min.css">     -->
<%--     fileupload --%>
<!--     <link rel="stylesheet" media="screen" href="/bower_components/fileupload/css/jasny-bootstrap.min.css"> -->


	<style>
		th {background-color: tomato; font-size: 12px; text-align: left; width:20%;}
		#c_type {color: tomato; font-size: 12px; text-align: left;}
		table {width:80%;}
		#td {width:20%;}
		#td1 {width:40%;}
	</style>
	    


</head>




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
                     <h2>포차 등록</h2>
                 </div>
             </div>
         </div>
     </div>
 </div>
 <!--Hero End -->

<!-- Main Start -->


	<div id="wrap">

	<form role="form" id="frm" name="frm" action="storeWriteOk" method="post" enctype="multipart/form-data">	
		<input type="hidden" class="input" name="${_csrf.parameterName }" value="${_csrf.token }"/>
		<table>
			<tr>
				<th>포차 이름: </th>
				<td id="td1"><input type="text" id="sname" name="sname" value="${sname }" placeholder="20글자 제한" style="width:400px;"></input></td>
			</tr>
			<tr>
				<th>사업자 등록 번호: </th>
				<td id="td1"><input type="text" id="sbiznum" name="sbiznum" value="${sbiznum }" placeholder="000-00-00000" style="width:400px;"></input> </td>
			</tr>
			<tr>
				<th>포차 주소: </th>
				<td id="td1"><input type="text" id="saddr" name="saddr" value="${saddr }" placeholder="도로명 주소"style="width:400px;"/></td>
			</tr>
			<tr>
				<th>사장님의 한마디:</th>
				<td id="td1"><input type="text" id="scomt" name="scomt" value="${scomt }" placeholder="매출 100만원!!!"style="width:400px;"/></td>
			</tr>
			<tr>
				<th>영업 시간:</th>
				<td id="td1"><textarea id="sopinfo" name="sopinfo" value="${sopinfo }" rows="10" 
							placeholder="주중 10:00~22:00, 주말 13:00~20:00" style="resize: none;"style="width:400px;"></textarea></td>
				<td id="c_type">  </td>
			</tr>
			<tr>
				<th>위도:</th>
				<td id="td1"><input type="text" id="slat" name="slat" value="${slat }" placeholder="3x.xxxxxx"style="width:400px;"/></td>
			</tr>
			<tr>
				<th>경도:</th>
				<td id="td1"><input type="text" id="slng" name="slng" value="${slng }" placeholder="1xx.xxxxxx"style="width:400px;"/></td>
			</tr>
			<tr>
				<th>포차 메인 사진:</th>
<%-- 				<td id="td1"><input type="text" id="spic" name="spic" value="${spic }"/></td> --%>
				<td id="td1"><input type="file" name="file0" id="storeMain"></td>
			</tr>
	
		<tr>
			<th>메뉴 사진: <input type="button" id="addTh" value="추가"></th>
			<td id="td1">
				<div id="thArea">
					<div>
						<input type="file" name="file1" id="storeThn1">
						<input type="text" name="menu1" id="storeMenu1">
					</div>
				</div>
			</td>	
		</tr>
		
		</table>
		
				
		<br>
		<input type="submit" value="등록"/>
	</form>

	<hr>
		<div class="box-footer">
			<button type="button" onclick="location.href = 'storeList'"><i class="fa fa-list"></i>포차 목록</button>
			<button type="submit" class="btn-sm btn-success"><i class="fa fa-save"></i> 저장</button>
			<button type="reset" onclick="frm.reset()" class="btn-sm btn-warning"><i class="fa fa-reply"></i> 초기화</button>  <!-- reset 버튼 동작하도록 작업 필요 -->
		</div>

	</div>

<!-- <script id="fileTemplate" type="text/x-handlebars-template"> -->
<!--     <li> -->
<!--         <span class="mailbox-attachment-icon has-img"> -->
<!--             <img src="{{imgSrc}}" alt="Attachment"> -->
<!--         </span> -->
<!--         <div class="mailbox-attachment-info"> -->
<!--             <a href="{{originalFileUrl}}" class="mailbox-attachment-name"> -->
<!--                 <i class="fa fa-paperclip"></i> {{originalFileName}} -->
<!--             </a> -->
<!--             <a href="{{fullName}}" class="btn btn-default btn-xs pull-right delBtn"> -->
<!--                 <i class="fa fa-fw fa-remove"></i> -->
<!--             </a> -->
<!--         </div> -->
<!--     </li> -->
<!-- </script> -->
<!-- <script type="text/javascript" src="/resources/dist/js/article_file_upload.js"></script> -->
<%-- <script type="text/javascript" src="<c:url value='/resources/bower_components/jquery/dist/jquery.min.js'/>"></script> --%>


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

<script src="${pageContext.request.contextPath }/assets/js/wow.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/animated.headline.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/jquery.magnific-popup.js"></script>
<!-- Nice-select, sticky -->
<script src="${pageContext.request.contextPath }/assets/js/jquery.nice-select.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/jquery.sticky.js"></script>

<script src="${pageContext.request.contextPath }/assets/js/contact.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/jquery.form.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/mail-script.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/jquery.ajaxchimp.min.js"></script>

<script src="${pageContext.request.contextPath }/assets/js/plugins.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/main.js"></script>
 
<script>

    $(document).ready(function () {
    	var thN = 2;
    	$('input#addTh').on('click',function(event){
    		event.preventDefault();
    		var tpl = '<div>'                                                                     
    				+'<input type="file" name="file'+(thN++)+'"/>'                            
					+'<input type="text" name="menu'+(thN++)+'"  style="height:15px;"/>'                              
				    +'<input type="button" class="btn delBtn btn-group btn-group-sm" name="file'+(thN++)+'" value="삭제" />'
				    +'</div>';                                                                    
    		$('div#thArea').append(tpl);
    	})
//         // 게시글 저장 버튼 클릭 이벤트 처리
//         // 저장버튼 클릭시, article_file_upload.js의 filesSubmit()메소드 호출
//         // value에 업로드 파일명 추가. form태그 submit 처리
//         $("#writeForm").submit(function (event) {
//             event.preventDefault();
//             var that = $(this);
//             filesSubmit(that);
//         });

        // 파일 삭제 버튼 클릭 이벤트
        $(document).on("click", ".delBtn", function (event) {
            event.preventDefault();
            $(this).parent().remove();
        });

//         // 목록 버튼 클릭 이벤트 처리
//         $(".listBtn").on("click", function () {
//             self.location = "/article/paging/search/list?page=${searchCriteria.page}"
//                 + "&perPageNum=${searchCriteria.perPageNum}"
//                 + "&searchType=${searchCriteria.searchType}"
//                 + "&keyword=${searchCriteria.keyword}";
//         });

    });

</script>
</body>
</html>
