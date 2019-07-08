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
  <title>게시판</title>
 <script language="JavaScript">
	function Check() {
		if(Write.name.value.length < 1) {  
			alert("작성자를 입력하세요.");
			Write.name.focus();
			return false;
		}
		if(Write.pass.value.length < 1) {
			alert("비밀번호를 입력하세요.");
			Write.pass.focus();
			return false;
		}
		if(Write.email.value.indexOf("@") + "" == "-1" || Write.email.value.indexOf(".") + "" == "-1" || Write.email.value == "" ) {
			alert("E-mail을 입력하세요.");
			Write.email.focus();
			return false;
		}
		if(Write.title.value.length < 1) {
			alert("글제목을 입력하세요.");
			Write.title.focus();
			return false;
		}
		if(Write.contents.value.length < 1) {
			alert("글내용을 입력하세요.");
			Write.contents.focus();
			return false;
		}
		Write.submit();
	}
	function list()
	{
		location.href="s_listboard.asp";
	}

 </script>
 </head>
 <body>

 <%
 num = CLng(Request("num"))

 strConnect = "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=ys_site;Initial Catalog=ys_site1;Data Source=61.85.36.69,3433;password=ys_20190603"
 Set ConnDB = Server.CreateObject("ADODB.Connection")
 ConnDB.open strConnect

 Set objRs=Server.CreateObject("ADODB.RecordSet")
 objRs.Open "SELECT * FROM tblboard WHERE num = " & num, ConnDB, adOpenStatic
 %>

 <center><font size="3"><b>답변 하기</b></font></center>
 <table border="0" width="600" cellpadding="0" cellspacing="0">
	 <tr>
		 <td><hr size="1" noshade>
		 </td>
	 <tr>
</table>

<form name="Write" Action="s_reply_input.asp" Method="post" OnSubmit="return Check()">
<input type="hidden" name="num" value="<%=num%>">

<table border="0" width="600" cellpadding="2" cellspacing="2">
	<tr>
		<td width="100" bgcolor="cccccc">
			<font size="2"><center><b>작성자</b></center></font>
		</td>
		<td>
			<p><input type="text" size="12" name="name" autocomplete="off"> * 필수</p>
		</td>
	</tr>
	<tr>
		<td width="100" bgcolor="cccccc">
			<font size="2"><center><b>비밀번호</b></center></font>
		</td>
		<td>
			<p><input type="password" size="12" name="pass">
				* 필수 (게시물 수정 삭제 시 필요합니다.)</p>
		</td>
	</tr>
	<tr>
		<td width="100" bgcolor="cccccc">
			<font size="2"><center><b>E-mail</b></center></font>
		</td>
		<td>
			<font size="2">
			<input type="text" size="40" maxlength="50" name="email" autocomplete="off">
			</font>
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<hr size="1" noshade>
		</td>
	</tr>
	<tr>
		<td width="100" bgcolor="cccccc">
			<font size="2"><center><b>글 제목</b></center></font>
		</td>
		<td>
			<font size="2">
			<input type="text" size="70" maxlength="50" name="title" value="[답변]<%=objRs("title")%>" autocomplete="off">
			</font>
		</td>
	</tr>

	<tr>
		<td bgcolor="cccccc">
			<font size="2"><center><b>글 내용</b></center></font>
		</td>
		<td>
			<font size="2">
				<textarea cols="70" rows="15" wrap="virtual" name="contents" autocomplete="off">
				</textarea>
			</font>
		</td>
	</tr>
		
	<tr>
		<td colspan="2">
			<hr size="1" noshade>
		</td>
	</tr>

	<tr>
		<td align="center" colspan="2" width="100%">
		<table>
			<tr>
				<td width="200" align="center">
					<input type="Reset" Value="다시 작성">
				</td>
				<td width="200" align="center">
					<input type="Submit" Value="등록">
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</form>
 </body>
</html>
