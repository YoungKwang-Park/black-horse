<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Store List</title>
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
<!-- Preloader Start -->
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
                            <h2>쟈기야 오늘은 뭐먹어?</h2>
                        </div>
                        <!--Hero form -->
                        <form role="form" method="get" action="./listmain" class="search-box search-box2">
                            <div class="input-form">
                                <input type="text" id="keywordInput" name="search" value="${scri.keyword}" placeholder="쟈기 오늘은 뭐먹을까?:)">
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
        <!--Hero End -->

<!-- listing Area Start -->
<div class="listing-area pt-120 pb-120">
    <div class="container">
            <!-- Right content -->
            <div class="col-xl-8 col-lg-8 col-md-6">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="count mb-35">
                            <span>${pageMaker.totalCount } 개의 리스트가 있어요!</span>
                        </div>
                    </div>
                </div>
                
                <!-- listing Details Stat-->
                <div class="listing-details-area">
                    <div class="container">
                        <div class="row">
           	                <c:choose>
			                <c:when test="${empty list || fn:length(list) == 0 }">
			                </c:when>
			                <c:otherwise>
			                <c:forEach var="dto" items="${list }">
                            <div class="col-lg-6 ">
                                <div class="single-listing mb-30">
                                    <div class="list-img">
                                        <img src="assets/img/gallery/pocha1.png" alt="">
                                        <!-- <span>Open</span> -->
                                    </div>
                                    <div class="list-caption">
                                        <span>영업중</span>
                                        <h3><a href="./storeView?suid=${dto.s_uid }">${dto.s_name }</a></h3>
                                        <p>${dto.s_addr }</p>
                                        <div class="list-footer">
										<ul>
											<li>${dto.s_comt }</li>
										</ul>
										<ul>
                                        	<li>영업시간 : ${dto.s_opinfo }</li>
                                        </ul> 
                                        <ul>
                                        	<li>대표메뉴 : ${dto.m_name }</li>
                                        </ul> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
			                </c:otherwise>
			                </c:choose>
                        </div>
                    </div>
                </div>
       
       <!-- 
         <div class="search row">
         <div class="col-xs-2 col-sm-2">
		    <select name="searchType" class="form-control">
		      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>가게이름</option>
		      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>메뉴이름</option>
		      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>가게+메뉴</option>
		    </select>
		</div>
        </div>
       
        <div class="col-xs-10 col-sm-10">
		<div class="input-group">
	    <input type="text" name="keyword" id="keywordInputa" value="${scri.keyword}" class="form-control"/>
		<span class="input-group-btn">
	    <button id="searchBtn" type="button" class="btn btn-default">검색</button>
		</span>
		</div>
		 -->
 		   
 		 
                <!-- listing Details End -->
                
                <!--Pagination Start  -->
                 <div  class="col-md-offset-3">
                      <ul class="pagination">
                        <c:if test="${pageMaker.prev }">
                        <li style="color=black;">
                            <a href='<c:url value="listmain${pageMaker.makeSearch(pageMaker.startPage-1) }"/>'>이전</a>
                        </li>
                        </c:if>
                        
                        <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                        <li>
                            <a href='<c:url value="listmain${pageMaker.makeSearch(idx) }"/>'>${idx }</a>
                        </li>
                        </c:forEach>
                        
                        <c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
                        <li <c:out value="${pageMaker.cri.page == pageNum ? 'class=info' : ''}" />>
                            <a href='<c:url value="listmain${pageMaker.makeSearch(pageMaker.endPage+1) }"/>'>다음</a>
                        </li>
                       </c:if>
                      </ul>
                    </div> 
                </form>
          
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