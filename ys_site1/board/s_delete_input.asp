<%
pass = Request("pass")
num = CInt(Request("num"))

strConnect = "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=ys_site;Initial Catalog=ys_site1;Data Source=61.85.36.69,3433;password=ys_20190603"
Set ConnDB = Server.CreateObject("ADODB.Connection")
ConnDB.open strConnect

strSQL = "SELECT pass FROM tblboard WHERE num=" & num
Set objRs = ConnDB.Execute(strSQL)

If pass <> objRs("pass") Then
	Response.Redirect "s_delete_pass.asp?num=" & num
Else
	ConnDB.Execute "DELETE FROM tblboard WHERE num=" & num
	ConnDB.Execute "UPDATE tblboard SET num = num - 1 WHERE num > " & num

	Response.Redirect "s_listboard.asp"
End If

objRs.Close
Set objRs = Nothing
ConnDB.Close
Set ConnDB = Nothing
%>