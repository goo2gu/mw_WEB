<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
<!-- js -->
<script type="text/javascript">
	function qna_write() { location.href = "qna_write.do"; }
	function qna_onelist() {
		f.action = "qna_onelist.do";
		f.submit;
	}
</script>
</head>

<body>
	<header>
		<jsp:include page="top.jsp" />
	</header>
	<article>
		<div class="qna_title">
			<h2>문의 리스트</h2>
			<input type="button" value="문의하기" onclick="qna_write()">
		</div>
		<c:choose>
			<c:when test="${empty q_list}">
				<div class="no_qna">
					<p>문의 내용이 없습니다.</p>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach var="k" items="${q_list}">
					<form>
						<div class="qna_list" onclick="qna_onelist(this.form)">
							<div class="qna_one">
								<h4>${k.q_title}</h4>
								<p>${k.q_regdate}</p>
								<input type="hidden" name="q_idx" value="${k.q_idx}">
							</div>
						</div>
					</form>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</article>
</body>
</html>
			
