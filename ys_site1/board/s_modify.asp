<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>게시판 수정</title>
<script language="JavaScript">
	function Check() {
		if(Modify.name.value.length < 1) {  
			alert("작성자를 입력하세요.");
			Modify.name.focus();
			return false;
		}

		if(Modify.pass.value.length < 1) {
			alert("비밀번호를 입력하세요.");
			Modify.pass.focus();
			return false;
		}

		if(Modify.email.value.indexOf("@") + "" == "-1" || Modify.email.value.indexOf(".") + "" == "-1" || Modify.email.value == "" ) {
			alert("E-mail을 입력하세요.");
			Modify.email.focus();
			return false;
		}

		if(Modify.title.value.length < 1) {
			alert("글제목을 입력하세요.");
			Modify.title.focus();
			return false;
		}

		if(Modify.contents.value.length < 1) {
			alert("글내용을 입력하세요.");
			Modify.contents.focus();
			return false;
		}

		Modify.submit();
	}
	function list ()
	{
		location.href = "s_listboard.asp";
	}

 </script>
 </head>
 <body>

<%
num = CLng(Request("num"))

strConnect = "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=ys_site;Initial Catalog=ys_site1;Data Source=61.85.36.69,3433;password=ys_20190603"
Set ConnDB = Server.CreateObject("ADODB.Connection")
ConnDB.open strConnect

Set objRs = Server.CreateObject("ADODB.RecordSet")
objRs.Open "SELECT * FROM tblboard WHERE num = " & num, ConnDB, adOpenStatic
%>

 <center><font size="3"><b>게시판 글수정</b></font></center>

 <table border="0" width="600" cellpadding="0" cellspacing="0">
	 <tr>
		 <td><hr size="1" noshade>
		 </td>
	 <tr>
</table>

<FORM name="Modify" Action="s_modify_output.asp" Method="post" OnSubmit="return Check()">
<input type="hidden" name="num" value="<%=num%>">

<table border="0" width="600">
	<tr>
		<td width="100" bgcolor="cccccc">
			<font size="2"><center><b>작성자</b></center></font>
		</td>
		<td>
			<p><input type="text" size="12" name="name" value="<%=objRs("name")%>" autocomplete="off"> * 필수</p>
		</td>
	</tr>
	<tr>
		<td width="100" bgcolor="cccccc">
			<font size="2"><center><b>비밀번호</b></center></font>
		</td>
		<td>
			<p><input type="password" size="12" name="pass"> * 필수 </p>
		</td>
	</tr>
	<tr>
		<td width="100" bgcolor="cccccc">
			<font size="2"><center><b>E-mail</b></center></font>
		</td>
		<td>
			<font size="2">
			<input type="text" size="40" maxlength="50" name="email" value="<%=objRs("email")%>" autocomplete="off">
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
			<input type="text" size="70" maxlength="50" name="title" value="<%=objRs("title")%>" autocomplete="off">
			</font>
		</td>
	</tr>

	<tr>
		<td bgcolor="cccccc">
			<font size="2"><center><b>글 내용</b></center></font>
		</td>
		<td>
			<font size="2">
				<textarea cols="70" rows="15" wrap="virtual" name="contents" value="<%=objRs("contents")%>" autocomplete="off">
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
				</td>
				<td width="200" align="center">
					<input type="Reset" Value="다시 작성">
				</td>
				<td width="200" align="center">
					<input type="Submit" Value="수정 완료">
				</td>
				<td width="200" align="center">
					<button type="Button" Name="Page" onClick="list();">목록</button>
				</td>
			</tr>
		</table>
		</td>
	</tr> 
</table>

<%
objRs.Close
Set objRs=Nothing
ConnDB.Close
Set ConnDB=Nothing
%>
</form>
 </body>
</html>

