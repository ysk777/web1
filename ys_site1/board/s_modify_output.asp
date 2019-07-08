<%@CodePage="65001" Language="VBScript"%> 
<%
'//==========================
'	인코딩 설정
'//==========================

	Session.CodePage	= 65001		
	Response.CodePage	= 65001
	Response.CharSet	= "UTF-8"
%>
<%
num = Request("num")
name = Request("name")
pass = Request("pass")
email = Request("email")
title = Request("title")
contents = Request("contents")

strConnect = "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=ys_site;Initial Catalog=ys_site1;Data Source=61.85.36.69,3433;password=ys_20190603"
Set ConnDB = Server.CreateObject("ADODB.Connection")
ConnDB.open strConnect

StrDate = CStr(now)

IF (pass <> "") Then
	strSQL = "UPDATE tblboard SET name='" & name & "', pass='" & pass & "', email='" & email & "', title='" & title & "', contents='" & contents & "', writedate='" & StrDate & "' WHERE num=" & num
	ConnDB.Execute(strSQL)
Else
	strSQL = "UPDATE tblboard SET name='" & name & "', email='" & email & "', title='" & title & "', contents='" & contents & "', writedate='" & StrDate & "' WHERE num=" & num
	ConnDB.Execute(strSQL)
End If

ConnDB.Close
Set ConnDB = Nothing

Response.Redirect "s_listboard.asp"
%>
