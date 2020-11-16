<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>메뉴</title>
<!-- favicon -->
<link rel="shortcut icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<link rel="icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/submenu_mobile.css">
<link rel="stylesheet" type="text/css" href="/resources/css/resetAll.css">
<!-- js -->
<script type="text/javascript">
	function back_go() {
		history.go(-1);
	}
	/* 992px 이상에서 현재 페이지 접속 시 메인 페이지로 이동  */
	var innerWidth = window.innerWidth;
	if (innerWidth >= 992) {
		location.href="main.do";
	}
</script>
</head>

<body>
	<h3 class="submenu_title"> 메뉴 </h3>
	<ul class = "submenu_list">
		<li><a href="main.do">			홈		</a></li>
		<li><a href="mw_info.do">		명월소개	</a></li>
		<li><a href="search_main.do">	가게찾기	</a></li>
		<li><a href="qna.do">			문의하기	</a></li>
		<li><a href="login.do">			내정보	</a></li>
	</ul>
	<div class="goBack" onclick="back_go()">메인화면으로</div>

</body>
</html>