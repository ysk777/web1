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
	user_password = Request("user_password")
	user_name = Request("user_name")
	user_date = Request("user_date")
	user_gender = Request("user_gender")
	user_email = Request("user_email")
	user_dept = Request("user_dept")
	user_phone = Request("user_phone")

	strConnect = "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=ys_site;Initial Catalog=ys_site1;Data Source=61.85.36.69,3433;password=ys_20190603"
	Set ConnDB = Server.CreateObject("ADODB.Connection")
	ConnDB.open strConnect

	IF (user_password <> "") Then
		strSQL = ""
		strSQL = strSQL & " update user_info " & vbcrlf
		strSQL = strSQL & " set		user_password		= '" & user_password & "'	" & vbcrlf
		strSQL = strSQL & "		,	user_name			= '" & user_name & "'		" & vbcrlf
		strSQL = strSQL & "		,	user_date			= '" & user_date & "'		" & vbcrlf
		strSQL = strSQL & "		,	user_gender			= '" & user_gender & "'		" & vbcrlf
		strSQL = strSQL & "		,	user_email			= '" & user_email & "'		" & vbcrlf
		strSQL = strSQL & "		,	user_dept			= '" & user_dept & "'		" & vbcrlf
		strSQL = strSQL & "		,	user_phone			= '" & user_phone & "'		" & vbcrlf
		strSQL = strSQL & "	where num					= '" & num & "'				" & vbcrlf	
		ConnDB.Execute(strSQL)
	Else
		strSQL = ""
		strSQL = strSQL & " update user_info " & vbcrlf
		strSQL = strSQL & " set		user_name			= '" & user_name & "'	" & vbcrlf
		strSQL = strSQL & "		,	user_date			= '" & user_date & "'		" & vbcrlf
		strSQL = strSQL & "		,	user_gender			= '" & user_gender & "'		" & vbcrlf
		strSQL = strSQL & "		,	user_email			= '" & user_email & "'		" & vbcrlf
		strSQL = strSQL & "		,	user_dept			= '" & user_dept & "'		" & vbcrlf
		strSQL = strSQL & "		,	user_phone			= '" & user_phone & "'		" & vbcrlf
		strSQL = strSQL & "	where num					= '" & num & "'				" & vbcrlf	
		ConnDB.Execute(strSQL)
		
	End If

	ConnDB.Close
	Set ConnDB = Nothing

	Response.Redirect "user_list.asp"
%>
