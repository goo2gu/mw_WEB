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
<script type="text/javascript">
	function my_info() { location.href = "my_info.do"; }
	function my_like() { location.href = "my_like.do"; }
	function my_review() { location.href = "my_review.do"; }
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
				<input type="button" value="정보 수정" onclick="my_info()">
			</div>
			<div class="menu_item">
				<input type="button" value="좋아요" onclick="my_like()">
			</div>
			<div class="menu_item" style="padding-bottom: 20px;">
				<input type="button" value="내 리뷰" onclick="my_review()">
			</div>
		</div>
	</article>
	

</body>
</html>