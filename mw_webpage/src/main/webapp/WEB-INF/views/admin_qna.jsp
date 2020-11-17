<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>문의 관리</title>
<!-- favicon -->
<link rel="shortcut icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<link rel="icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/admin_qna.css">
<link rel="stylesheet" type="text/css" href="/resources/css/resetAll.css">
<script type="text/javascript">
	function storeAdd() {
		location.href = "adminStoreAdd.do";
	}
</script>
</head>

<body>
	<header>
		<jsp:include page="top.jsp" />
	</header>
	<article>
		<h2>문의 관리</h2>
		<a class="mainBtn" href="admin.do">[메인]</a>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="3">문의가 존재하지 않습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="k" items="${list}" varStatus="vs">
							<tr>
								<td>${paging.totalRecord-((paging.nowPage-1)*paging.numPerPage+vs.index)}</td>
								<td><a href="admin_qna_onelist.do?q_idx=${k.q_idx}&m_idx=${k.m_idx}&cPage=${paging.nowPage}">${k.q_title}</a></td>
								<td>${k.q_regdate}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<div class="paging">
			<!-- btn_prev -->
			<c:choose>
				<c:when test="${paging.beginBlock <= paging.pagePerBlock}">
				</c:when>
				<c:otherwise>
					<a href="admin_qna.do?cPage=${paging.beginBlock - paging.pagePerBlock}">◀</a>
				</c:otherwise>
			</c:choose>
			<!-- page number -->
			<c:forEach begin="${paging.beginBlock}" end="${paging.endBlock}" step="1" var="k">
				<c:choose>
					<c:when test="${k == paging.nowPage}">
						<b>${k}</b>
					</c:when>
					<c:otherwise>
						<a href="dmin_qna.do?cPage=${k}">${k}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<!-- btn_next -->
			<c:choose>
				<c:when test="${paging.endBlock >= paging.totalPage}">
				</c:when>
				<c:otherwise>
					<a href="dmin_qna.do?cPage=${paging.beginBlock + paging.pagePerBlock}">▶</a>
				</c:otherwise>
			</c:choose>
		</div>
	</article>

</body>
</html>