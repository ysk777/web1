<%@CodePage="65001" Language="VBScript"%> 
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
  <meta thhp-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>user_info</title>
 </head>
 <body>

 <%
	num=CLng(Request("num"))
	strConnect = "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=ys_site;Initial Catalog=ys_site1;Data Source=61.85.36.69,3433;password=ys_20190603"
	Set ConnDB = Server.CreateObject("ADODB.Connection")
	ConnDB.open strConnect

	Set objRs = Server.CreateObject("ADODB.RecordSet")
	objRs.Open "SELECT * FROM user_info WHERE num = " & num, ConnDB, adOpenStatic


%>

<center><font size="3" ><b> user_info </b></font></center>

 <TABLE border="0" width="100%" cellpadding="0" cellspacing="0">
 	<tr>
		<td><hr size="1" noshade>
		</td>
	</tr>
</TABLE>

<table border="1" align="center" cellspacing="0" cellpadding="0" width="400">
	<tr>
		<td align="left" width="150" bgcolor="cccccc"><font size="3">아이디</font></td>
		<td	align="left"><%=objRs("user_id")%></td>	
	</tr>
	<tr>
		<td align="left" width="150" bgcolor="cccccc"><font size="3">이름</font></td>
			<td	align="left"><%=objRs("user_name")%></td>	
	</tr>
	<tr>
		<td align="left" width="150" bgcolor="cccccc"><font size="3">생년월일</font></td>
			<td	align="left"><%=objRs("user_date")%></td>	
	</tr>
	<tr>
		<td align="left" width="150" bgcolor="cccccc"><font size="3">성별</font></td>
			<td	align="left"><%=objRs("user_gender")%></td>	
	</tr>
	<tr>
		<td align="left" width="150" bgcolor="cccccc"><font size="3">이메일</font></td>
			<td	align="left"><%=objRs("user_email")%></td>	
	</tr>
	<tr>
		<td align="left" width="150" bgcolor="cccccc"><font size="3">부서</font></td>
			<td	align="left"><%=objRs("user_dept")%></td>	
	</tr>
	<tr>
		<td align="left" width="150" bgcolor="cccccc"><font size="3">전화번호</font></td>
			<td	align="left"><%=objRs("user_phone")%></td>	
	</tr>
</table>

<table border="0" width="100%">
	<tr>
		<td align="center">
			<font size="2"><%=now%><br><font size="2"></font>
		</td>
	</tr>
</table>

<table border="0" width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td><hr size="1" noshade>
		</td>
	</tr>
</table>

<table border="0" width="100%">
	<tr>
		<td align="center">
			<button type="Button" Name="Btn1" onClick="location.href='user_list.asp'">사용자 리스트</button>
			<button type="Button" Name="Btn2" onClick="location.href='modify.asp?num=<%=objRs("num")%>'">수정하기</button>
			<button type="Button" Name="Btn3" onClick="location.href='delete.asp?num=<%=objRs("num")%>'">삭제하기</button>	
		</td>
	</tr>
</table>
<%
	objRs.Close
	Set objRs = Nothing
	ConnDB.Close
	Set ConnDB = Nothing
%>
 </body>
</html>
