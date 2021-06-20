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

</head>
<script type="text/javascript">
$(document).ready(function(){

    var formObj = $("form[name='readForm']");
    // 수정 

    $(".update_btn").on("click", function(){

        formObj.attr("action", "q_updateView");

        formObj.attr("method", "get");

        formObj.submit();                

    })  

    // 삭제

    $(".delete_btn").on("click", function(){

        var deleteYN = confirm("삭제하시겠습니까?");

        if(deleteYN == true){          

        formObj.attr("action", "q_delete");

        formObj.attr("method", "post");

        formObj.submit();            

        }

    })

    // 목록

    $(".list_btn").on("click", function(){

        location.href = "qna?page=${scri.page}"

        +"&perPageNum=${scri.perPageNum}"

        +"&searchType=${scri.searchType}&keyword=${scri.keyword}";

    })

    // 댓글 작성
	$(document).ready(function(){
	
	    var formObj = $("form[name='answerForm']");
	    $(".answerWriteBtn").on("click", function(){
			
	        if(fn_valiChk()){
				return false;
			}
	        alert ("답변등록완료! 고마워요 ><");
	        formObj.attr("action", "q_answerWrite");
	        formObj.attr("method", "post");
	        formObj.submit();
	
	    	});
		})
		
		function fn_valiChk(){
		var regForm = $("form[name='answerForm'] .chk").length;
		for(var i = 0; i<regForm; i++){
			if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}	
    }

	 	 //댓글 수정 View
		$(".answerUpdateBtn").on("click", function(){
			location.href = "q_answerUpdateView?q_uid=${read.q_uid}"
							+ "&page=${scri.page}"
							+ "&perPageNum=${scri.perPageNum}"
							+ "&searchType=${scri.searchType}"
							+ "&keyword=${scri.keyword}"
							+ "&a_uid="+$(this).attr("data-a_uid");
		});
			
	//댓글 삭제 ok?

		$(".answerDeleteBtn").on("click", function(){
			var formObj = $("form[name=deleteForm]");
			var msg = confirm("댓글을 삭제합니다.");
			if(msg == true) {
				// this 의 data-a_uid 값을 읽어와서
				// formObj 의 a_uid value 로 세팅한뒤 submit 하기
			 var val = $(this).attr("data-a_uid");
				 formObj.find("[name='a_uid']").val(val);
				 formObj.attr("action", "q_deleteAnswer");
			     formObj.attr("method", "post");
			     formObj.submit(); 
			}
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

<div class="container">
	<div>
		<%@include file="nav.jsp"%>
	</div>
	<hr class="hr1"/>

	<section id="container">
		<form name="readForm" role="form" method="post">
			 <input type="hidden" id="q_uid" name="q_uid" value="${read.q_uid}" />
			 <input type="hidden" id="page" name="page" value="${scri.page}"> 
			 <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
			 <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}">
			 <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
			 <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
		</form>
		<div class="table_layout">
		<table class="r_table">
			<tbody>
				<tr>
					
						<th class="read_th">제목</th>
						<td class="read_td_1"> <input type="hidden" id="q_subject" name="q_subject" value="${read.q_subject}" readonly="readonly" />${read.q_subject}</td> 

						<th class="read_th">카테고리 </th>
						<td class="read_td"> <input type="hidden" id="q_category" name="q_category" class="form-control" value="${read.q_category}" readonly="readonly" />${read.q_category} </td>
				
				</tr>
				<tr>
						<th class="read_th">작성자 </th>
						<td class="read_td_1"> <input type="hidden" id="u_id" name="u_id" value="${read.u_id}"  readonly="readonly"/>${read.u_id} </td>
						<th class="read_th">작성일 </th>
						<td class="read_td"><fmt:formatDate value="${read.q_regdate}" pattern="yyyy-MM-dd hh:mm:ss" /></td>	
					
				</tr>	
			</tbody>
		</table>
		</div>
			<hr class="hr2">
			<div class="form-group">
				<label for="q_content" class="col-sm-2 control-label">질문</label>
				<textarea id="q_content" name="q_content" class="form-control-2" readonly="readonly"><c:out value="${read.q_content}" /></textarea>
			</div>
		
							
			<div class="read_btn">
		
				<button id="btn0" type="button" class="update_btn btn btn-warning">수정</button>
				
				<button id="btn0" type="button" class="delete_btn btn btn-danger">삭제</button>
			</div>
			
			
			
			<!-- 댓글 -->
			<div id="answer">
			<hr class="hr3"/>
				<ol class="answerList">
				
					<p style="font-size : 14px; font-weight : 600 ">답변</p>
					<c:forEach items="${answerList}" var="answerList">
						
						<div class="answer_c">
							<p style="font-size : 17px; font-weight : 600" >
							 ${answerList.u_id}<br />
							</p>
							  
							<p>${answerList.a_content}</p>
							<p id="answer_p">작성일 :  <fmt:formatDate value="${answerList.a_regdate}" pattern="yyyy-MM-dd hh:mm:ss"/></p>
							<div>
								<button id="btn0" type="button" class="answerUpdateBtn btn btn-warning" data-a_uid="${answerList.a_uid}">수정</button>
								<button id="btn0" type="submit" class="answerDeleteBtn btn btn-danger" data-a_uid="${answerList.a_uid}">삭제</button>
								<hr class="hr4"/>
							</div>		
						</div>
					
					</c:forEach>   
				</ol>
			</div>
					
			<form name="answerForm" method="post" class="form-horizontal">
				<input type="hidden" id="q_uid" name="q_uid" value="${read.q_uid}" />
				<input type="hidden" id="page" name="page" value="${scri.page}"> 
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
			
		
				<div class="form-group">
				
					<div class="answer_box_1">
					<label for="u_id"></label>
						<div class="answer_box"><input  class="answer_writer" type="text" id="u_id" name="u_id" value="<sec:authentication property="principal.username"/>" readonly="readonly"/>
					
						<textarea id="a_content" name="a_content" class="chk answer_box_2" title="내용을 입력하세요" placeholder="자갸 . . 예쁜말만 부탁해 . .ㅎ"></textarea>
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-offset-2_col-sm-10">
						<button id="btn01" type="button" class="answerWriteBtn btn btn-success">작성</button>
					</div>
					<hr/>
				</div>
			</form>
			
			<form name="deleteForm" role="form" method="post" action="q_deleteAnswer">
				<input type="hidden" name="q_uid" value="${read.q_uid}" readonly="readonly"/>
				<input type="hidden" id="a_uid" name="a_uid" value="${deleteAnswer.a_uid}" />
				<input type="hidden" id="page" name="page" value="${scri.page}"> 
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
					
			</form>
		</section>
		
	
		
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