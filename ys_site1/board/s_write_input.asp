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
	name		= request.Form("name")
	pass		= request.Form("pass")
	email		= request.Form("email")
	title		= request.Form("title")
	contents	= request.Form("contents")

	strConnect = "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=ys_site;Initial Catalog=ys_site1;Data Source=61.85.36.69,3433;password=ys_20190603"
	Set ConnDB = Server.CreateObject("ADODB.Connection")
	ConnDB.open strConnect

	Set objRs = Server.CreateObject("ADODB.RecordSet")
	objRs.Open "SELECT num FROM tblboard ORDER BY num DESC", ConnDB, adOpenStatc

	If(objRs.BOF = True and objRs.EOF = True) Then
		num = 1
	Else
		Set numResult = ConnDB.Execute("SELECT Max(num) FROM tblboard")
		num = numResult(0) + 1
	End If

	StrDate = CStr(now)

	query0 = ""
	query0 = query0 & " insert into tblboard(			" & vbcrlf
	query0 = query0 & " 	num							" & vbcrlf
	query0 = query0 & " ,	name						" & vbcrlf
	query0 = query0 & " ,	pass						" & vbcrlf
	query0 = query0 & " ,	email						" & vbcrlf
	query0 = query0 & " ,	title						" & vbcrlf
	query0 = query0 & " ,	contents					" & vbcrlf	
	query0 = query0 & " ,	writedate					" & vbcrlf
	query0 = query0 & " ,	readcount					" & vbcrlf
	query0 = query0 & " )								" & vbcrlf
	query0 = query0 & " values (						" & vbcrlf
	query0 = query0 & " 	" & num & "					" & vbcrlf		
	query0 = query0 & " ,	'" & name & "'				" & vbcrlf			
	query0 = query0 & " ,	'" & pass & "'				" & vbcrlf				
	query0 = query0 & " ,	'" & email & "'				" & vbcrlf			
	query0 = query0 & " ,	'" & title & "'				" & vbcrlf			
	query0 = query0 & " ,	'" & contents & "'			" & vbcrlf			
	query0 = query0 & " ,	'" & StrDate & "'			" & vbcrlf			
	query0 = query0 & " ,	" & 0 & "					" & vbcrlf									
	query0 = query0 & " ) " & vbcrlf

	ConnDB.execute(query0)

	numResult.Close
	Set numResult = Nothing
	objRs.Close
	Set objRs = Nothing
	ConnDB.Close
	Set ConnDB = Nothing

	Response.Redirect "s_listboard.asp"
%>
