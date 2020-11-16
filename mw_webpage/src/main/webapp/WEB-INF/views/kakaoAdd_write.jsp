<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 - 추가 정보 입력</title>
<!-- favicon -->
<link rel="shortcut icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<link rel="icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/kakaoAdd_write.css">
<link rel="stylesheet" type="text/css" href="/resources/css/resetAll.css">
<!-- js -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
	// 파라미터 값 불러오기
	function getParameterByName(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
        return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    }
	var m_sns = getParameterByName('m_sns');
	var m_id = getParameterByName('m_id');
	alert("m_id : " + m_id);
	var m_email = getParameterByName('m_email');
	var m_profile_img = getParameterByName('m_profile_img');
	var m_thumbnail_img = getParameterByName('m_thumbnail_img');
	
	// 성별 중복 체크 방지
	function genderCheckOnly(chk) {
	    var obj = document.getElementsByName("m_gender");
	    for(var i = 0; i < obj.length; i++){
	        if(obj[i] != chk){
	            obj[i].checked = false;
	        }
	    }
	}
	
	function kakaoAdd_go(f) {
		var m_email = document.getElementById("inputEmail").value;
		var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		// 유효성 검사
		if (f.elements[0].value == "") {
	    	alert("이메일을 입력해주세요.");
	    	f.elements[0].focus();
			return;
	    } else if (!emailRule.test(m_email)) {
	    	alert("이메일 형식이 올바르지 않습니다. 다시 입력해주세요.");
	    	f.elements[0].focus();
			return;
	    } else if (f.elements[1].value == "") {
			alert("닉네임을 입력해주세요.");
	    } else if (!$("input:checked[name='agreeInfo']").is(":checked")) {
			alert("가입을 원하시면 정보 제공 동의 항목에 체크해주세요.");
		} else {
			var submit = confirm("이대로 제출하시겠습니까?");
			if (submit == true) {
				f.action="kakaoAdd_ok.do?m_sns="+m_sns+"&m_id="+m_id+"&m_email="+m_email+"&m_profile_img="+m_profile_img+"&m_thumbnail_img="+m_thumbnail_img;
				f.submit();
			}
		}
	}
	function main_go() {
		var sbmt = confirm("회원 가입을 취소하시겠습니까?");
		if (sbmt == true) {
			location.href = "main.do";
		}
	}
</script>
</head>
<body>
	<form method="post">
		<div class="table_title">
			<h2>회원 정보</h2>
		</div>
		<table>
			<tbody>
				<tr>
					<th>이메일<br><b>[필수]</b></th>
					<td>
						<c:choose>
							<c:when test="${empty k_mvo.m_email}">
								<input id="inputEmail" type="email" name="m_email" placeholder="이메일 주소를 입력해주세요.">
							</c:when>
							<c:otherwise>
								<input id="inputEmail" type="email" name="m_email" value="${k_mvo.m_email}" disabled="disabled">
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>닉네임<br><b>[필수]</b></th>
					<td><input type="text" name="m_nickname" value="${k_mvo.m_nickname}"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<label><input type="checkbox" name="m_gender" value="male" onclick="genderCheckOnly(this)">&nbsp;&nbsp;남성</label>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label><input type="checkbox" name="m_gender" value="female" onclick="genderCheckOnly(this)">&nbsp;&nbsp;여성</label>
					</td>
				</tr>
				<tr>
					<th>연령대</th>
					<td><select name="m_age_range">
							<option label="본인의 연령대를 선택해주세요." disabled="disabled" selected="selected"></option>
							<option value="10-14">10-14</option>
							<option value="15-19">15-19</option>
							<option value="20-24">20-24</option>
							<option value="25-29">25-29</option>
							<option value="30-39">30-39</option>
							<option value="40-49">40-49</option>
							<option value="50-59">50-59</option>
							<option value="60대 이상">60대 이상</option>
					</select></td>
				</tr>
			</tbody>
		</table>
		<div class="agree">
			<label><input type="checkbox" name="agreeInfo">위의 정보를 제공하는 것에 동의합니다.</label>
		</div>
		<div class="submit">
			<input class="btns" type="button" value="제출" onclick="kakaoAdd_go(this.form)">
			<input class="btns" type="button" value="취소" onclick="main_go()">
		</div>
	</form>
</body>
</html>