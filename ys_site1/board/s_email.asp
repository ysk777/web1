<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>게시판</title>
 <script language="JavaScript">
	function Check()
	{
		if (email.toemail.value.indeOf("@") + "" == "-1" || email.toemail.value.indexOf(".") + "" == "-1" || email.toemail.value == "")
		{
			alert("E-mail을 입력하세요.");
			email.toemail.focus();
			return false;
		}

		if (email.title.value.length < 1) {
			alert("글 제목을 입력하세요.");
			email.title.focus();
			return false;
		}

		if (email.contents.value.length < 1) {
			alert("글 내용을 입력하세요.");
			email.contents.focus();
			return false;
		}

	email.submit();
	}

	function list() 
	{
		location.href = "s_listboard.asp";
	}

 </script>
 </head>
 <body>
 
 <%
	num = CLng(Request("num"))

	strConnect = "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=ys_site;Initial Catalog=ys_site1;Data Source=61.85.36.69,3433;password=ys_20190603"
	Set ConnDB = Server.CreateObject("ADODB.Connection")
	ConnDB.open strConnect
	Set objRs = Server.CreateObject("ADODB.RecordSet")
	objRs.Open "select * from tblboard where num = " & num, ConnDB, adOpenStatic
%>
<center><font size="3"><b> 이메일 발송하기 </b></font>

<table border="0" width="600" cellpadding="0" cellspacing="0">
	<tr>
		<td><hr size="1" noshade>
		</td>
	</tr>
</table>

<form name="email" action="s_email_input.asp" method="post" onsubmit="return Check()">
<input type="hidden" name="num" value="<%=num%>">

<table border="0" width="600">
	<tr>
		<td width="100" bgcolor="cccccc">
			<font size="2"><center><b>보내는이</b></center></font>
		</td>
		<td>
			<p><input type="text" size="12" name="fromemail" value=<%=objRs("email")%>> * 필수 </p>
		</td>
	</tr>
	
	<tr>
		<td width="100" bgcolor="cccccc">
			<font size="2"><center><b>받는이</b></center></font>
		</td>
		<td>
			<p><input type="text" size="12" name="toemail"> * 필수 </p>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<hr size="1" noshade>
		</td>
	</tr>

	<tr>
		<td width="100" bgcolor="cccccc">
			<font size="2"><center><b>글 제목</b></center></font>
		</td>
		<td>
			<font size="2">
				<input type="text" size="70" maxlength="50" name="title" value="<%=objRs("title")%>"></font>
		</td>
	</tr>

	<tr>
		<td bgcolor="cccccc">
			<font size="2"><center><b>글 내용</b></center></font>
		</td>
		<td>
			<font size="2">
			<textarea cols="70" rows="15" wrap="virtual" name="contents"><%=objRs("contents")%></textarea>
			</font>
		</td>
	</tr>

	<tr>
		<td>
			<% strPath = objRs("fileName")
			fileName = Mid(strPath, InStrRev(strPath, "/") + 1) %>
			<p><input type="hidden" size="12" name="fileName" value="<%=fileName%>"></p>
		</td>
	</tr>

	<tr>
		<td colspan="2"><hr size="1" noshade>
		</td>
	</tr>

	<tr>
		<td align="center" colspan="2" width="100%">
		<table>
			<tr>
				<td width="200" align="center">
					<input type="Reset" value="다시 작성">
				</td>
				<td width="200" align="center">
					<input type="Submit" value="이메일 발송">
				</td>
				<td width="200" align="center">
					<input type="Button" value="목록" Name="Page" onClick="list();">
				</td>
			</tr>
		</table>
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
