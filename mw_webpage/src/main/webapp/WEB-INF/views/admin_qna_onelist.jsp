<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>문의 상세</title>
<!-- favicon -->
<link rel="shortcut icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<link rel="icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/admin_qna_onelist.css">
<link rel="stylesheet" type="text/css" href="/resources/css/resetAll.css">
<script type="text/javascript">
	function qna_reply(f) { 
		f.action = "admin_qna_reply.do?cPage=${cPage}";
		f.submit();
	}
	function admin_qna() { location.href = "admin_qna.do?cPage=${cPage}"; }
</script>
</head>

<body>
	<header>
		<jsp:include page="top.jsp" />
	</header>
	<article>
		<h2>문의 내용</h2>
		<c:choose>
		<!-- 답변 O -->
			<c:when test="${fn:length(q_list) > 0}">
				<c:forEach var="k" items="q_list">
					<table>
						<tbody>
							<tr>
								<th>제목</th>
								<td>${k.q_title}</td>
							</tr>
							<tr>
								<th>작성자</th>
								<td>${m_nickname}</td>
							</tr>
							<tr>
								<th>작성일</th>
								<td>${k.q_regdate}</td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea>${k.q_content}</textarea></td>
							</tr>
						</tbody>
					</table>
				</c:forEach>
				<div class="onelistBtn">
					<input type="button" value="목록으로" onclick="admin_qna()">
				</div>
			</c:when>
		<!-- 답변 X -->
			<c:otherwise>
				<form>
					<c:forEach var="k" items="q_list">
						<table>
							<tbody>
								<tr>
									<th>제목</th>
									<td>${k.q_title}</td>
								</tr>
								<tr>
									<th>작성자</th>
									<td>${m_nickname}</td>
								</tr>
								<tr>
									<th>작성일</th>
									<td>${k.q_regdate}</td>
								</tr>
								<tr>
									<th>내용</th>
									<td><textarea>${k.q_content}</textarea></td>
								</tr>
							</tbody>
						</table>
						<div class="onelistBtn">
							<input type="hidden" name="m_idx" value="${k.m_idx}">
							<input type="hidden" name="q_title" value="${k.q_title}">
							<input type="hidden" name="q_group" value="${k.q_group}">
							<input type="button" value="답변하기" onclick="qna_reply(this.form)">
							<input type="button" value="목록으로" onclick="admin_qna()">
						</div>
					</c:forEach>
				</form>
			</c:otherwise>
		</c:choose>
	</article>
</body>
</html>