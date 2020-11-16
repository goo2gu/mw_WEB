<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원 가입 완료</title>
<!-- favicon -->
<link rel="shortcut icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<link rel="icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/kakaoAdd_res.css">
<link rel="stylesheet" type="text/css" href="/resources/css/resetAll.css">
</head>
<!-- js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	    $('.addInfo').animate({
	    	opacity: '1'
	    }, 1200, function() {
	    	$('.addRes').animate({
		    	opacity: '1'
		    }, 1200);
		});
	});
	function main_go() {
		location.href = "main.do";
	}
</script>
<body>
	<header>
		<jsp:include page="top.jsp" />
	</header>
	<article>
		<h2>가입 완료!</h2>
		<div class="addInfo">
			<img alt="profile" src="${k_mvo.m_profile_img}">
			<h4>${k_mvo.m_nickname}</h4>
			<p>${k_mvo.m_email}</p>
		</div>
		<div class="addRes">
			<p><span>${k_mvo.m_nickname}</span> 님,</p>
			<p><span>명월</span>에 오신 것을 <span>환영합니다!</span></p>
			<button onclick="main_go()">메인으로</button>
		</div>
	</article>
</body>
</html>