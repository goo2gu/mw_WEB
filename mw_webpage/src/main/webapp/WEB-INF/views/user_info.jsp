<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내 정보</title>
<!-- favicon -->
<link rel="shortcut icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<link rel="icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/user_info.css">
<link rel="stylesheet" type="text/css" href="/resources/css/resetAll.css">
<!-- js -->
<script type="text/javascript">
	function user_update() { location.href = "user_update.do"; }
	function user_like() { location.href = "user_like.do"; }
	function user_review() { location.href = "user_review.do"; }
</script>
</head>

<body>
	<header>
		<jsp:include page="top.jsp" />
	</header>
	
	<article>
		<h2>내 정보</h2>
		<div class="addInfo">
			<img alt="profile" src="${mvo.m_profile_img}">
			<h4>${mvo.m_nickname}</h4>
			<p>${mvo.m_email}</p>
		</div>
		<div class="user_menu">
			<div class="menu_item">
				<input type="button" value="정보 수정" onclick="user_update()">
			</div>
			<div class="menu_item">
				<input type="button" value="좋아요" onclick="user_like()">
			</div>
			<div class="menu_item">
				<input type="button" value="내 리뷰" onclick="user_review()">
			</div>
		</div>
	</article>
	

</body>
</html>