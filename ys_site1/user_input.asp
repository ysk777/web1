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
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 </head>
 <body>

<%
	user_id				= Request.Form("user_id")
	user_password		= Request.Form("user_password")
	user_name			= Request.Form("user_name")
	user_date			= Request.Form("user_date")
	user_gender			= Request.Form("user_gender")
	user_email			= Request.Form("user_email")
	user_dept			= Request.Form("user_dept")
	user_phone			= Request.Form("user_phone")

	strConnect = "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=ys_site;Initial Catalog=ys_site1;Data Source=61.85.36.69,3433;password=ys_20190603"
	Set ConnDB = Server.CreateObject("ADODB.Connection")
	ConnDB.open strConnect

	Set objRs = Server.CreateObject("ADODB.RecordSet")
	objRs.Open "SELECT num FROM user_info ORDER BY num DESC", ConnDB, adOpenStatc

	If(objRs.BOF = True and objRs.EOF = True) Then
		num = 1
	Else
		Set numResult = ConnDB.Execute("SELECT Max(num) FROM user_info")
		num = numResult(0) + 1
	End If
	query0 = ""
	query0 = query0 & " insert	into user_info (				" & vbcrlf
	query0 = query0 & " 	num									" & vbcrlf
	query0 = query0 & " ,	user_id								" & vbcrlf
	query0 = query0 & " ,	user_password						" & vbcrlf
	query0 = query0 & " ,	user_name							" & vbcrlf
	query0 = query0 & " ,	user_date							" & vbcrlf
	query0 = query0 & " ,	user_gender							" & vbcrlf	
	query0 = query0 & " ,	user_email							" & vbcrlf
	query0 = query0 & " ,	user_dept							" & vbcrlf
	query0 = query0 & " ,	user_phone							" & vbcrlf
	query0 = query0 & " )										" & vbcrlf
	query0 = query0 & " values (								" & vbcrlf
	query0 = query0 & " 	'" & num & "'						" & vbcrlf		
	query0 = query0 & " ,	'" & user_id & "'					" & vbcrlf			
	query0 = query0 & " ,	'" & user_password & "'				" & vbcrlf				
	query0 = query0 & " ,	'" & user_name & "'					" & vbcrlf			
	query0 = query0 & " ,	'" & user_date & "'					" & vbcrlf			
	query0 = query0 & " ,	'" & user_gender & "'				" & vbcrlf			
	query0 = query0 & " ,	'" & user_email & "'				" & vbcrlf			
	query0 = query0 & " ,	'" & user_dept & "'					" & vbcrlf			
	query0 = query0 & " ,	'" & user_phone & "'				" & vbcrlf						
	query0 = query0 & " ) " & vbcrlf

	ConnDB.execute(query0)

	objRs.Close
	Set objRs = Nothing
	ConnDB.Close
	Set ConnDB = Nothing

	Response.Redirect "user_list.asp"
%>
</body>
</html>