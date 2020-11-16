<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>문의 확인하기</title>
<!-- favicon -->
<link rel="shortcut icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<link rel="icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/qna_write.css">
<link rel="stylesheet" type="text/css" href="/resources/css/resetAll.css">
<script type="text/javascript">
	function list_go() {
		location.href = "qna.do";
	}
</script>
</head>

<body>
	<div>
		<jsp:include page="top.jsp" />
	</div>
	
	<div class="wrap-all">
		<form>
			<div class="qna_title">
				<h2>문의 확인하기</h2>
				<input type="text" name="q_title" value="${qna_detail.title}" placeholder="제목을 입력하세요.">
			</div>
			<div class="qna_context">
				<textarea name="q_content" placeholder="내용을 입력하세요.">${qna_detail.content}</textarea>
			</div>
			<div class="qna_submit">
				<input type="button" value="제출" onclick="qna_writeOk(f)">
				<input type="button" value="취소" onclick="list_go()">
			</div>
		</form>
	</div>
</body>
</html>