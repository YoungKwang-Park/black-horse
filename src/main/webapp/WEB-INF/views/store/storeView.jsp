<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- <c:set var="path" value="${pageContext.request.contextPath}"/> --%>


<c:choose>
	<c:when test="${empty list || fn:length(list) == 0 }">
		<script>
			alert("해당 가게 정보를 찾을 수 없습니다.");
			history.back();
		</script>
	</c:when>	
<c:otherwise>	
	
		
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
	
	<style>
		table {
			width: 80%;
			text-align: left;
		}
		table, td {
			border: 1px solid black;
			border-collapse: collapse;
		}
		td {padding: 5px 10px}
		#left {width: 30%; background-color: AntiqueWhite;}
		#right {width: 50%;}
	</style>
	<style type="text/css">
		li {list-style: none; float: left; padding: 6px;}
	</style>
	
	</head>
	
	
	
	<script type="text/javascript">
	//가게정보 삭제
	function chkDelete(suid){
		var r = confirm("등록된 가게 정보를 삭제하시겠습니까?");
		
		if(r){
			var r1 = confirm("등록된 가게 정보를 정말 삭제하시겠습니까?");
			if(r1){
				location.href = 'storeDeleteOk?suid=' + suid;
			}
		}
	} // chkDelete
	
	
	$(document).ready(function(){
				
		//댓글 작성	
		    var formObj = $("form[name='replyForm']");
		    $(".replyWriteBtn").on("click", function(){
		      
		        alert ("댓글등록완료!");
		        formObj.attr("action", "replyWrite");
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
		
		$(".replyDeleteBtn").on("click", function(){
			var formObj = $("form[name=deleteForm]");
			var msg = confirm("댓글을 삭제합니다.");
			if(msg == true) {
				// this 의 data-a_uid 값을 읽어와서
				// formObj 의 a_uid value 로 세팅한뒤 submit 하기
			 	var val = $(this).attr("data-c_uid");
				 formObj.find("[name='c_uid']").val(val);
				 formObj.attr("action", "replyDelete");
			     formObj.attr("method", "post");
			     formObj.submit(); 
			}
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
                     <h2>${list[0].sname }</h2>
                 </div>
             </div>
         </div>
     </div>
 </div>
 <!--Hero End -->

<!-- Main Start -->



	<div id="wrap">
		<div id="box body-store">		
			<div id="box body-head"> <!-- //TODO  -->
				<div><h3> ${list[0].sname }</h3></div>  <div>(${list[0].av}점, 총 ${list[0].sccnt}개의 후기)</div>
				<i class="fas fa-map-marker-alt"> ${list[0].saddr }</i>  
				<div class="box pull-right">
					즐겨찾기: <img src="assets/img/store/store_fav0.jpg" alt="imgFav" width="15" height="15" onclick="">
				</div>
			</div>
			<div class="clear"></div>
			
			<hr />
			<div id="imgCntr"> 
				<img src="<c:url value='/store/file/display/img?fuid=${list[0].spic}' />" style="width: 880px; height: 560px;"/> 
			
			</div>	
			<div class="clear"></div>
			
			
			<div> 
				<c:forEach var="th" items="${thList}">
					<!-- //TODO write/update할 때 메뉴 옆에 체크박스 넣어서 value 값 1/0이냐에 따라 왕관 이미지 출력/히든 처리 -->
					<div><img src="assets/img/store_menu_best.png" alt="bestMenu" width="15" height="15"/></div>
					<div><img src="<c:url value='/store/file/display/img?fuid=${th.f_uid}' />" style="width: 150px;height: 150px;"/> </div>
			<!-- //TODO t_menu 테이블의 메뉴 이름 가져오기		<p>${m.m_name }</p> -->
				</c:forEach>
			</div>
			
		<!-- 맵나와라 -->
			<div class="box body-store-info" style="height:200px; width:900px; text-align: center;">
				<div class="box" style="float:left;">
					<div class="box" id="box-height" style="width:250px; padding:10px; margin:10px 10px 10px 40px;">
						<b>사장님의 한마디:</b><br>
						 ${list[0].scomt }
					</div>
					<div class="box" id="box-height"style="width:250px;  padding:10px; margin:10px 10px 10px 40px;">
						<b>운영 시간: </b><br>
						${list[0].sopinfo }
					</div>
				</div>
				<div style="padding:10px;"> 
					<div id="map_ma" style="width: 450px; height: 180px; margin:0px 0px 0px 40px;">
						<!-- 맵 -->
					</div>				
				</div>
			</div>
			<div class="clear"/>
			<hr />
			<div>
					<table style="margin-left: auto; margin-right: auto;">
						<tr><td id="left">포차 이름</td>
							<td id="right">${list[0].sname }</td></tr>
						<tr><td id="left">사업자 등록 번호</td>
							<td id="right">${list[0].sbiznum }</td></tr>
						<tr><td id="left"><i class="fal fa-map-maker-alt">포차 주소</i></td>
							<td id="right">${list[0].saddr }</td></tr>
						<tr><td id="left">위도</td>
							<td id="right">${list[0].slat }</td></tr>
						<tr><td id="left">경도</td>
							<td id="right">${list[0].slng }</td></tr>
					</table>
			</div>
		
		</div>
		
		<div id="box body-reply">	
			<div class="box box-footer">
			    <form role="form" method="post">
					<input type="hidden" name="suid" value="${dto.suid}">
			    </form>
			        
			    <div><button onclick="location.href='storeList'" class="btn-sm btn-primary listBtn"><i class="fa fa-list"></i> 목록</button></div>
			        <button onclick="location.href='storeUpdate?suid=${list[0].suid }'" class="btn-sm btn-warning modBtn"><i class="fa fa-edit"></i> 정보 수정</button>
			        <button onclick="chkDelete(${list[0].suid })" class="btn-sm btn-danger delBtn"><i class="fa fa-trash"></i> 포차 삭제</button>  
				</div>			
			</div>
			
			<br><br><br>
			
			<!-- 댓글 -->

				<div>		
					<form name="replyForm" method="post" class="form-horizontal">
						<input type="hidden" class="input" name="${_csrf.parameterName }" value="${_csrf.token }"/>
						<input type="hidden" id="s_uid" name="s_uid" value="${list[0].suid}" />	
						
						<div id="replyList" class="replyList">
							<table class="replyListT" style="margin-left: auto; margin-right: auto;">
							<tr><th>작성자</th><th><label for="c_content">평점</label></th><th>내용</th><th> </th></tr>
							<tr>
								<td><input type="text" id="u_id" name="u_id" class="chk form-control" placeholder="ID" style="width:200px" /></td>
								<td>
									<div class="table table-boardered" style="width:10%">
										<select id="c_point" name="c_point" class="">
											<option value="5"> 5 </option>
											<option value="4"> 4 </option>
											<option value="3"> 3 </option>
											<option value="2"> 2 </option>
											<option value="1"> 1 </option>								
										</select>
									</div>
								</td>
								<td><input type="text" id="c_content" name="c_content" class="chk form-control" placeholder="내용을 입력하세요"/></td>
								<td><button type="button" class="replyWriteBtn btn-sm btn-success">작성</button></td>
							</tr>
							</table>
						</div>
							
<!-- 						<div class="form-group">						 -->
<!-- 							<table> -->
<!-- 								<tr> -->
<!-- 									<td><label for="u_id">아이디</label></td> -->
<!-- 									<td><input type="text" id="u_id" name="u_id" class="chk form-control" title="작성자를 입력하세요" style="width:200px" /></td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td><label for="c_content">평점</label></td> -->
<!-- 									<td> -->
<!-- 										<div class="table table-boardered" style="width:10%"> -->
<!-- 											<select id="c_point" name="c_point" class=""> -->
<!-- 													<option value="5"> 5 </option> -->
<!-- 													<option value="4"> 4 </option> -->
<!-- 													<option value="3"> 3 </option> -->
<!-- 													<option value="2"> 2 </option> -->
<!-- 													<option value="1"> 1 </option>								 -->
<!-- 											</select> -->
<!-- 										</div> -->
<!-- 									</td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td><label for="c_content">후기</label></td> -->
<!-- 									<td> -->
<!-- 										<input type="text" id="c_content" name="c_content" class="chk form-control" placeholder="내용을 입력하세요"/> -->
<!-- 										<button type="button" class="replyWriteBtn btn btn-success">작성</button> -->
<!-- 									</td> -->
<!-- 								</tr> -->
<!-- 							</table> -->
<!-- 						</div> -->
					</form>				
				</div>
				
				<form name="replyForm" method="post" class="form-horizontal">
				<div id="replyList" class="replyList">
					<table class="replyListT" style="margin-left: auto; margin-right: auto;">
						<tr><th>작성자</th><th>평점</th><th>내용</th><th>작성 날짜</th><th></th></tr>
						<c:forEach items="${replyList}" var="replyList">
						<tr>
							<td id="jb-th-1"> ${replyList.u_id} </td>
							<td id="jb-th-1">${replyList.c_point}</td> 
							<td id="jb-th-2"> ${replyList.c_content}</td>
							<td id="jb-th-3"><fmt:formatDate value="${replyList.c_regdate}" pattern="yyyy-MM-dd HH:mm"/></td>
							<td><div>
								<button type="button" class="replyDeleteBtn btn-sm btn-danger" data-c_uid="${replyList.c_uid}">삭제</button>
							</div></td>
							</tr>
						</c:forEach>   
					</table>				
				</div>
				</form>
				
				<form name="deleteForm" role="form" method="post" action="replyDelete">
					<input type="hidden" name="s_uid" value="${list[0].suid}" readonly="readonly"/>
					<input type="hidden" id="c_uid" name="c_uid" value="${replyDelete.c_uid}" />						
				</form>		
			<hr />
		
			<div>
			  <ul>
			    <c:if test="${pageMaker.prev}">
			    	<li><a href="view${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
			    </c:if> 
			
			    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			    	<li><a href="view${pageMaker.makeQuery(idx)}&suid=${list[0].suid }">${idx}</a></li>
			    </c:forEach>
			
			    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			    	<li><a href="view${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
			    </c:if> 
			  </ul>
			</div>
	</div>	


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




<script type="text/javascript"> 
		$(document).ready(function() {
			var myLatlng = new google.maps.LatLng(${list[0].slat} , ${list[0].slng}); // 위치값 위도 경도
			var Y_point = ${list[0].slat};// Y 좌표
			var X_point = ${list[0].slng}; // X 좌표
			var zoomLevel = 14; // 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
			var markerTitle = "여기를 찾으시나요?"; // 현재 위치 마커에 마우스를 오버을때 나타나는 정보 
			var markerMaxWidth = 300; // 마커를 클릭했을때 나타나는 말풍선의 최대 크기 
			// 말풍선 내용 
	            var contentString    = '<div>' +
	            '<h5>title</h5>'+
	            '<a href="http://blog.naver.com/tnakekd" target="_blank">" target="_blank" class="con_link">http://blog.naver.com/tnakekd</a></a>'+
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

    <script>
       
    </script>
</body>
</html>






</c:otherwise>
</c:choose>




