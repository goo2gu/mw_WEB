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
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/admin_qna_onelist.css">
<link rel="stylesheet" type="text/css" href="/resources/css/resetAll.css">
<!-- js -->
<script type="text/javascript">
	function qna_reply(f) {
		f.action = "admin_qna_reply.do";
		f.submit();
	}
	function back_go() {
		history.go(-1);
	}
</script>
</head>

<body>
	<header>
		<jsp:include page="top.jsp" />
	</header>
	<article>
		<h2>문의 내용</h2>
		<c:choose>
			<c:when test="${fn:length(q_list) > 1}">
				<c:forEach var="k" items="${q_list}">
					<table>
						<tbody>
							<tr>
								<th>제목</th>
								<td>${k.q_title}</td>
							</tr>
							<tr>
								<th>작성일</th>
								<td>${k.q_regdate}</td>
							</tr>
							<tr>
								<th colspan="2">내용</th>
							</tr>
							<tr>
								<td colspan="2"><pre>${k.q_content}</pre></td>
							</tr>
						</tbody>
					</table>
				</c:forEach>
				<div class="onelistBtn">
					<input type="button" value="목록" onclick="back_go()">
				</div>
			</c:when>
			<c:otherwise>
				<form>
					<c:forEach var="k" items="${q_list}">
						<table>
							<tbody>
								<tr>
									<th>제목</th>
									<td>${k.q_title}</td>
								</tr>
								<tr>
									<th>작성일</th>
									<td>${k.q_regdate}</td>
								</tr>
								<tr>
									<th colspan="2">내용</th>
								</tr>
								<tr>
									<td colspan="2"><pre>${k.q_content}</pre></td>
								</tr>
							</tbody>
						</table>
						<div class="onelistBtn">
							<input type="hidden" name="m_idx" value="${k.m_idx}"> 
							<input type="hidden" name="q_title" value="${k.q_title}"> 
							<input type="hidden" name="q_group" value="${k.q_group}"> 
							<input type="hidden" name="cPage" value="${cPage}"> 
							<input type="button" value="답변" onclick="qna_reply(this.form)">
							<input type="button" value="목록" onclick="back_go()">
						</div>
					</c:forEach>
				</form>
			</c:otherwise>
		</c:choose>
	</article>
</body>
</html>