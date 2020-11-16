<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>카테고리 검색</title>
<!-- favicon -->
<link rel="shortcut icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<link rel="icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/category_res.css">
<link rel="stylesheet" type="text/css" href="/resources/css/resetAll.css">
</head>

<body>
	
	<div class="cardview">
		<c:choose>
			<c:when test="${empty store_list}">
				<div class="noRes">
					<p> 표시할 결과가 없습니다. </p>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach var="k" items="${store_list}">
					<div class="card" onclick="location.href='store_detail.do?s_idx=${k.s_idx}'">
						<img alt="${k.s_img}" src="/resources/images/${k.s_img}">
						<div class="text_container">
							<h4><b>${k.s_name}</b></h4>
							<div class="texts">
								<c:set var="hash" value="${fn:split(k.s_hashtag, '+')}"></c:set>
								<c:forEach var="item" end="2" items="${hash}">
									${item}
								</c:forEach>
							</div>
							<div class="shop_info">
								<img alt="like" src="/resources/images/like.svg">
								<h5>${k.s_like}</h5>
								<img alt="review" src="/resources/images/write.svg">
								<h5>${k.s_comment}</h5>
								<img alt="watch" src="/resources/images/watch.svg">
								<h5>${k.s_view}</h5>
							</div> <!-- shop_info -->
						</div> <!-- text-container -->
					</div> <!-- card -->
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	
</body>
</html>