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
  <title>게시판</title>
 </head>
 <body>

 <%
 num=CLng(Request("num"))
 strConnect = "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=ys_site;Initial Catalog=ys_site1;Data Source=61.85.36.69,3433;password=ys_20190603"
 Set ConnDB = Server.CreateObject("ADODB.Connection")
 ConnDB.open strConnect

 Set objRs = Server.CreateObject("ADODB.RecordSet")
 objRs.Open "SELECT * FROM tblboard WHERE num = " & num, ConnDB, adOpenStatic

 contents = objRs("contents")
 contents = Replace(contents, Chr(13), "<br>")

 strSQL = "UPDATE tblboard SET readcount=readcount+1 WHERE num = " &num
 ConnDB.Execute(strSQL)
 %>

 <center><font size="3"><b> 게시판 </b></font></center>
<table border="0" width="600" cellpadding="0" cellspacing="0">
	<tr>
		<td><hr size="1" noshade>
		</td>
	</tr>
</table>

<table border="0" width="600">
	<tr>
		<td align="left">
			<font size="2">작성자 : <%= objRs("name") %></font>
		</td>
		<td align="right">
			<font size="2">작성일 : <%= objRs("writedate") %>,
					조회수 : <%= objRs("readcount") %></font>
		</td>
	</tr>
</table>

<table border="0" cellspacing="3" cellpadding="3" width="600">
	<tr bgcolor="cccccc">
		<td align="center">
			<font size="3"><b><%=objRs("title") %></font>
		</td>
	</tr>
</table>

<table border="0" cellspacing="5" cellpadding="10" width="600">
	<tr bgcolor="ededed">
		<td><font size="2" color=""><%=contents %></font>
		</td>
	</tr>
</table>

<table border="0" width="600">
	<tr>
		<td align="right">
			<font size="2"><%=now%><br><font size="2"></font>
		</td>
	</tr>
</table>

<table border="0" width="600" cellpadding="0" cellspacing="0">
	<tr>
		<td><hr size="1" noshade>
		</td>
	</tr>
</table>

<table border="0" width="600">
	<tr>
		<td align="right">
			<a href="s_modify_pass.asp?num=<%=objRs("num")%>">[수정하기]</a>
			<a href="s_delete_pass.asp?num=<%=objRs("num")%>">[삭제하기]</a>
			<a href="s_write.asp">[글쓰기]</a>
			<a href="s_listboard.asp">[목록보기]</a>
			<a href="s_reply.asp?num=<%=objRs("num")%>">[답변하기]</a>
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
