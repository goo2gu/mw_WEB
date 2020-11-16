<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>가게 상세</title>
<!-- favicon -->
<link rel="shortcut icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<link rel="icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/store_detail.css">
<link rel="stylesheet" type="text/css" href="/resources/css/resetAll.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	function like_store() {
		location.href = "add_store_like.do";
	}
	function like_review() {
		location.href = "add_store_review.do";
	}
	function kMap_search() {
		var k_url = "https://map.kakao.com/link/search/${svo.s_location}";
		newPage = window.open(k_url);
	}
	function search_hash(f) {
		var keyWord = f.keyWord.value;
		f.action = "search.do";
		f.submit();
	}
</script>
</head>

<body>
	
	<div>
		<jsp:include page="top.jsp" />
	</div>
	
	<div class="wrap-all">
		<div class="header">
			<div class="header_top">
				<div class="info_title">
					<h2>${svo.s_name}&nbsp;<span class="title_cat">${svo.s_cat_s}</span></h2>
					<h5>${svo.s_sub}</h5>
				</div>
				<div class="numbers">
					<div>
						<h5>${svo.s_like}&nbsp;</h5>
						<img alt="like" src="/resources/images/like.svg">
					</div>
					<div>
						<h5>${svo.s_comment}&nbsp;</h5>
						<img alt="write" src="/resources/images/write.svg">
					</div>
					<div>
						<h5>${svo.s_view}&nbsp;</h5>
						<img alt="view" src="/resources/images/watch.svg">
					</div>
				</div>
			</div>
			
			<div class="photos">
				<div class="pic_container">
					<img alt="" src="/resources/images/${svo.s_img}">
				</div>
			</div>
			
			<div class="hashtag">
				<c:set var="hash" value="${fn:split(svo.s_hashtag, '+')}"></c:set>
				<c:forEach var="item" items="${hash}">
					<form>
						<input class="hash_item" type="button" value="${item}" onclick="search_hash(this.form)">
						<input class="hash_item" type="hidden" name="keyWord" value="${item}">
					</form>
				</c:forEach>
			</div>
			
		</div>
		
			<hr class="only_mobile">
		
			<div class="brief">
				<div class="brief_item" onclick="kMap_search()">
					<img alt="search" src="/resources/images/kakaomap_favicon.ico">
					<h5>카카오맵</h5>
				</div>
				<div id="linkModalBtn" class="brief_item">
					<img alt="search" src="/resources/images/share.svg">
					<h5>공유</h5>
				</div>
				<div class="brief_item">
					<img alt="search" src="/resources/images/like_before.svg">
					<h5>좋아요</h5>
				</div>
			</div>
			
			<div id="linkModal" class="linkModal">
				<div class="linkModal_container">
					<span class="linkCloseBtn">&times;</span>
					<h2>공유하기</h2>
					<div class="linkModalIn">
						<form method="post">
							<div class="pageInfo_container">
								<div class="pageInfo">
									<input id="linkArea" class="linkArea" type="text">
									<input id="linkCopyBtn" class="linkCopyBtn" type="button" value="클립보드로 복사">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			
			<!-- 공유 링크 Modal -->
			<script type="text/javascript">
				var modal = document.getElementById("linkModal");
				var btn = document.getElementById("linkModalBtn");
				var span = document.getElementsByClassName("linkCloseBtn")[0];
				
				var url = window.document.URL;
				var linkBox = document.getElementById("linkArea");
				var copyBtn = document.getElementById("linkCopyBtn");
				
				var innerWidth = window.innerWidth;
	
				btn.onclick = function() {
					modal.style.display = "block";
					linkBox.value = url;
				}
				copyBtn.onclick = function() {
					linkBox.select();
					document.execCommand('copy');
					linkBox.setSelectionRange(0,0);
					alert('현재 페이지의 주소를 클립보드에 복사했습니다.');
				}
				span.onclick = function() {
					modal.style.display = "none";
					
				}
				window.onclick = function(event) {
					if (event.target == modal) {
						modal.style.display = "none";
					}
				}
			</script>
			
		<hr class="only_mobile">
		
		<div class="article">
			<div class="store_info">
				<h2>가게 정보</h2>
				<ul>
					<li><b>가게위치&nbsp;&nbsp;</b>${svo.s_location}</li>
					<li><b>전화번호&nbsp;&nbsp;</b>${svo.s_tel}</li>
					<li><b>영업시간&nbsp;&nbsp;</b>${svo.s_hour}</li>
					<li><b>대표메뉴&nbsp;&nbsp;</b>${svo.s_menu}</li>
				</ul>
			</div>
			
			<hr class="only_mobile">
			
			<div class="store_map">
				<h2>지도</h2>
				<div id="kakaoMap" class="kMap"></div>
				<!-- KakaoMap API -->
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ae5c67f6976f2bc745bd1a19ada76684"></script>
				<script>
					var container = document.getElementById('kakaoMap'); 			// 지도를 담을 영역의 DOM 레퍼런스
					var options = { 												// 지도를 생성할 때 필요한 기본 옵션
						center: new kakao.maps.LatLng(${svo.s_lat}, ${svo.s_lng}), 	// 지도의 중심좌표.
						draggable: false,											// 지도 이동 X
						level: 3 													// 지도의 레벨(확대, 축소 정도)
					};
					var map = new kakao.maps.Map(container, options); 				// 지도 생성 및 객체 리턴
					
					// kakaoMap controller
					var mapTypeControl = new kakao.maps.MapTypeControl();
					map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
					var zoomControl = new kakao.maps.ZoomControl();
					map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
					
					// marker
					var markerPosition  = new kakao.maps.LatLng(${svo.s_lat}, ${svo.s_lng}); 

					var marker = new kakao.maps.Marker({
					    position: markerPosition
					});

					marker.setMap(map);												// 마커 생성
					
					// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
					var iwContent = '<div style="padding:6px; color:#e8a761; font-size:20px; font-family:GmarketSansMedium;">[${svo.s_name}]<br><a href="https://map.kakao.com/link/map/${svo.s_name},${svo.s_lat}, ${svo.s_lng}" style="color:#777; font-size:17px; font-family:GmarketSansLight;" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/${svo.s_name},${svo.s_lat}, ${svo.s_lng}" style="color:#777; font-size:17px; font-family:GmarketSansLight;" target="_blank">길찾기</a></div>',
					    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다
	
					// 인포윈도우 생성
					var infowindow = new kakao.maps.InfoWindow({
					    position : iwPosition, 
					    content : iwContent 
					});
					  
					// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
					infowindow.open(map, marker); 
				</script>
			</div>
			
			<hr class="only_mobile">
			
			<div class="store_review">
				<h2>리뷰</h2>
				<div class="store_review_context">
					<div class="reviewer">
						<div class="reviewer_info">
							<h5><b>작성자 이름</b></h5>
							<p>방문 일자가 여기에 표시됩니다.</p>
						</div>
						<div class="review_like">
							<img alt="like" src="/resources/images/like.svg" onclick="like_review()">
							<p>109</p>
						</div>
					</div>
					<hr>
					<div class="review_context">
						<p>
							리뷰 내용이 여기에 표시됩니다. 리뷰 내용이 여기에 표시됩니다. 리뷰 내용이 여기에 표시됩니다.
						</p>
					</div>
				</div>
				<div class="store_review_context">
					<div class="reviewer">
						<div class="reviewer_info">
							<h5><b>작성자 이름</b></h5>
							<p>방문 일자가 여기에 표시됩니다.</p>
						</div>
						<div class="review_like">
							<img alt="like" src="/resources/images/like.svg" onclick="like_review()">
							<p>98</p>
						</div>
					</div>
					<hr>
					<div class="review_context">
						<p>
							리뷰 내용이 여기에 표시됩니다.
						</p>
					</div>
				</div>
				<div class="store_review_context">
					<div class="reviewer">
						<div class="reviewer_info">
							<h5><b>작성자 이름</b></h5>
							<p>방문 일자가 여기에 표시됩니다.</p>
						</div>
						<div class="review_like">
							<img alt="like" src="/resources/images/like.svg" onclick="like_review()">
							<p>87</p>
						</div>
					</div>
					<hr>
					<div class="review_context">
						<p>
							리뷰 내용이 여기에 표시됩니다. 리뷰 내용이 여기에 표시됩니다.
						</p>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	
</body>
</html>