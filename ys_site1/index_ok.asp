<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>회원 인증</title>
 </head>
 <body>

 <center><font size="3"><b> 회원 인증 </b></font>
 
 <table border="0" width="600" cellpadding="0" cellspacing="0">
	<tr>
		<td><hr size="1" noshade>
		</td>
	</tr>
</table>

<table cellspacing="0" cellpadding="0" align="center" border="0">

<%
	user_id			= Request("user_id")
	user_password	= Request("user_password")
	
	If (user_id = "") or (user_password = "") then
		
%>
	<tr>
		<td align="center">
			<font size="2">ID와 비밀번호를 입력하세요.</font>
		</td>
	</tr>
	<tr>
		<td align="center">
			<button type="Button" Name="Btn1" onClick="location.href='index.asp'">로그인 페이지</button>
		</td>
	</tr>
<%
	Else
	strConnect = "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=ys_site;Initial Catalog=ys_site1;Data Source=61.85.36.69,3433;password=ys_20190603"
	Set ConnDB = Server.CreateObject("ADODB.Connection")
	ConnDB.open strConnect
	Set objRs = Server.CreateObject("ADODB.RecordSet")
	objRs.open "SELECT user_id, user_password FROM user_info where user_id='" & user_id & "'", ConnDB, adOpenStatic

		If objRs.EOF then
%>
	<tr>
		<td align="center">
		<font size="2">회원 ID가 아닙니다.</font>
		</td>
	</tr>
	<tr>
		<td align="center">
			<button type="Button" Name="Btn2" onClick="location.href='index.asp'">로그인 페이지</button>
		</td>
	</tr>
<%
		Else

			If user_password <> objRs("user_password") then
%>
	<tr>
		<td align="center">
			<font size="2">ID와 비밀번호가 일치하지 않습니다.</font>
		</td>
	</tr>
	<tr>
		<td align="center">
			<button type="Button" Name="Btn3" onClick="location.href='index.asp'">로그인 페이지</button>
		</td>
	</tr>

<%
			Else
				session(user_id) = user_id
				Response.redirect "user_list.asp"
			End if
		End if
	End if

	objRs.Close
	Set objRs = Nothing
	ConnDB.Close
	Set ConnDB = Nothing
%>
</table>

 </body>
</html>
