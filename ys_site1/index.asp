<%
'//==========================
'	인코딩 설정
'//==========================

	Session.CodePage	= 65001		
	Response.CodePage	= 65001
	Response.CharSet	= "UTF-8"
%>
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>회원 로그인</title>
 <script language="JavaScript">
 function Check()
 {
	 if(Member.user_id.value.length < 1) {
		 alert("아이디를 입력하세요.");
		 Member.user_id.focus();
		 return false;
	 }

	 if(Member.user_password.value.length < 1) {
		 alert("비밀번호를 입력하세요.");
		 Member.user_password.focus();
		 return false;
	 }
	 Member.submit();
 }
 </script>

 </head>
 <body>
 <center><font size="3"><b>user_info</b></font></center>
 
 <table border="0" width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td><hr size="1" noshade>
		</td>
	</tr>
</table>

<form name="Member" method="post" action="index_ok.asp">

<table align="center" width="300" border="0" cellpadding="10" cellspacing="0">
	<tr>
		<td bgcolor="cccccc" align="right">
			<font size="2">ID : </font>
		</td>
		<td bgcolor="cccccc" align="center">
			<input type="text" maxlength="10" size="10" name="user_id">
		</td>
		<td bgcolor="cccccc" align="left">
		</td>
	</tr>
	<tr>
		<td bgcolor="cccccc" align="right">
			<font size="2">비밀번호 : </font>
		</td>
		<td bgcolor="cccccc" align="center">
			<input type="password" maxlength="10" size="10" name="user_password">
		</td>
		<td bgcolor="cccccc" align="left">
			<input onclick="Check()" type="button" value="로  그  인">
		</td>
	</tr>
</table>
</form>
</body>
</html>
