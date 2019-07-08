<%
	num = Request("num")

	strConnect = "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=ys_site;Initial Catalog=ys_site1;Data Source=61.85.36.69,3433;password=ys_20190603"
	Set ConnDB = Server.CreateObject("ADODB.Connection")
	ConnDB.open strConnect
	strSQL = "select fileName from tblboard where num = " &num
	Set objRs = ConnDB.Execute(strSQL)

	strPath = objRs(0)
	fileName = Mid(strPath, InStrRev(strPath, "/") + 1)

	Set objRs = Nothing
	ConnDB.Close
	Set ConnDB = Nothing

	Set objFile = Server.CreateObject("TABS.Download")

	objFile.FilePath = "G:\Source2\ys_site1\PDS\" & fileName
	objFile.FileName = fileName
	objFile.MimeType = "application/abc"
	objFile.TransferFile
	Set objFile = Nothing
%>
<script>
window.close();
</script>
