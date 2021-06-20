<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>About Miracle 7</title>
<!--  구글 지도 API -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyDCWiZsFceFXVQPtwtNU7pu7uEet1-FUGY" ></script>

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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/map.css">

</head>


	
		<script type="text/javascript"> 
		$(document).ready(function() {
			var myLatlng = new google.maps.LatLng(37.49943040584343, 127.03587871044718); // 위치값 위도 경도
			var Y_point = 37.49943040584343;// Y 좌표
			var X_point = 127.03587871044718; // X 좌표
			var zoomLevel = 14; // 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
			var markerTitle = "서울 강남구 테헤란로26길 12"; // 현재 위치 마커에 마우스를 오버을때 나타나는 정보 
			var markerMaxWidth = 300; // 마커를 클릭했을때 나타나는 말풍선의 최대 크기 
			// 말풍선 내용
			var contentString = '<div>' +
			'<h2>Miracle7</h2>'+
			'<p>안녕하세요. Miracle7입니다.</p>' + '<p>서울 강남구 테헤란로26길 12</p>'
			'</div>';
			var myLatlng = new google.maps.LatLng(Y_point, X_point);
			var mapOptions = {
					zoom: zoomLevel,
					center: myLatlng,
					mapTypeId: google.maps.MapTypeId.ROADMAP
					}
			var map = new google.maps.Map(document.getElementById('map_ma'), mapOptions);
			var marker = new google.maps.Marker({
				position: myLatlng, 
				map: map, 
				title: markerTitle 
				}); 
			var infowindow = new google.maps.InfoWindow( 
					{
						content: contentString,
						maxWizzzdth: markerMaxWidth 
						} 
					);
			google.maps.event.addListener(marker, 'click', function() { 
				infowindow.open(map, marker);
				}); 
			}); 
		
		
		</script>

<body style="background: linen;">
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
<%@include file="./nav/nav.jsp"  %>
<!-- header End -->


<main>

 <!-- Hero Start-->
 <div class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center ">
     <div class="container">
         <div class="row">
             <div class="col-xl-12">
                 <div class="hero-cap text-center pt-50">
                 <h2 class="굴림" style="color: linen;">찾아오시는 길</h2>
                 </div>
             </div>
         </div>
     </div>
 </div>
 <!--Hero End -->
<br><br><br><br><br>
<form style="text-align: center;">
<h2>주소</h2>
<h4 style="color: #a05a11; font-size: 30px;">서울 강남구 테헤란로26길 12</h4>
</form>
<div id="map_ma" class="map_1" >
</div>
<form style="text-align: center;"> 
<h3>Location</h3>
<h3>역삼역 3번출구 에서 도보 3분</h3>
<h3>tel. 010-7889-8745 fax.02-338-4609</h3>
</form>
 <br><br><br><br><br>

 


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