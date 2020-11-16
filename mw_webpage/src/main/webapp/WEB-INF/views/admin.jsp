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
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/admin.css">
<link rel="stylesheet" type="text/css" href="/resources/css/resetAll.css">
<script type="text/javascript">
	function admin_store() {
		location.href = "admin_store.do";
	}
	function admin_qna() {
		location.href = "admin_qna.do";
	}
</script>
</head>

<body>
	<div><jsp:include page="top.jsp" /></div>
	<div class="wrap-all">
		<div class="info">
			<h2> 관리자 페이지 </h2>
		</div>
		<div class="user_menu">
			<div class="menu_item">
				<input type="button" value="가게 관리" onclick="admin_store()">
			</div>
			<!-- <div class="menu_item">
				<input type="button" value="문의 관리" onclick="admin_qna()">
			</div> -->
		</div>
	</div>
</body>
</html>