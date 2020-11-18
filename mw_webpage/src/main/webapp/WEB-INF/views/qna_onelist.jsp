<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>문의 내용</title>
<!-- favicon -->
<link rel="shortcut icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<link rel="icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/qna_onelist.css">
<link rel="stylesheet" type="text/css" href="/resources/css/resetAll.css">
<script type="text/javascript">
	function list_go() {
		location.href = "qna.do";
	}
</script>
</head>

<body>
	<header>
		<jsp:include page="top.jsp" />
	</header>
	<article>
		<h2>문의 내용</h2>
		<c:forEach var="k" items="${qvo}">
			<table>
				<tbody>
					<tr>
						<th>제목</th>
						<td>${k.q_title}</td>
					</tr>
					<tr>
						<th>작성일</th>
						<td>${fn:substring(k.q_regdate,0,16)}</td>
					</tr>
					<tr>
						<th colspan="2">내용</th>
					</tr>
					<tr>
						<td class="context" colspan="2"><pre>${k.q_content}</pre></td>
					</tr>
				</tbody>
			</table>
			<div class="btn">
				<input type="button" value="목록" onclick="list_go()">
			</div>
		</c:forEach>
	</article>
</body>
</html>
