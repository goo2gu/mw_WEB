<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- favicon -->
<link rel="shortcut icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<link rel="icon" href="/resources/images/mw_favicon.ico" type="image/x-icon">
<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/user_email_add.css">
<link rel="stylesheet" type="text/css" href="/resources/css/resetAll.css">
</head>
<body>

	<form method="post" encType="multipart/form-data">
		<h2> 회원가입 </h2>
		<table>
			<tr>
				<th>이름</th>
				<td><input type="text" name="m_name" placeholder="이름을 입력하세요."></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" name="m_nickname" placeholder="이름을 입력하세요."></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="m_id" placeholder="아이디를 입력하세요."></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="m_pw" placeholder="비밀번호를 입력하세요."></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" placeholder="비밀번호를 다시 입력하세요."></td>
			</tr>			
			<tr>
				<th>이메일</th>
				<td><input type="text" name="m_email" placeholder="이메일 주소를 입력하세요."></td>
			</tr>
			<tr>
				<th>프로필</th>
				<td><input type="file" name="m_file" value=""></td>
			</tr>
			<tr>
				<th>프로필</th>
				<td><input type="file" name="m_file" /></td>
			</tr>
		</table>
	</form>

</body>
</html>