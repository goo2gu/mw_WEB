<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>명월-명지월드의 모든 것</title>
<!-- favicon -->
<link rel="shortcut icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<link rel="icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<link rel="stylesheet" type="text/css" href="/resources/css/resetAll.css">
<!-- slick css -->
<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />
<script src="http://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha256-k2WSCIexGzOj3Euiig+TlR8gA0EmPjuc79OEeY5L45g=" crossorigin="anonymous" ></script>
<script type="text/javascript" src="http://kenwheeler.github.io/slick/slick/slick.min.js"></script>
<script type="text/javascript">
	function searchBtn(f) {
		// 유효성 검사
		var keyWord = f.keyWord.value;
		if(keyWord == "") {
			alert("검색할 단어를 입력해주세요.");
			f.keyWord.value="";
			f.keyWord.focus();
			return;
		} else {
			f.action = "search.do";
			f.submit();
		}
	}
	function search_main() { location.href = "search_main.do"; }
	function category_eat() { location.href = "category_eat.do?cat=먹을거리"; }
	function category_drink() { location.href = "category_drink.do?cat=마실거리"; }
	function category_play() { location.href = "category_play.do?cat=즐길거리"; }
</script>
</head>

<body>
	<header>
		<jsp:include page="top.jsp" />
	</header>
	
	<!-- slick -->
	<script type="text/javascript">
		$(document).ready(function() {
			$('.main_banner').slick({
				autoplay : true,
				arrows : false,
				dots : true,
				appendDots : $('banner_container'),
				speed : 900, 			/* 이미지 슬라이딩 시 걸리는 시간 */
				infinite : true,
				autoplaySpeed : 4000, 	/* 다른 이미지로 넘어 갈 때 걸리는 시간 */
				slidesToShow : 1,
				slidesToScroll : 1,
				draggable: true,
				fade : false
			});
		});
	</script>
		
	<article class="wrap-all">
		<!-- 슬라이드 배너 -->
		<div class="banner_container">
			<div class="main_banner">
				<div><img src="/resources/images/banner01.png"></div>
				<div><img src="/resources/images/banner02.png"></div>
				<div><img src="/resources/images/banner03.png"></div>
			</div>
		</div>
		
		<!-- 검색창 이벤트 처리 -->
		<script type="text/javascript">
			$(function() {
				var innerWidth = window.innerWidth;
				$("#search_bar").click(function() {
					if (innerWidth < 992) {
						location.href = "search_main.do";
					}
					if (innerWidth >= 992) {
						$("#popUpContent").show(3000);
					}
				});
				$(document).mouseup(function (e){
				    var container = $("#popUpContent");
				    if(container.has(e.target).length === 0){
				    	container.hide(0);
				    }
				});
			});
		</script>
		
		<!-- 검색창 -->
		<form>
			<div id="search_bar" class="search-bar">
				<p><input type="text" name="keyWord" placeholder="검색할 단어를 입력하세요."></p>
				<input type="image" src="/resources/images/search_icon.svg" alt="search" onclick="searchBtn(this.form)">
			</div>
	
			<div id="modal" class="search_modal">
				<div id="popUpContent" class="search-bar-click" style="display: none;">
					<div class="want_search">
						<h5>추천 검색어</h5>
						<p>검색어1</p>
						<p>검색어2</p>
						<p>검색어3</p>
					</div>
				</div>
			</div>
		</form>
		
		<!-- 카테고리 버튼 -->
		<div class="category">
			<div onclick="category_eat()">먹을거리</div>
			<div onclick="category_drink()">마실거리</div>
			<div onclick="category_play()">즐길거리</div>
		</div>
		
		<!-- 가게 리스트 -->
		<div class="story">
			<h3> 인기 리스트 </h3>
		</div>
		<div class="cardview">
			<c:forEach var="k" end="5" items="${hotList}">
				<div class="card" onclick="location.href='store_detail.do?s_idx=${k.s_idx}'">
					<img alt="${k.s_img}" src="/resources/images/${k.s_img}">
					<div class="text_container">
						<h4><b>${k.s_name}</b></h4>
						<div class="texts">
							<c:set var="hash" value="${fn:split(k.s_hashtag, '+')}"></c:set>
							<c:forEach var="item" end="1" items="${hash}">
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
		</div>
	</article>	<!-- 본문 끝 -->
</body>
</html>