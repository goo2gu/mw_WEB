<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>문의하기</title>
<!-- favicon -->
<link rel="shortcut icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<link rel="icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/qna.css">
<link rel="stylesheet" type="text/css" href="/resources/css/resetAll.css">
</head>

<body>
	<header>
		<jsp:include page="top.jsp" />
	</header>
	<article>
		<h2>문의 리스트</h2>
		<div class="btn">
			<input type="button" value="문의하기" onclick="location.href = 'qna_write.do'">
		</div>
		<c:choose>
			<c:when test="${empty q_list}">
				<div class="no_qna">
					<p>문의 내용이 없습니다.</p>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach var="k" items="${q_list}">
					<div class="qna_list">
						<div class="qna_one" onclick="location.href='qna_onelist.do?q_group=${k.q_group}'">
							<h4>${fn:substring(k.q_title,0,12)}</h4>
							<p>${fn:substring(k.q_regdate,0,10)}</p>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</article>
</body>
</html>
			
