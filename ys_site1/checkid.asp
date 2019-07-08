<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>아이디 중복 체크</title>
 </head>
 <body>
 <form>

 <table border="1" width="250">

<%
	user_id = Request("user_id")
	If(user_id = "")then
%>
	<tr>
		<td align="center" bgcolor="cccccc">
		<font size="2">id를 입력하세요.</font>
		</td>
	</tr>
	<tr>
		<td align="center">
			<button type="Button" Name="Btn1" onClick="window.close()">닫기</button>
		</td>
	</tr>

<%
	Else
	strConnect = "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=ys_site;Initial Catalog=ys_site1;Data Source=61.85.36.69,3433;password=ys_20190603"
	Set ConnDB = Server.CreateObject("ADODB.Connection")
	ConnDB.open strConnect
	Set objRs = Server.CreateObject("ADODB.RecordSet")
	objRs.Open "SELECT user_id FROM user_info where user_id='" & user_id & "'", ConnDB, adOpenStatic

		If objRs.EOF then
%>
	<tr>
		<td align="center" bgcolor="cccccc">
			<font size="2">ID : <%=user_id%> <BR> 사용할 수 있는 아이디입니다. </font>
		</td>
	</tr>

	<tr>
		<td align="center">
			<button type="Button" Name="Btn2" onClick="window.close()">닫기</button>
		</td>
	</tr>
<%
		Else
%>
	<tr>
		<td align="center" bgcolor="cccccc">
			<font size="2">ID : <%=user_id%> <BR> 사용할 수 없는 아이디입니다.</font>
		</td>
	</tr>
	<tr>
		<td align="center">
			<button type="Button" Name="Btn3" onClick="window.close()">닫기</button>
		</td>
	</tr>
<%
		End If
	objRs.Close
	Set ObjRs = Nothing
	ConnDB.Close
	Set ConnDB = Nothing

	End If
%>

 </body>
</html>
