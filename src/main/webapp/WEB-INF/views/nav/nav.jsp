<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
    <!-- Preloader Start -->
    <header>
        <!-- Header Start -->
       <div class="header-area header-transparent">
            <div class="main-header">
               <div class="header-bottom  header-sticky">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <!-- Logo -->
                            <div class="col-xl-2 col-lg-2 col-md-1">
                                <div class="logo">
                                  <a href="./index"><img src="assets/img/logo/logo.jpg" width=132px height=37px alt=""></a>
                                </div>
                            </div>
                            <div class="col-xl-10 col-lg-10 col-md-8">
                                <!-- Main-menu -->
                                <div class="main-menu f-right d-none d-lg-block">
                                    <nav>
                                        <ul id="navigation">                                                                                                                                     
                                            <li><a href="./index">Home</a></li>
                                            <li><a href="./about">About</a></li>
                                            <li><a href="./listmain">List</a></li>
                                            <li><a href="./n_list">Community</a>
                                            	<ul class="submenu">
                                            		<li><a href="./n_list">공지사항</a></li>
                                            		<li><a href="./f_list">자주하는 질문</a></li>
                                            		<li><a href="./qna">질문과 답변</a></li>
                                            	</ul>
                                            </li>
                                            <li class="login">
                                            	<sec:authorize access="isAnonymous()">
	                                            	<a href="./login"> Sign In </a>
                                                </sec:authorize>
                                                <sec:authorize access="isAuthenticated()">
                                                	<a href="#"><i class="ti-user"></i><sec:authentication property="principal.username"/></a>
                                                </sec:authorize>
                                            </li>
                                            <li class="login">
                                            	<sec:authorize access="isAuthenticated()">
                                            		<a href=${pageContext.request.contextPath }/logout>로그아웃</a>
                                           		</sec:authorize>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <!-- Mobile Menu -->
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
               </div>
            </div>
       </div>
        <!-- Header End -->
    </header>