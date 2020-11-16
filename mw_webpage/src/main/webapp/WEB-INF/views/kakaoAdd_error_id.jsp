<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script type="text/javascript">
	alert("이미 가입된 아이디입니다. 로그인 화면으로 이동합니다.");
	sessionStorage.clear();
	location.href = "login.do";
</script>
</head>
</html>