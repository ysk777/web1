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
num=CLng(Request("num"))
pass=Request("pass")

strConnect = "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=ys_site;Initial Catalog=ys_site1;Data Source=61.85.36.69,3433;password=ys_20190603"
Set ConnDB = Server.CreateObject("ADODB.Connection")
ConnDB.open strConnect

strSQL = "SELECT pass FROM tblboard WHERE num=" & num
Set objRs = ConnDB.Execute(strSQL)

If pass = objRs("pass") Then
	Response.Redirect "s_modify.asp?num=" & num
Else
	Response.Redirect "s_modify_pass.asp?num=" & num
End If

objRs.Close
Set objRs = Nothing
ConnDB.Close
Set ConnDB = Nothing
%>