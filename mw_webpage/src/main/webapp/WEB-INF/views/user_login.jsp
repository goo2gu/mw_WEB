<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
 <title>로그인</title>
 <!-- favicon -->
<link rel="shortcut icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<link rel="icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/user_login.css">
<link rel="stylesheet" type="text/css" href="/resources/css/resetAll.css">
<!-- js -->
<script type="text/javascript">
	function kakaoLogin() {
		location.href = "https://kauth.kakao.com/oauth/authorize?client_id=eee202b1a78a56d2e53bd82554d2abcd&redirect_uri=http://localhost:8090/kakaoLogin.do&response_type=code";
	}
</script>
</head>

<body>
	<header>
		<jsp:include page="top.jsp" />
	</header>
	<article>
		<div class="loginInfo">
			<h2>로그인</h2>
			<p>소셜 로그인을 통해 간편하게 이용해보세요.</p>
			<div class="socialLink">
				<img src="/resources/images/kakao_btn.png" onclick="kakaoLogin()">
				<img src="/resources/images/kakao_btn.png" onclick="kakaoLogin()">
				<img src="/resources/images/kakao_btn.png" onclick="kakaoLogin()">
			</div>
			<div class="addLink">
				<a href="https://kauth.kakao.com/oauth/authorize?client_id=eee202b1a78a56d2e53bd82554d2abcd&redirect_uri=http://localhost:8090/kakaoAdd.do&response_type=code&state=mjworld2020">
					카카오 회원가입
				</a>
				&nbsp;|&nbsp;
				<a href="https://kauth.kakao.com/oauth/authorize?client_id=eee202b1a78a56d2e53bd82554d2abcd&redirect_uri=http://localhost:8090/kakaoAdd.do&response_type=code&state=mjworld2020">
					네이버 회원가입
				</a>
				&nbsp;|&nbsp;
				<a href="https://kauth.kakao.com/oauth/authorize?client_id=eee202b1a78a56d2e53bd82554d2abcd&redirect_uri=http://localhost:8090/kakaoAdd.do&response_type=code&state=mjworld2020">
					페이스북 회원가입
				</a>
			</div>
		</div>
	</article>
</body>
</html>