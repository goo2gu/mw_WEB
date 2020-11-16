<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>가게 추가</title>
<!-- favicon -->
<link rel="shortcut icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<link rel="icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/admin_store_add.css">
<link rel="stylesheet" type="text/css" href="/resources/css/resetAll.css">
<script type="text/javascript">
	function send_go(f) {
		// 유효성 검사
		if (f.elements[0].value == "") {
			alert("가게 이름을 입력하세요.");
			f.elements[0].focus();
			return;
		} else if (f.elements[1].value == "") {
			alert("카테고리를 선택하세요.");
			f.elements[1].focus();
			return;
		} else if (f.elements[5].value == "") {
			alert("가게 주소를 입력하세요.");
			f.elements[5].focus();
			return;
		} else if (f.elements[6].value == "") {
			alert("위도값을 입력하세요.");
			f.elements[6].focus();
			return;
		} else if (f.elements[7].value == "") {
			alert("경도값을 입력하세요.");
			f.elements[7].focus();
			return;
		} else if (f.elements[8].value == "") {
			alert("전화번호를 입력하세요.");
			f.elements[8].focus();
			return;
		} else if (f.elements[9].value == "") {
			alert("영업시간을 입력하세요.");
			f.elements[9].focus();
			return;
		} else if (f.elements[10].value == "") {
			alert("대표메뉴를 입력하세요.");
			f.elements[10].focus();
			return;
		} else {
			var sbmt = confirm("이대로 제출하시겠습니까?");
			if (sbmt == true) {
				f.action="storeAddOk.do";
				f.submit();
			}
		}
		
	}
	function list_go() { history.go(-1); }
</script>
</head>

<body>
	<div><jsp:include page="top.jsp" /></div>
	<div>
		<form method="post" encType="multipart/form-data">
			<div class="table_title">
				<h2>게시판 글쓰기</h2>
			</div>
			<table>
				<tbody>
					<tr>
						<th>가게 이름</th>
						<td><input type="text" name="s_name" placeholder="정확한 가게 이름을 기입"></td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td>
							<select name="s_cat_s">
								<option></option>
								<optgroup label="먹을거리">
									<option value="한식" selected="selected">한식</option>
									<option value="중식">중식</option>
									<option value="일식">일식</option>
									<option value="양식">양식</option>
									<option value="간편식">간편식</option>
									<option value="분식">분식</option>
									<option value="치킨">치킨</option>
									<option value="피자">피자</option>
									<option value="베이커리">베이커리</option>
									<option value="아시안">아시안</option>
								</optgroup>
								<optgroup label="마실거리">
									<option value="술집">술집</option>
									<option value="카페">카페</option>
								</optgroup>
								<optgroup label="즐길거리">
									<option value="PC방">PC방</option>
									<option value="노래방">노래방</option>
									<option value="스포츠">스포츠</option>
									<option value="기타">기타</option>
								</optgroup>
							</select>
						</td>
					</tr>
					<tr>
						<th>가게 설명</th>
						<td><input type="text" name="s_sub" placeholder="한 줄 설명 (최대 70자)"></td>
					</tr>
					<tr>
						<th>가게 사진</th>
						<td><input type="file" name="file" placeholder="파일 없음" /></td>
					</tr>
					<tr>
						<th>해시태그</th>
						<td>
							<input type="text" name="s_hashtag" placeholder="ex) #태그1+#태그2+#태그3">
						</td>
					</tr>
					<tr>
						<th>가게 위치</th>
						<td><input type="text" name="s_location" placeholder="ex) 서울 서대문구 거북골로 34"/></td>
					</tr>
					<tr>
						<th>위도값</th>
						<td><input type="text" name="s_lat" placeholder="ex) 37.579958 (소수점 6자리까지)"/></td>
					</tr>
					<tr>
						<th>경도값</th>
						<td><input type="text" name="s_lng" placeholder="ex) 126.923649 (소수점 6자리까지)"/></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="text" name="s_tel" placeholder="ex) 02-000-0000"/></td>
					</tr>
					<tr>
						<th>영업시간</th>
						<td><input type="text" name="s_hour" placeholder="ex) 10:00-26:00"/></td>
					</tr>
					<tr>
						<th>대표메뉴</th>
						<td><input type="text" name="s_menu" placeholder="ex) 메뉴1, 메뉴2, 메뉴3"/></td>
					</tr>
					<tr>
						<td colspan="2">
							<input class="btns" type="button" value="제출" onclick="send_go(this.form)">
							<input class="btns" type="button" value="뒤로" onclick="list_go()">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>