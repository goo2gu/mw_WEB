<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>명월 관리자 페이지</title>
<!-- favicon -->
<link rel="shortcut icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<link rel="icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/admin.css">
<link rel="stylesheet" type="text/css" href="/resources/css/resetAll.css">
<!-- js -->
<script type="text/javascript">
	onload = function() {
	    var pwd = "mjworld2020";
	    var getpwd = prompt("비밀번호를 입력하세요.");
	    if(pwd == getpwd) {
	        return;
	    } else {
	        alert("비밀번호가 일치하지 않습니다.");
	        location.href = "main.do";
	    }
	}
	function admin_store() { location.href = "admin_store.do"; }
	function admin_qna() { location.href = "admin_qna.do"; }
</script>
</head>

<body>
	<header>
		<jsp:include page="top.jsp" />
	</header>
	<article>
		<h2> 관리자 페이지 </h2>
		<div class="menu_item">
			<input type="button" value="가게 관리" onclick="admin_store()">
		</div>
		<div class="menu_item">
			<input type="button" value="문의 관리" onclick="admin_qna()">
		</div>
	</article>
</body>
</html>