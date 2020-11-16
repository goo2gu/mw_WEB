<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- Favicon -->
<link rel="shortcut icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<link rel="icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<!-- js -->
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$.ajax({
		url : "k_member.do",
		method : "post",
		dataType : "json",
		success : function(data) {
			var m_email = "";
			var m_nickname = "";
			var m_profile_img = "";
			var m_thumbnail_img = "";
			$.each(data, function(k, v) {
				var response = v['profile'];
				$.each(response, function(k, v) {
					m_nickname = response['nickname'];
					m_profile_img = response['profile_image_url'];
					m_thumbnail_img = response['thumbnail_image_url'];
				});
				m_email = v['email'];
			});
			location.href = "kakaoLogin_chk.do?m_sns=카카오&m_id=${m_id}";
		},
		error : function() {
			alert("카카오 회원 정보를 불러오는 데 실패했습니다. 다시 시도해주세요.");
		}
	});
});
</script>
</head>
</html>


