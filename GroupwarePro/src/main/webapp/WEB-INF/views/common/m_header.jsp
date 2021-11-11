<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

header>*{

background-color: rgba(0,0,0,.78);
color: white;


}


</style>




</head>
<body>

        <header class="topbar " data-navbarbg="skin6">
        	
				<div id="socketAlert" class="alert alert-info alert-dismissible fade show" role="alert" 
						style="text-align:center; height:40px; padding:5px; display:none;">
	                <button type="button" class="close" data-dismiss="alert" aria-label="Close" style="padding:5px 30px;"
	                			onclick='$("#socketAlert").css("display","none")'>
	                    <span aria-hidden="true">×</span>
	                </button>
	                <span class="font-weight-bold" style="font-size:17px;"><i class="fas fa-envelope"></i>&nbsp;&nbsp; 알림 &nbsp;- &nbsp;</span> 
	                	<span id='socketAlertMsg' style="font-size:17px;"> ---al</span>
                 </div>

            <nav class="navbar top-navbar navbar-expand-md" style="border:none;">
                <div class="head" data-logobg="skin6" style="padding: 0px 0px 0px 35px">
          
                    <!-- This is for the sidebar toggle which is visible on mobile only -->
                    <!-- 
                    <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)"><i
                            class="ti-menu ti-close"></i></a>  -->
                    <div class="navbar-brand" style="border:none;">
                        <!-- Logo icon -->
                        <a href="menagerMain.me">
                            <span class="logo-text" style="color:rgba(255,255,255,0.75); opacity:0.75;">		
                               MANAGEMENT
	                        </span>
                        </a>
                    </div>
                    <!-- ============================================================== -->
                    <!-- End Logo -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- Toggle which is visible on mobile only -->
                    <!-- ============================================================== -->
                    <a class="topbartoggler d-block d-md-none waves-effect waves-light" href="javascript:void(0)"
                        data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><i
                            class="ti-more"></i></a>
                </div>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <div class="navbar-collapse collapse" id="navbarSupportedContent">
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav float-left mr-auto ml-3 pl-1">
                        <!-- Notification -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle pl-md-3 position-relative" href="javascript:void(0)"
                                id="bell" role="button" data-toggle="dropdown" aria-haspopup="true"
                                aria-expanded="false">
                                <span><i data-feather="bell" class="svg-icon"></i></span>
                                <span class="badge badge-primary notify-no rounded-circle">5</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-left mailbox animated bounceInDown">
                                <ul class="list-style-none">
                                    <li>
                                        <div class="message-center notifications position-relative">
                                            <!-- Message -->
                                            <a href="javascript:void(0)"
                                                class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                                <div class="btn btn-danger rounded-circle btn-circle"><i
                                                        data-feather="airplay" class="text-white"></i></div>
                                                <div class="w-75 d-inline-block v-middle pl-2">
                                                    <h6 class="message-title mb-0 mt-1">Luanch Admin</h6>
                                                    <span class="font-12 text-nowrap d-block text-muted">Just see
                                                        the my new
                                                        admin!</span>
                                                    <span class="font-12 text-nowrap d-block text-muted">9:30 AM</span>
                                                </div>
                                            </a>
                                            <!-- Message -->
                                            <a href="javascript:void(0)"
                                                class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                                <span class="btn btn-success text-white rounded-circle btn-circle"><i
                                                        data-feather="calendar" class="text-white"></i></span>
                                                <div class="w-75 d-inline-block v-middle pl-2">
                                                    <h6 class="message-title mb-0 mt-1">Event today</h6>
                                                    <span
                                                        class="font-12 text-nowrap d-block text-muted text-truncate">Just
                                                        a reminder that you have event</span>
                                                    <span class="font-12 text-nowrap d-block text-muted">9:10 AM</span>
                                                </div>
                                            </a>
                                            <!-- Message -->
                                            <a href="javascript:void(0)"
                                                class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                                <span class="btn btn-info rounded-circle btn-circle"><i
                                                        data-feather="settings" class="text-white"></i></span>
                                                <div class="w-75 d-inline-block v-middle pl-2">
                                                    <h6 class="message-title mb-0 mt-1">Settings</h6>
                                                    <span
                                                        class="font-12 text-nowrap d-block text-muted text-truncate">You
                                                        can customize this template
                                                        as you want</span>
                                                    <span class="font-12 text-nowrap d-block text-muted">9:08 AM</span>
                                                </div>
                                            </a>
                                            <!-- Message -->
                                            <a href="javascript:void(0)"
                                                class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                                <span class="btn btn-primary rounded-circle btn-circle"><i
                                                        data-feather="box" class="text-white"></i></span>
                                                <div class="w-75 d-inline-block v-middle pl-2">
                                                    <h6 class="message-title mb-0 mt-1">Pavan kumar</h6> <span
                                                        class="font-12 text-nowrap d-block text-muted">Just
                                                        see the my admin!</span>
                                                    <span class="font-12 text-nowrap d-block text-muted">9:02 AM</span>
                                                </div>
                                            </a>
                                        </div>
                                    </li>
                                    <li>
                                        <a class="nav-link pt-3 text-center text-dark" href="javascript:void(0);">
                                            <strong>Check all notifications</strong>
                                            <i class="fa fa-angle-right"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <!-- End Notification -->
                        <!-- ============================================================== -->
                        <!-- create new -->
                        <!-- ============================================================== -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i data-feather="settings" class="svg-icon"></i>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Something else here</a>
                            </div>
                        </li>

                    </ul>
                    
                    <!-- ============================================================== -->
                    <!-- Right side toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav float-right">
                        <!-- ============================================================== -->
                        <!-- ============================================================== -->
                        <li class="nav-item dropdown">
                      	    <c:if test="${!empty sessionScope.loginUser}"> 
                            <a class="nav-link dropdown-toggle" href="javascript:void(0)" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                                    
                                <!--  헤더 로그인 구역  -->
                                
                                <span class="ml-2 d-none d-lg-inline-block">
                                 <span style="color:rgba(255,255,255,.75);">${sessionScope.loginUser.loginId} </span> <i data-feather="chevron-down"
                                        class="svg-icon"></i></span>
                              
                                
                            </a>
                      
                            <div class="dropdown-menu dropdown-menu-right user-dd animated flipInY">
                            
                                <a class="dropdown-item" href="javascript:void(0)"><i data-feather="user"
                                        class="svg-icon mr-2 ml-1"></i>
                                    	내 정보</a>
                                <a class="dropdown-item" href="javascript:void(0)"><i data-feather="mail"
                                        class="svg-icon mr-2 ml-1"></i>
					                                   메뉴 2</a>
					                                <a class="dropdown-item" href="javascript:void(0)"><i data-feather="mail"
					                                        class="svg-icon mr-2 ml-1"></i>
					                                    메뉴 3</a>
					                                <div class="dropdown-divider"></div>
					                     
					                                <a class="dropdown-item" href="${pageContext.servletContext.contextPath }"><i data-feather="backToMain"
					                                        class="fas fa-arrow-alt-circle-left mr-2 ml-1"></i>
					                                메인</a>
					                                <div class="dropdown-divider"></div>
					                                <a class="dropdown-item" href="logout.me"><i data-feather="power"
					                                        class="svg-icon mr-2 ml-1"></i>
					                                    로그아웃</a>
                                <div class="dropdown-divider"></div>
                                <!-- 
                                <div class="pl-4 p-3"><a href="javascript:void(0)" class="btn btn-sm btn-info">View
                                       Profile</a></div>
                                        -->
                            </div>
                             </c:if>
                            
                        </li>
                        <!-- ============================================================== -->
                        <!-- User profile and search -->
                        <!-- ============================================================== -->
                    </ul>
                </div>
                
   
            </nav>
            	             

                	
        </header>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/libs/jquery/dist/jquery.min.js"></script>
