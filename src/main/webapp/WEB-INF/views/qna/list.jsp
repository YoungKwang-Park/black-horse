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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/qnaCss.css">

<script>
  $(function(){
    $('#searchBtn').click(function() {
      self.location = "qna" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() +
      "&keyword=" + encodeURIComponent($('#keywordInput').val());
    });
  });   
</script>

<style type="text/css">
	li {list-style: none; padding: 6px;}
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
	<div>
	    <%@include file="nav.jsp" %>
	</div>
    <hr style="margin-top:10px;"/>
    <section id="container">
        <form role="form" method="get">
            <table class="table table-hover">
                <tr><th class="jb-th-2">번호</th><th class="jb-th-2">카테고리</th><th class="jb-th-1">제목</th><th class="jb-th-2">작성자</th><th class="jb-th-3">조회수</th><th class="jb-th-2">등록일</th></tr>
              
              <!-- qnaController에서 이름을 list로 정한 service.list()를 가져온것 -->
                <c:forEach items="${list}" var = "list">
                    <tr>
                        <td><c:out value="${list.q_uid}" /></td>
                          <td><c:out value="${list.q_category}" /></td>
                        <td>
                            <a href="q_readView?q_uid=${list.q_uid}&
                            page=${scri.page}&
                            perPageNum=${scri.perPageNum}&
                            searchType=${scri.searchType}&
                            keyword=${scri.keyword}">
                            <c:out value="${list.q_subject}" /></a></td>
                        <td><c:out value="${list.u_id}" /></td>
                          <td><c:out value="${list.q_viewcnt}" /></td>
                        <td><fmt:formatDate value="${list.q_regdate}" pattern="yyyy-MM-dd"/></td>
                    </tr>
                </c:forEach>
              </table>
     <div class="search row" id="srow">
		
		
		<div class="input-group">
			<div class="input-group_1">
		    <select name="searchType" class="form-control">
		      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
		      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
		      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
		      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
		      <option value="g"<c:out value="${scri.searchType eq 'g' ? 'selected' : ''}"/>>카테고리</option>
		    </select>
		    </div>
		    
		    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control"/>
		    
			<span class="input-group-btn">
		    <button id="searchBtn" type="button" class="btn btn-default">검색</button>
			</span>
		</div>
 		
  	</div>
  	<!-- 페이징 with 검색 --> 
                    <div  class="col-md-offset-3" id=paging>
                      <ul class="pagination">
                        <c:if test="${pageMaker.prev }">
                        <li>
                            <a href='<c:url value="qna${pageMaker.makeSearch(pageMaker.startPage-1) }"/>'>이전</a>
                        </li>
                        </c:if>
                        
                        <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                        <li>
                            <a href='<c:url value="qna${pageMaker.makeSearch(idx) }"/>'>${idx }</a>
                        </li>
                        </c:forEach>
                        
                        <c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
                        <li <c:out value="${pageMaker.cri.page == pageNum ? 'class=info' : ''}" />>
                            <a href='<c:url value="qna${pageMaker.makeSearch(pageMaker.endPage+1) }"/>'>다음</a>
                        </li>
                       </c:if>
                      </ul>
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