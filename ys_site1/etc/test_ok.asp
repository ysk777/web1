<%
'//==========================
'	인코딩 설정
'//==========================

	Session.CodePage	= 65001		
	Response.CodePage	= 65001
	Response.CharSet	= "UTF-8"
%>
<%
	Dim strName, strPassword, strSex, strJob, strComment
	Dim strFavor1, strFavor2, strFavor3, strFavor4

	strName			= request.form("txtName")
	strPassword		= request.form("txtPassword")
	strSex			= request.form("rdoSex")
	strFavor1		= request.form("chkFavor1")
	strFavor2		= request.form("chkFavor2")
	strFavor3		= request.form("chkFavor3")
	strFavor4		= request.form("chkFavor4")
	strJob			= request.form("sltJob")
	strComment		= request.form("txtCom")

	response.write "이름은 = " & strName & "<br>"
	response.write "비밀번호는 = " & strPassword & "<br>"
	response.write "성별은 = " & strSex & "<br>"
	response.write "관심사(영화)는 = " & strFavor1 & "<br>"
	response.write "관심사(만화)는 = " & strFavor2 & "<br>"
	response.write "관심사(쇼핑)는 = " & strFavor3& "<br>"
	response.write "관심사(운동)는 = " & strFavor4 & "<br>"
	response.write "직업은 = " & strJob & "<br>"
	response.write "소개는 = " & strComment & "<br>"
%>