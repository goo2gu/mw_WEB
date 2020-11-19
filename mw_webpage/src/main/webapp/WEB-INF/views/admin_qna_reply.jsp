<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>문의 상세</title>
<!-- favicon -->
<link rel="shortcut icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<link rel="icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/admin_qna_reply.css">
<link rel="stylesheet" type="text/css" href="/resources/css/resetAll.css">
<!-- js -->
<script type="text/javascript">
function qna_replyOk(f) {
	var q_title = f.q_title.value;
	var q_content = f.q_content.value;
	if(q_title == "") {
		alert("제목을 입력해주세요.");
		f.q_title.value="";
		f.q_title.focus();
		return;
	} else if (q_content == "") {
		alert("내용을 입력해주세요.");
		f.q_content.value="";
		f.q_content.focus();
		return;
	} else {
		var sbmt = confirm("이대로 제출하시겠습니까?");
		if (sbmt == true) {
			f.action = "admin_qna_reply_ok.do";
			f.submit();
		}
	}
}
function list_go() { location.href = "qna.do"; }
</script>
</head>

<body>
	<header>
		<jsp:include page="top.jsp" />
	</header>
	<article>
		<h2>답변하기</h2>
			<form>
				<div class="qna_title">
					<input type="text" name="q_title" value="[re] ${q_title}">
				</div>
				<div class="qna_context">
					<textarea name="q_content" placeholder="내용을 입력하세요." ></textarea>
				</div>
				<div class="qna_submit">
					<input type="hidden" name="q_group" value="${q_group}">
					<input type="hidden" name="cPage" value="${cPage}"> 
					<input type="button" value="제출" onclick="qna_replyOk(this.form)">
					<input type="button" value="취소" onclick="list_go()">
				</div>
			</form>
	</article>
</body>
</html>