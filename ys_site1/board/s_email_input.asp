<%
	toemail		= Request("toemail")
	fromemail	= Request("fromemail")
	title		= Request("title")
	contents	= Request("contents")

	fileName="G:\Source2\ys_site1\PDS\" & Request("fileName")

	Set objEmail = Server.CreateObject("CDO.Message")

	objEmail.To			= toemail
	objEmail.From		= fromemail
	objEmail.Subject	= title
	objEmail.TextBody	= contents
	objEmail.AddAttachment fileName

	objEmail.Send

	Set objEmail = Nothing

	Response.Redirect "s_listboard.asp"
%>