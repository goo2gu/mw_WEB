<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>내 정보</title>
<!-- favicon -->
<link rel="shortcut icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<link rel="icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/user_update.css">
<link rel="stylesheet" type="text/css" href="/resources/css/resetAll.css">
<!-- js -->
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function update_info(f) {
		if (f.m_nickname.value == "") {
			alert("닉네임을 입력하세요.");
			f.m_nickname.focus();
			return;
		} else {
			var sbmt = confirm("이대로 수정하시겠습니까?");
			if (sbmt == true) {
				f.action = "user_updateOk.do";
				f.submit();
			}
		}
	}
	function back_go(f) {
		var sbmt = confirm("취소하시겠습니까?");
		if (sbmt == true) { history.go(-1); }
	}
	// 썸네일 업로드 시 변경 이벤트
	
</script>
</head>

<body>
	<header>
		<jsp:include page="top.jsp" />
	</header>
	<article>
		<h2>정보 수정</h2>
		<form method="post" encType="multipart/form-data">
			<div class="updateInfo">
				<img id="thumbnail" alt="profile" src="${mvo.m_profile_img}">
				<div class="updateInfoTexts">
					<label for="profileImg">업로드</label> 
					<input id="profileImg" type="file" name="m_profile_img" onchange="setThumbnail(event);">
					<input class="nameInput" type="text" name="m_nickname" value="${mvo.m_nickname}">
					<p>${mvo.m_email}</p>
				</div>
			</div>
			<div class="updateBtn">
				<input type="hidden" name="prevImg" value="${mvo.m_profile_img}">
				<input type="button" value="제출" onclick="update_info(this.form)">
				<input type="button" value="취소" onclick="back_go()">
			</div>
		</form>
	</article>
</body>
</html>