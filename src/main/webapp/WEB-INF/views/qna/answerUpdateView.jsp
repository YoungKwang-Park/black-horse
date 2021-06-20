<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>QnA</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

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



</head>
<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[name='updateForm']");
		
		$(".cancel_btn").on("click", function(){
			location.href = "q_readView?q_uid=${answerUpdate.q_uid}"
				   + "&page=${scri.page}"
				   + "&perPageNum=${scri.perPageNum}"
				   + "&searchType=${scri.searchType}"
				   + "&keyword=${scri.keyword}";
		});
	});
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
<!-- Preloader Start -->
<!-- header Start -->
<%@include file="../nav/nav.jsp"  %>
<!-- header End -->
<!-- main Start -->
<main>

 <!-- Hero Start-->
 <div class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center ">
     <div class="container">
         <div class="row">
             <div class="col-xl-12">
                 <div class="hero-cap text-center pt-50">
                     <h2>QnA 질문과 답변</h2>
                 </div>
             </div>
         </div>
     </div>
 </div>
 <!--Hero End -->


<br><br>
	
<div id="root">
<hr />
 
<div>
	<%@include file="nav.jsp" %>
</div>
<hr />
<section id="container">
<form name="readForm" role="form" method="post">
	<input type="hidden" id="q_uid" name="q_uid" value="${read.q_uid}" /> 
	<input type="hidden" id="page" name="page" value="${scri.page}"/> 
	<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"/> 
	<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"/>
	<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"/>
	
</form>
	<div class="form-group">
		<label for="q_category" class="col-sm-2 control-label">카테고리</label>
		<input type="text" id="q_category" name="q_category" class="form-control" value="${read.q_category}" readonly="readonly" />
	</div>
	
	<div class="form-group">
		<label for="q_subject" class="col-sm-2 control-label">제목</label>
		<input type="text" id="q_subject" name="q_subject" class="form-control" value="${read.q_subject}" readonly="readonly" />
	</div>
	<div class="form-group">
		<label for="q_content" class="col-sm-2 control-label">내용</label>
		<textarea id="q_content" name="q_content" class="form-control" readonly="readonly"><c:out value="${read.q_content}" /></textarea>
	</div>
	<div class="form-group">
		<label for="u_id" class="col-sm-2 control-label">작성자</label>
		<input type="text" id="u_id" name="u_id" class="form-control" value="${read.u_id}"  readonly="readonly"/>
	</div>
	<div class="form-group">
		<label for="q_regdate" class="col-sm-2 control-label">작성날짜</label>
		<fmt:formatDate value="${read.q_regdate}" pattern="yyyy-MM-dd" />	
	</div>


	<form name="answerForm" method="post" class="form-horizontal">

	</form>
</section>
<hr />
<section id="container">
	<form name="updateForm" role="form" method="post" action="q_answerUpdate">
		<input type="hidden" name="q_uid" value="${answerUpdate.q_uid}" readonly="readonly"/>
		<input type="hidden" id="a_uid" name="a_uid" value="${answerUpdate.a_uid}" />
		<input type="hidden" id="page" name="page" value="${scri.page}"> 
		<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
		<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
		<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/> 
		<table>
			<tbody>
				<tr>
					<td>
						<label for="a_content">댓글 내용</label><input type="text" id="a_content" name="a_content" value="${answerUpdate.a_content}"/>
					</td>
				</tr>	
				
			</tbody>			
		</table>
		<div>
			<button type="submit" class="update_btn">저장</button>
			<button type="button" class="cancel_btn">취소</button>
		</div>
	</form>
</section>
	<hr />
</div>

<br><br>

</main>
<!-- end main -->

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