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
		if (f.q_title.value == "") {
			alert("제목을 입력하세요.");
			f.q_title.focus();
			return;
		} else if (f.q_content.value == "") {
			alert("내용을 입력하세요.");
			f.q_content.focus();
			return;
		} else {
			var sbmt = confirm("답변 제출 후 수정이 불가능합니다. 이대로 제출하시겠습니까?");
			if (sbmt == true) {
				f.action = "admin_qna_reply_ok.do?cPage=${cPage}";
				f.submit();
			}
		}
	}
	function back_go() {
		var sbmt = confirm("답변 작성을 취소하시겠습니까?");
		if (sbmt == true) {
			history.go(-1);
		}
	}
</script>
</head>

<body>
	<header>
		<jsp:include page="top.jsp" />
	</header>
	<article>
		<h2>문의 내용</h2>
			<form>
				<table>
					<tbody>
						<tr>
							<th>제목</th>
							<td>
								<input type="text" name="q_title" value="[re] ${q_title}">
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<textarea name="q_content"></textarea>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		<div class="onelistBtn">
			<input type="hidden" name="m_idx" value="admin">
			<input type="hidden" name="q_group" value="${q_group}">
			<input type="button" value="제출" onclick="qna_replyOk(this.form)">
			<input type="button" value="취소" onclick="admin_qna()">
		</div>
	</article>
</body>
</html>