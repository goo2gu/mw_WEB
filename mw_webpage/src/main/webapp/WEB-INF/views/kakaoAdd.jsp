<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>카카오 연결하기</title>
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
				location.href = "kakaoAdd_write.do?m_sns=카카오&m_id=${m_id}&m_email="+m_email+"&m_nickname="+m_nickname+"&m_profile_img="+m_profile_img+"&m_thumbnail_img="+m_thumbnail_img;
			},
			error : function() {
				alert("카카오 회원 정보를 불러오는 데 실패했습니다. 관리자에게 문의해주세요.");
			}
		});
	});
</script>
</head>
</html>
