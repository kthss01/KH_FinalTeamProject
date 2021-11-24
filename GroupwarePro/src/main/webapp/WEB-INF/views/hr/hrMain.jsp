<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="16x16"
	href="${ pageContext.servletContext.contextPath }/resources/assets/images/favicon.png">
<!-- Custom CSS -->
<link
	href="${ pageContext.servletContext.contextPath }/resources/dist/css/style.min.css"
	rel="stylesheet">
<!-- summernote -->
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/summernote/summernote-lite.css">

<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
	.inner:hover{
		color: rgb(95,118,232);
		cursor: pointer;
	}
	
	#status{
		display:none;
		position:absolute;
	}
	
	.selects1:hover, .selects2:hover, .selects3:hover, .selects4:hover, .selects5:hover{
		background-color: rgba(95,118,232, 0.1);
	}
	
	.week, .selects1, .selects2, .selects3, .selects4, .selects5{
		display:none;
	}
	
</style>
</head>
<body onload="printClock()">
	<!-- ============================================================== -->
	<!-- Preloader - style you can find in spinners.css -->
	<!-- ============================================================== -->
	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper" data-theme="light" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed"
		data-boxed-layout="full">
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<jsp:include page="../common/header.jsp" />

		<!-- ============================================================== -->
		<!-- End Topbar header -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<jsp:include page="../common/sidebar.jsp" />

		<!-- ============================================================== -->
		<!-- End Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper" style=" background-color: white;">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid" style="height: 100%">
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				
				<div class="row" style="height: 100%;">
						<!-- 근태관리 사이드바 -->
					<div class="col-2" style="border-right: 1px solid rgba(0,0,0,.125);">
						<h3>근태관리</h3>
						<div>
							<c:set var="today" value="<%= new java.util.Date() %>"/>
							<p style="font-size:14px"><fmt:formatDate value="${today}" type="date" pattern="yyyy-MM-dd (E)"/></p>
							<p id="clock" style="font-size:40px"></p>
							<div>
								<div class="d-flex" style="font-size: 12px">
									<p class="col-6" style="padding:0px;">출근시간</p>
									<c:choose>
										<c:when test="${empty w.startTime }">
											<p class="col-6 text-right" style="padding:0px;">미등록</p>
										</c:when>
										<c:otherwise>
											<p class="col-6 text-right" style="padding:0px;">${w.startTime}</p>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="d-flex" style="font-size: 12px">
									<p class="col-6" style="padding:0px;">퇴근시간</p>
									<c:choose>
										<c:when test="${empty w.endTime }">
											<p class="col-6 text-right" style="padding:0px;">미등록</p>
										</c:when>
										<c:otherwise>
											<p class="col-6 text-right" style="padding:0px;">${w.endTime}</p>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="d-flex" style="font-size: 12px">
									<p class="col-7" style="padding:0px;">주간 누적 근무시간</p><p class="col-5 text-right" style="padding:0px;">00h 00m 00s</p>
								</div>
							</div>
						</div>
						
						<br>
						<form method="get" action="change.hr">
							<div class="d-flex align-items-center">
							<!-- 출근시간 없으면 출근가능, 퇴근 불가능 -->
							<!-- 출근 시간이 있으면, 출근 불가능, 퇴근 가능 -->
							<!-- 출근시간, 퇴근시간이 있으면, 출근 불가능, 퇴근 불가능 -->
							<!-- 버튼 속성 disable 주기 -->
							<c:choose>
								<c:when test="${empty w.startTime }">
									<button type="submit" class="btn btn-rounded btn-outline-primary col-6" style="margin:2px" value="1" name="status">출근하기</button>
									<button type="submit" class="btn btn-rounded btn-outline-primary col-6" style="margin:2px" value="2" name="status" disabled>퇴근하기</button>
								</c:when>
								<c:when test="${not empty w.startTime && empty w.endTime}">
									<button type="submit" class="btn btn-rounded btn-outline-primary col-6" style="margin:2px" value="1" name="status" disabled>출근하기</button>
									<button type="submit" class="btn btn-rounded btn-outline-primary col-6" style="margin:2px" value="2" name="status">퇴근하기</button>
								</c:when>
								<c:otherwise>
									<button type="submit" class="btn btn-rounded btn-outline-primary col-6" style="margin:2px" value="1" name="status" disabled>출근하기</button>
									<button type="submit" class="btn btn-rounded btn-outline-primary col-6" style="margin:2px" value="2" name="status" disabled>퇴근하기</button>
								</c:otherwise>
							</c:choose>
							</div>
							<div class="d-flex align-items-center">
								<button type="button" id="selectStatus" class="btn btn-rounded btn-outline-primary col-12" style="margin:2px 2px 0px 2px;">근무상태변경<i data-feather="chevron-down" class="feather-icon"></i></button>
							</div>
 							<div id="status" class="align-items-center" style="border: 1px solid rgb(95,118,232); border-radius: 10px; background-color:white;">
								<button type="submit" class="d-flex col-12 btn btn-outline-primary" style="border:none; border-top-left-radius: 9px; border-top-right-radius: 9px;" value="3" name="status">업무</button>
								<button type="submit" class="d-flex col-12 btn btn-outline-primary" style="border:none;" value="4" name="status">업무종료</button>
								<button type="submit" class="d-flex col-12 btn btn-outline-primary" style="border:none;" value="5" name="status">외근</button>
								<button type="submit" class="d-flex col-12 btn btn-outline-primary" style="border:none;" value="6" name="status">출장</button>
								<button type="submit" class="d-flex col-12 btn btn-outline-primary" style="border:none; border-bottom-left-radius: 9px; border-bottom-right-radius: 9px;" value="7" name="status">반차</button>
							</div>
							<input type="hidden" name="wNo" value="${w.WNo }">
						</form>
						<br>
						<!-- 근태관리, 내 근태 현황, 내 연차 내역, 내 인사정보 -->
	                
                        <h6 class="card-title">근태관리</h6>
                        <div class="list-group"> 
			           		<a href="work.hr" class="list-group-item">내 근태 현황</a>
                        	<a href="vacation.hr" class="list-group-item">내 연차 내역</a> 
                        	<a href="empInfo.hr" class="list-group-item">내 인사정보</a> 
                       	</div>
					</div>
					
					<script>
						$(function(){
							$("#status").css("z-index","1")
							$(".list-group").css("z-index","0")
							$(".card-title").css("z-index","0")
							
							$("#selectStatus").click(function(){
								if($("#status").css("display") == "none") {
									$("#status").show();
									
									var width = $("#selectStatus").css("width");
									
									$("#status").css("width", width)
								}
								else {
									$("#status").hide();
								}
							})
						})
						
						function printClock() {
						    
						    var clock = document.getElementById("clock");	// 출력할 장소 선택
						    var currentDate = new Date();	// 현재시간
						    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
						    var currentHours = addZeros(currentDate.getHours(),2); 
						    var currentMinute = addZeros(currentDate.getMinutes() ,2);
						    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
						    
						    clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds; //날짜를 출력해 줌
						    
						    setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
						    
						    
						    function addZeros(num, digit) { // 자릿수 맞춰주기
							  	var zero = '';
							  	num = num.toString();
							  	if (num.length < digit) {
								  	for (i = 0; i < digit - num.length; i++) {
								  		zero += '0';
								  	}
							  	}
							  	return zero + num;
							}
						}
					</script>
					<!------------------------------------------------------>
					
					<div class="col-10">
						<h3>근태 현황</h3>
						<div class="row">
							<div class="m-auto">
								<span><i data-feather="chevron-left" class="feather-icon"></i></span>
								<span>${year }.${month }</span>
								<span><i data-feather="chevron-right" class="feather-icon"></i></span>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 m-auto">
								<div class="d-flex col-12 m-auto" style="border: 1px solid rgba(0,0,0,.125); background-color: white">
									<div class="col-2 m-auto" style="height:100%; padding:10px 0px">
										<p class="text-center m-auto" style="font-size:12px">이번주 누적</p>
										<p class="text-center m-auto text-primary">3h 27m 32s</p>
									</div>
									<div class="col-2 m-auto" style="height:100%; padding:10px 0px">
									<p class="text-center m-auto" style="font-size:12px">이번주 초과</p>
										<p class="text-center m-auto text-primary">3h 27m 32s</p>
									</div>
									<div class="col-2 m-auto" style="height:100%; padding:10px 0px">
										<p class="text-center m-auto" style="font-size:12px">이번주 잔여</p>
										<p class="text-center m-auto text-primary">3h 27m 32s</p>
									</div>
									<div class="col-2 m-auto" style="height:100%; padding:10px 0px">
										<p class="text-center m-auto" style="font-size:12px">이번달 누적</p>
										<p class="text-center m-auto">3h 27m 32s</p>
									</div>
									<div class="col-2 m-auto" style="height:100%; padding:10px 0px">
										<p class="text-center m-auto" style="font-size:12px">이번달 연장</p>
										<p class="text-center m-auto">3h 27m 32s</p>
									</div>
								</div>
							</div>
						</div>
						<br><br>
						
						
						<!-- 이번달 wlist 출력  -->
						<c:set var="begin" value="0"/>
						<c:set var="end" value="6"/>
						
						<!-- 이번달이 4주인지 5주인지 구분 -->
						<!-- wlist의 크기를 7로 나눠서 몫이 4이고, 나머지가 0이면 : 4주-->
						<!-- 그 외에는 5주-->
						<c:choose>
							<c:when test="${wlist.size() / 7 == 4 && wlist.size() % 7 == 0}">
								<c:set var="forNum" value="4"/>
							</c:when>
							<c:otherwise>
								<c:set var="forNum" value="5"/>
							</c:otherwise>
						</c:choose>
						<c:forEach var="week" begin ="1" end ="${forNum }">
							<div class="row" style="border-bottom: 2px solid rgba(0,0,0,.125);">
								<!-- 주차 표시 -->
								<div class="d-flex col-12" style="padding: 0px 10px; border-bottom: 2px solid rgba(0,0,0,.125);">
									<div class="text-left col-2">
										<!-- 접었다 펼때 아이콘 바뀜 -->
										<h5 class="chevron cl" id="chevron${week }"><i data-feather="chevron-down" class="feather-icon inner"></i>&nbsp;&nbsp;${week }주차</h5>
									</div>
									<!-- <div class="text-right col-10">
										<span>누적 근무시간 00h 00m 00s (초과 근무시간 00h 00m 00s)</span>
									</div> -->
								</div>
								
								<!-- 헤더 표시, 접었다 펼 수 있음 -->
								<div class="col-12 week" id="week${week }" style="border-bottom: 1px solid rgba(0,0,0,.125);">
									<div class="col-1 text-center">
										<span>일차</span>
									</div>
									<div class="col-2">
										<span>업무시작</span>
									</div>
									<div class="col-2">
										<span>업무종료</span>
									</div>
									<div class="col-2">
										<span>총 근무시간</span>
									</div>
									<div class="col-5">
										<span>근무시간 상세</span>
									</div>
								</div>
								
								<!-- 일자 표시 (7일) -->
								<c:forEach var="date" items="${wlist }" begin ="${begin }" end ="${end }" varStatus ="status">
								<div class="col-12 selects${week }" id="select${week }">
									<div class="col-1 text-center">
										<span class="date"><fmt:formatDate value="${date.WDate}" type="date" pattern="dd"/></span>
										<span class="day"><fmt:formatDate value="${date.WDate}" type="date" pattern="E"/></span>
									</div>
									<div class="col-2">
										<c:set var="st" value="${date.startTime }"/>
										<c:choose>
											<c:when test="${empty st }">
												<span class="startTime"></span>
											</c:when>
											<c:otherwise>
												<span class="startTime">${st }</span>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="col-2">
										<c:set var="et" value="${date.endTime }"/>
										<c:choose>
											<c:when test="${empty et }">
												<span class="endTime"></span>
											</c:when>
											<c:otherwise>
												<span class="endTime">${et }</span>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="col-2">
										<c:choose>
											<c:when test="${empty st or empty et }">
												<span>00h 00m 00s</span>
											</c:when>
											<c:otherwise>
												<span id="total${date.WNo }"></span>
												<script>
													$(function(){
														var st = "${st}";	//string
														var et = "${et}";
														
														//출근시간 시, 분, 초 분리
														var start = st.split(':');
														var h1 = start[0];
														var m1 = start[1];
														var s1 = start[2];
														
														//퇴근시간 시, 분, 초 분리
														var end = et.split(':');
														var h2 = end[0];
														var m2 = end[1];
														var s2 = end[2];
														
														//퇴근시간 - 출근시간 = 총 근무시간
														var h = h2 - h1;
														var m = m2 - m1;
														var s = s2 - s1;
														
														//s2 - s1이 0보다 작으면
														if(s < 0) {
															m = m-1;
															s = 60 + s;
														}
														if(m < 0){
															h = h -1;
															m = 60 + m;
														}
														
														//00형태로 바꾸기
														if(h < 10){
															h = '0' + h;
														}
														if(m < 10){
															m = '0' + m;
														}
														if(s < 10){
															s = '0' + s;
														}
														
														//결과
														var total = h + "h " + m + "m " + s + "s"

														//입력할 위치의 id
														var wNo = "${date.WNo}";
														var thisId = "#total" + wNo;
														$(thisId).text(total);
													})
												</script>
											</c:otherwise>
										</c:choose>
									</div>
									
									<div class="col-5">
										<!-- 누적/초과 -->
										<c:choose>
											<c:when test="${empty st or empty et }">
												<span class="workDetail1">기본 00h 00m 00s/초과 00h 00m 00s</span>
											</c:when>
											<c:otherwise>
												<%-- <span class="workDetail2" id = "detail${date.WNo }"></span> --%>
												<span class="workDetail1">기본 00h 00m 00s/초과 00h 00m 00s</span>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
								</c:forEach>
								<c:set var="begin" value="${begin+7 }"/>
								<c:set var="end" value="${end+7 }"/>
							</div>
							<br>
						</c:forEach>
						
						<script>
							$(function(){
								
								$(".chevron").click(function(){
									
									var week = $(this).attr('id').substr(7, 1);
									
									if($(this).attr('class').includes('cl') == true) {
										$(this).removeClass('cl');
										$(this).addClass('op');
										
										//헤더 클래스에 d-flex추가
										//내용 클래스에 d-flex추가
										$("#week" + week).addClass('d-flex')
										$(".selects" + week).addClass('d-flex')
										
									}
									
									else if($(this).attr('class').includes('op') == true){
										
										$(this).removeClass('op');
										$(this).addClass('cl');
										
										//헤더 클래스에 d-flex추가
										//내용 클래스에 d-flex추가 
										$("#week" + week).removeClass('d-flex')
										$(".selects" + week).removeClass('d-flex')
										
									}
								})
								
							})
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- ============================================================== -->
	<!-- End PAge Content -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- Right sidebar -->
	<!-- ============================================================== -->
	<!-- .right-sidebar -->
	<!-- ============================================================== -->
	<!-- End Right sidebar -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- End Container fluid  -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- footer -->
	<!-- ============================================================== -->
	<footer class="footer text-center text-muted">
		All Rights Reserved by Adminmart. Designed and Developed by <a
			href="https://wrappixel.com">WrapPixel</a>.
	</footer>
	<!-- ============================================================== -->
	<!-- End footer -->
	<!-- ============================================================== -->

	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->
	<!-- All Jquery -->
	<!-- ============================================================== -->

	
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/libs/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/libs/popper.js/dist/umd/popper.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- apps -->
	<!-- apps -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dist/js/app-style-switcher.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dist/js/feather.min.js"></script>
	<!-- slimscrollbar scrollbar JavaScript -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/extra-libs/sparkline/sparkline.js"></script>
	<!--Wave Effects -->
	<!-- themejs -->
	<!--Menu sidebar -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dist/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dist/js/custom.min.js"></script>
	<!--  -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/summernote/summernote-lite.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/summernote/lang/summernote-ko-KR.js"></script>

</body>
</html>