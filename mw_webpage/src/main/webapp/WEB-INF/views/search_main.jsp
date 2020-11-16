<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>검색하기</title>
<!-- favicon -->
<link rel="shortcut icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<link rel="icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/resetAll.css">
<link rel="stylesheet" type="text/css" href="/resources/css/search_main.css">
<script type="text/javascript">

	// 진입 시 검색창에 포커스 고정
	$(document).ready(function(){ $("#searchBar").focus(); });
	
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
	function back_go() {
		history.go(-1);
	}
	/* 992px 이상에서 현재 페이지 접속 시 메인 페이지로 이동  */
	var innerWidth = window.innerWidth;
	if (innerWidth >= 992) {
		location.href="main.do";
	}
</script>
</head>
	
<body>
	<form>
		<div class="search_main_searchbar">
			<img alt="back" src="/resources/images/back_icon.svg" onclick="back_go()">
			<p><input id="searchBar" type="text" name="keyWord" placeholder="검색어를 입력하세요."></p>
			<input type="image" src="/resources/images/search_icon.svg" alt="search" onclick="searchBtn(this.form)">
		</div>
	</form>
	
	<div class="search_main_items">
		<div class="search_main_recent">
			<h4>최근 검색</h4>
			<ul>
				<li>
					<div class="search_main_item">
						마카롱
					</div>
				</li>
				<li>
					<div class="search_main_item">
						런드리즈
					</div>
				</li>
				<li>
					<div class="search_main_item">
						감자탕
					</div>
				</li>
			</ul>
		</div>
		
		<div class="search_main_recommand">
			<h4>추천 검색</h4>
			<ul>
				<li>
					<div class="search_main_item">
						베가보쌈
					</div>
				</li>
				<li>
					<div class="search_main_item">
						단체
					</div>
				</li>
				<li>
					<div class="search_main_item">
						떡볶이 맛집
					</div>
				</li>
			</ul>
		</div>
	</div>

	<div class="goBack" onclick="back_go()">메인화면으로</div>

</body>
</html>