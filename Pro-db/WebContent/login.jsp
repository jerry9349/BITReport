<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인 폼</title>
</head>
<body>
<!-- 로그인 화면으로 돌아오면 세션 종료 -->
	<% session.invalidate(); %>

<!-- 로그인 정보는 db 저장하는 곳으로 갑니다. -->
	<form method="post" action="db3.jsp">
		<table border="1px">
			<tr>
				<td colspan="2" align="center">
					<h1>로그인 페이지</h1>
				</td>
			</tr>

			<tr>
				<td>아이디 :</td>
				<td>
				<input type="text" id="my_id" name="my_id" 
				value="아이디" onfocus="this.value=''" required><!-- required는 필수항목 -->
				</td>
			</tr>

			<tr>
				<td>비밀번호 :</td>
				<td>
				<input type="text" id="my_pwd" name="my_pwd" value="비밀번호"
					onfocus="this.value='', this.type='password'" required>
					</td>
			</tr>

			<tr>
				<td colspan="2">
				<input type="submit" value="로그인">
					</form>
					<form action="join.jsp">
						<input type="submit" value="회원가입">
					</form></td>
			</tr>
		</table>
	</form>


</body>
</html>