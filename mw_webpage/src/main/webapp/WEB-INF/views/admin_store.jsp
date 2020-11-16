<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html>

<head>
<meta charset="UTF-8">
<title> 가게 관리 </title>
<!-- favicon -->
<link rel="shortcut icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<link rel="icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/admin_store.css">
<link rel="stylesheet" type="text/css" href="/resources/css/resetAll.css">
<script type="text/javascript">
	function admin_go() {
		location.href = "admin.do";
	}
	function storeAdd() {
		location.href = "adminStoreAdd.do";
	}
</script>
</head>

<body>
	<div><jsp:include page="top.jsp" /></div>
	<div class="wrap-all">
		<div class="info">
			<h2> 가게 관리 페이지 </h2>
		</div>
		<div class="btn">
			<div onclick="admin_go()">[메인]</div>
			<div onclick="storeAdd()">[추가]</div>
		</div>
		<div class="store_list">
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>가게이름</th>
						<th>좋아요</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="3"> 가게가 존재하지 않습니다. </td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="k" items="${list}" varStatus="vs">
								<tr>
									<td>${paging.totalRecord-((paging.nowPage-1)*paging.numPerPage+vs.index)}</td>
									<td><a href="admin_store_onelist.do?s_idx=${k.s_idx}&cPage=${paging.nowPage}">${k.s_name}</a></td>
									<td>${k.s_like}</td>
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
						<a href="admin_store.do?cPage=${paging.beginBlock - paging.pagePerBlock}">◀</a>
					</c:otherwise>
				</c:choose>
				<!-- page number -->
				<c:forEach begin="${paging.beginBlock}" end="${paging.endBlock}" step="1" var="k">
					<c:choose>
						<c:when test="${k == paging.nowPage}">
							<b>${k}</b>
						</c:when>
						<c:otherwise>
							<a href="admin_store.do?cPage=${k}">${k}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<!-- btn_next -->
				<c:choose>
					<c:when test="${paging.endBlock >= paging.totalPage}">
					</c:when>
					<c:otherwise>
						<a href="admin_store.do?cPage=${paging.beginBlock + paging.pagePerBlock}">▶</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

</body>
</html>