</body>
<script>
//자신의 url과 핸들러 맵핑할 주소로 WebSocket객체 생성, 객체가 메시지를 받고 연결이 끊길 때 호출할 함수 셋팅  	
var socket = null;
$(document).ready( function() {

    connectWS();	
});
function connectWS() {
    var ws = new WebSocket("ws://localhost:8090/spring/echo");
    socket = ws;
    ws.onopen = function () {
        console.log('Info: connection opened.');
    };
    ws.onmessage = function (event) {
        let socketAlert = $("div#socketAlert");
        let socketAlertMsg = $("#socketAlertMsg");
        console.log(event.data);
        var str = event.data;
        var msgArr = str.split(',');
        console.log(msgArr[0]);
        if(msgArr[0] == 'reply'){
            alertMsg = msgArr[1]
            
             socketAlert.css("display",'block');
             socketAlertMsg.html(alertMsg);
             
         }else{
            
             alertMsg = msgArr[0];

             var resultReceiver = str.substring(20,28)
             if(location.pathname != "/spring/chatPage.ch"){
                 socketAlert.css("display",'block');
                 socketAlertMsg.html(alertMsg);
             }else if(location.search != resultReceiver){
                $('#newAlert').css("display",'block')
              $('#newAlert').html(alertMsg);
             }
             

         }
        
       if(alertMsg == 'error'){
    	   alert(msg);
       }
        /* 팝업은 클릭하지 않으면 5초 후에 자동으로 사라진다. 
        setTimeout( function(){
        	socketAlert.css("display","none");
        }, 5000);
        */

    };
    
    ws.onclose = function (event) { 
        console.log('Info: connection closed.');
    };
    ws.onerror = function (err) { console.log('Error:', err); };
    

}
</script>
</html>