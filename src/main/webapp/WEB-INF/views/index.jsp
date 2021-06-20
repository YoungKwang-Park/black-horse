<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>FT-Seoul By Team Miracle7</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

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

</head>
<script>
  $(function(){
    $('#searchBtn').click(function() {
      self.location = "listmain" + '${pageMaker.makeQuery(1)}' + "&searchType=c" +
      "&keyword=" + encodeURIComponent($('#keywordInput').val());
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
<!-- header Start -->
<%@include file="./nav/nav.jsp"  %>
<!-- header End -->
    <main>

        <!-- Hero Area Start-->
        <div class="slider-area hero-overly">
            <div class="single-slider hero-overly  slider-height d-flex align-items-center">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-8 col-lg-9">
                            <!-- Hero Caption -->
                            <div class="hero__caption">
                                <h1>Discover Pocha</h1>
                            </div>
                            <!--Hero form -->
 							<!--Hero form -->
                       		 <form role="form" method="get" action="./listmain" class="search-box search-box2">
                            <div class="input-form">
                                <input type="text" id="keywordInput" name="search" value="${scri.keyword}" placeholder="오늘은 무얼 먹을까?:)">
                            </div>
                            <!-- Search box 
                            <div class="search-form" value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>-->
                   
                                <!-- <input type="submit" value="가즈앗"/> -->
                                <button id="searchBtn" type="button" class="butn btn-default">가즈앗</button>
                            <!-- </div> -->	
                        </form>	
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!--Hero Area End-->
        <!-- Popular Locations Start -->
		<div class="popular-location section-padding30">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <!-- Section Tittle -->
                        <div class="section-tittle text-center mb-80">
                            <span>가랏!</span>
                            <h2>오늘은 너로 정했돴!</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="single-location mb-30">
                            <div class="location-img">
                                <img src="assets/img/gallery/sik.png" alt="">
	                            <div class="location-details" style="left : 42%; block-size: 40%;">
	                                <a href="./listmain?searchType=c&keyword=메뉴1" class="location-btn">식</a>
	                            </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="single-location mb-30">
                            <div class="location-img">
                                <img src="assets/img/gallery/do.png" alt="">
	                            <div class="location-details" style="left : 42%; block-size: 40%;">
	                                <a href="./listmain?searchType=c&keyword=메뉴2" class="location-btn">도</a>
	                            </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="single-location mb-30">
                            <div class="location-img">
                                <img src="assets/img/gallery/rak.png" alt="">
	                            <div class="location-details" style="left : 42%; block-size: 40%;">	
	                                <a href="./listmain?searchType=c&keyword=메뉴3" class="location-btn">락</a>
	                            </div>
                            </div>
                        </div>
                    </div>
            	</div>
        	</div>
        		    <!-- More Btn -->
	                <div class="row justify-content-center">
	                    <div class="room-btn pt-20">
	                        <a href="./listmain" class="btn view-btn1">모든 포차 보기</a>
	                    </div>
	                </div>
		</div>
        <!-- Popular Locations End -->
 
    </main>
<!-- footer Start -->
<%@include file="./nav/footer.jsp" %>
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