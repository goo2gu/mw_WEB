<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>명월 소개</title>
<!-- favicon -->
<link rel="shortcut icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<link rel="icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/mw_info.css">
<link rel="stylesheet" type="text/css" href="/resources/css/resetAll.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
	    $('.mw_info_title').animate({
	    	opacity: '1'
	    }, 1200, function() {
	    	$('.mw_info_context').animate({
		    	opacity: '1'
		    }, 1200);
		});
	});
	function fbook_go() {
		var f_url = "https://www.facebook.com/myongjiworld/";
		newPage = window.open(f_url);
	}
	function igram_go() {
		var i_url = "https://www.instagram.com/myongji_world/";
		newPage = window.open(i_url);
	}
</script>
</head>

<body>
	<div><jsp:include page="top.jsp" /></div>

	<div class="wrap_all">
		<div class="mw_info_title">
			<h2>#함께해요</h2>
			<h2>#명지월드</h2>
		</div>
		<div class="mw_info_context">
			<div class="texts">
				<p><span class="txt_hlt">'명월-명지월드의 모든 것'</span>은<br>거북골로에 자리잡은 상권과의<br><span class="txt_hlt">상생</span>을 위해 활동하고 있는<br>청년 단체입니다.</p>
			</div>
			<div class="sns_link">
				<div onclick="fbook_go()">
					<img alt="facebook" src="/resources/images/facebook.png">
					<p>명월-명지월드의 모든 것</p>
				</div>
				<div onclick="igram_go()">
					<img alt="instagram" src="/resources/images/instagram.png">
					<p>@myongji_world</p>
				</div>
			</div>
			<p>myongjiworld@gmail.com</p>
		</div>
	</div>

</body>
</html>