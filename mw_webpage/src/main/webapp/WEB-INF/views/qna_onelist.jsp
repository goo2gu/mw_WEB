<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		<c:forEach var="k" items="${q_onelist}">
			<table>
				<tbody>
					<tr>
						<th>제목</th>
						<td>${q_title}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>${q_content}</td>
					</tr>
				</tbody>
			</table>
		</c:forEach>
	</article>
</body>
</html>
