<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Favorite</title>
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
        <div class="hero-area3 hero-overly2 d-flex align-items-center ">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-8 col-lg-9">
                        <div class="hero-cap text-center pt-50 pb-20">
                            <h2>쟈기 이런거 좋아하는구나?</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Hero End -->

<!-- listing Area Start -->
<div class="listing-area pt-120 pb-120">
    <div class="container">
            <!-- Right content -->
            <div class="col-xl-8 col-lg-8 col-md-6">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="count mb-35">
                            <span>000 개의 리스트가 있어요!</span>
                        </div>
                    </div>
                </div>
                <!-- listing Details Stat-->
                <div class="listing-details-area">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6 ">
                                <div class="single-listing mb-30">
                                    <div class="list-img">
                                        <img src="assets/img/gallery/list1.png" alt="">
                                        <!-- <span>Open</span> -->
                                    </div>
                                    <div class="list-caption">
                                        <span>Open</span>
                                        <h3><a href="listing_details.html">Saintmartine</a></h3>
                                        <p>700/D, Kings road, Green lane, 85/ London</p>
                                        <div class="list-footer">
                                            <ul>
                                                <li>+10 278 367 9823</li>
                                                <li>contact@midnight.com</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 ">
                                <div class="single-listing mb-30">
                                    <div class="list-img">
                                        <img src="assets/img/gallery/list2.png" alt="">
                                        <!-- <span>Open</span> -->
                                    </div>
                                    <div class="list-caption">
                                        <span>Open</span>
                                         <h3><a href="listing_details.html">Saintmartine</a></h3>
                                        <p>700/D, Kings road, Green lane, 85/ London</p>
                                        <div class="list-footer">
                                            <ul>
                                                <li>+10 278 367 9823</li>
                                                <li>contact@midnight.com</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 ">
                                <div class="single-listing mb-30">
                                    <div class="list-img">
                                        <img src="assets/img/gallery/list3.png" alt="">
                                        <!-- <span>Open</span> -->
                                    </div>
                                    <div class="list-caption">
                                        <span>Open</span>
                                         <h3><a href="listing_details.html">Saintmartine</a></h3>
                                        <p>700/D, Kings road, Green lane, 85/ London</p>
                                        <div class="list-footer">
                                            <ul>
                                                <li>+10 278 367 9823</li>
                                                <li>contact@midnight.com</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 ">
                                <div class="single-listing mb-30">
                                    <div class="list-img">
                                        <img src="assets/img/gallery/list4.png" alt="">
                                        <!-- <span>Open</span> -->
                                    </div>
                                    <div class="list-caption">
                                        <span>Open</span>
                                         <h3><a href="listing_details.html">Saintmartine</a></h3>
                                        <p>700/D, Kings road, Green lane, 85/ London</p>
                                        <div class="list-footer">
                                            <ul>
                                                <li>+10 278 367 9823</li>
                                                <li>contact@midnight.com</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 ">
                                <div class="single-listing mb-30">
                                    <div class="list-img">
                                        <img src="assets/img/gallery/list5.png" alt="">
                                        <!-- <span>Open</span> -->
                                    </div>
                                    <div class="list-caption">
                                        <span>Open</span>
                                         <h3><a href="listing_details.html">Saintmartine</a></h3>
                                        <p>700/D, Kings road, Green lane, 85/ London</p>
                                        <div class="list-footer">
                                            <ul>
                                                <li>+10 278 367 9823</li>
                                                <li>contact@midnight.com</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 ">
                                <div class="single-listing mb-30">
                                    <div class="list-img">
                                        <img src="assets/img/gallery/list6.png" alt="">
                                        <!-- <span>Open</span> -->
                                    </div>
                                    <div class="list-caption">
                                        <span>Open</span>
                                         <h3><a href="listing_details.html">Saintmartine</a></h3>
                                        <p>700/D, Kings road, Green lane, 85/ London</p>
                                        <div class="list-footer">
                                            <ul>
                                                <li>+10 278 367 9823</li>
                                                <li>contact@midnight.com</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- listing Details End -->
                <!--Pagination Start  -->
                <div class="pagination-area pt-70 text-center">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="single-wrap d-flex justify-content-center">
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination justify-content-start">
                                            <li class="page-item active"><a class="page-link" href="#">01</a></li>
                                            <li class="page-item"><a class="page-link" href="#">02</a></li>
                                            <li class="page-item"><a class="page-link" href="#">03</a></li>
                                        <li class="page-item"><a class="page-link" href="#"><span class="ti-angle-right"></span></a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Pagination End  -->
        </div>
    </div>
</div>
<!-- listing-area Area End -->

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