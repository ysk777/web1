<%
num = CLng(Request.Form("num"))
name = Request.Form("name")
pass = Request.Form("pass")
email = Request.Form("email")
title = Request.Form("title")
contents = Request.Form("contents")

strConnect = "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=ys_site;Initial Catalog=ys_site1;Data Source=61.85.36.69,3433;password=ys_20190603"
Set ConnDB = Server.CreateObject("ADODB.Connection")
ConnDB.open strConnect

Set objRs = Server.CreateObject("ADODB.RecordSet")
objRs.Open "SELECT num FROM tblboard ORDER BY num DESC", ConnDB, adOpenStatc

ConnDB.Execute "UPDATE tblboard SET num = num + 1 WHERE num = " & num & " OR num > " & num

StrDate = CStr(now)
ConnDB.Execute "INSERT INTO tblboard(num, name, pass, email, title, contents, writedate, readcount) " & "VALUES (" & num & ", '" & name & "', '" & pass & "', '" & email & "', '" & title & "', '" & contents & "', '" & StrDate & "', " & 0 & ")"

objRs.Close
Set objRs = Nothing
ConnDB.Close
Set ConnDB = Nothing

Response.Redirect "s_listboard.asp"
%>