<%
	user_password	= Request("user_password")
	num				= CInt(Request("num"))

	strConnect = "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=ys_site;Initial Catalog=ys_site1;Data Source=61.85.36.69,3433;password=ys_20190603"
	Set ConnDB = Server.CreateObject("ADODB.Connection")
	ConnDB.open strConnect

	strSQL = "SELECT user_password FROM user_info WHERE num=" & num
	Set objRs = ConnDB.Execute(strSQL)

		ConnDB.Execute "DELETE FROM user_info WHERE num=" & num
		ConnDB.Execute "UPDATE user_info SET num = num - 1 WHERE num > " & num

		Response.Redirect "user_list.asp"

	objRs.Close
	Set objRs = Nothing
	ConnDB.Close
	Set ConnDB = Nothing
%>