<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 가게 상세 정보</title>
<!-- favicon -->
<link rel="shortcut icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<link rel="icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/admin_store_onelist.css">
<link rel="stylesheet" type="text/css" href="/resources/css/resetAll.css">
<script type="text/javascript">
	function update_go() {
		location.href = "admin_store_update.do?cPage=${cPage}";
	}
	function list_go() {
		history.go(-1);
	}
	function delete_go() {
		location.href = "admin_store_delete.do?cPage=${cPage}";
	}
</script>
</head>

<body>
	<div><jsp:include page="top.jsp" /></div>
	<div>
		<div class="table_title">
			<h2>가게 상세 정보</h2>
		</div>
		<table>
			<tbody>
				<tr>
					<th>가게 이름</th>
					<td><p>${svo.s_name}</p></td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td><p>${svo.s_cat_s}</p></td>
				</tr>
				<tr>
					<th>가게 설명</th>
					<td><p>${svo.s_sub}</p></td>
				</tr>
				<tr>
					<th>가게 사진</th>
					<td><p>${svo.s_img}</p></td>
				</tr>
				<tr>
					<th>해시태그</th>
					<td>
						<div style="display: flex; justify-content: center;">
							<c:set var="hash" value="${fn:split(svo.s_hashtag, '+')}"></c:set>
							<c:forEach var="item" items="${hash}">
								<div> <p>${item}&nbsp;</p> </div>
							</c:forEach>
						</div>
					</td>
				</tr>
				<tr>
					<th>가게 위치</th>
					<td><p>${svo.s_location}</p></td>
				</tr>
				<tr>
					<th>위도값</th>
					<td><p>${svo.s_lat}</p></td>
				</tr>
				<tr>
					<th>경도값</th>
					<td><p>${svo.s_lng}</p></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><p>${svo.s_tel}</p></td>
				</tr>
				<tr>
					<th>영업시간</th>
					<td><p>${svo.s_hour}</p></td>
				</tr>
				<tr>
					<th>대표메뉴</th>
					<td><p>${svo.s_menu}</p></td>
				</tr>
				<tr>
					<td colspan="2">
						<input class="btns" type="button" value="수정" onclick="update_go()">
						<input class="btns" type="button" value="목록" onclick="list_go()">
						<input class="btns" type="button" value="삭제" onclick="delete_go()">
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>