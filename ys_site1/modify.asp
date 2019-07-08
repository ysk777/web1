<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>사용자 정보 수정</title>
<script language="JavaScript">
	function Check() {

	if(Modify.user_password.value.length < 1) {
		alert("비밀번호를 입력하세요.");
		Modify.user_password.focus();
		return false;
	}

    if (Modify.user_password.value != Modify.user_password_chk.value) {
        alert("비밀번호가 일치하지 않습니다")
        Modify.user_password_chk.value = ""
        Modify.user_password_chk.focus()
        return false;
    }

	if(Modify.user_name.value.length < 1) {
		alert("이름을 입력하세요.");
		Modify.user_name.focus();
		return false;
	}

	if(Modify.user_date.value.length < 1) {
		alert("생년월일을 입력하세요.");
		Modify.user_date.focus();
		return false;
	}

	if(Modify.user_gender.value.length < 1) {
		alert("성별을 입력하세요.");
		Modify.user_gender.focus();
		return false;
	}

	if(Modify.user_email.value.indexOf("@") + "" == "-1" || Modify.user_email.value.indexOf(".") + "" == "-1" || Modify.user_email.value == "" ) {
		alert("E-mail을 입력하세요.");
		Modify.user_email.focus();
		return false;
	}

	if(Modify.user_dept.value.length < 1) {
		alert("부서를 입력하세요.");
		Modify.user_dept.focus();
		return false;
	}

	if(Modify.user_phone.value.length < 1) {
		alert("전화번호를 입력하세요.");
		Modify.user_phone.focus();
		return false;
	}

	Modify.submit();
	}
 </script>
 </head>
 <body>
<%
	If Request("search") <> "" Then
		search = Request("search")
		key = Request("key")
		keyword = Request("keyword")
	Else
		search = 0
	End If

	strConnect = "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=ys_site;Initial Catalog=ys_site1;Data Source=61.85.36.69,3433;password=ys_20190603"
	Set ConnDB = Server.CreateObject("ADODB.Connection")
	ConnDB.open strConnect
	Set objRs = Server.CreateObject("ADODB.RecordSet")

	If search = 1 Then
		objRs.Open "SELECT * FROM user_info WHERE " & key & " like '%" & keyword & "%'" & " ORDER BY num DESC", ConnDB, adOpenStatic
	Else
		objRs.Open "SELECT * FROM user_info ORDER BY num DESC", ConnDB, adOpenStatic
	End If

	num = CLng(Request("num"))

	strConnect = "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=ys_site;Initial Catalog=ys_site1;Data Source=61.85.36.69,3433;password=ys_20190603"
	Set ConnDB = Server.CreateObject("ADODB.Connection")
	ConnDB.open strConnect

	Set objRs = Server.CreateObject("ADODB.RecordSet")
	objRs.Open "SELECT * FROM user_info WHERE num = " & num, ConnDB, adOpenStatic
%>

<center><font size="3"><b>사용자 정보 수정</b></font></center>

	<table border="0" width="100%" cellpadding="0" cellspacing="0">
		 <tr>
			 <td><hr size="1" noshade>
			 </td>
		 <tr>
	</table>

	<FORM name="Modify" Action="modify_output.asp" Method="post" OnSubmit="return Check()">
	<input type="hidden" name="num" value="<%=num%>">

	<table border="1" align="center" width="400" cellpadding="0" cellspacing="0">
		<tr>
			<td width="150" align="left" bgcolor="cccccc"><font size="3">아이디</font></td>
			<td align="left"><%=objRs("user_id")%></td>
		</tr>
		<tr>
			<td width="150" align="left" bgcolor="cccccc"><font size="3">비밀번호</font></td> 
			<td align="left" >
			<input type="password" name="user_password" size="35" value="<%=objRs("user_password")%>" autocomplete="off"></td>
		</tr>
		<tr>
			<td width="150" align="left" bgcolor="cccccc"><font size="3">비밀번호 확인</font></td>
			<td align="left">
			<input type="password" name="user_password_chk" size="35" value="<%=objRs("user_password")%>" autocomplete="off"></td>
		</tr>
		<tr>
			<td width="150" align="left" bgcolor="cccccc"><font size="3">이름</font></td> 
			<td align="left">
			<input type="text" name="user_name" size="35" value="<%=objRs("user_name")%>" autocomplete="off"></td>
		</tr>
		<tr>
			<td width="150" align="left" bgcolor="cccccc"><font size="3">생년월일</font></td> 
			<td align="left">
			<input type="text" name="user_date" size="35" value="<%=objRs("user_date")%>" autocomplete="off"></td>
		</tr>
		<tr>
			<td width="150" align="left" bgcolor="cccccc"><font size="3">성별</font></td> 
			<td align="left">
			<input type="text" name="user_gender" size="35" value="<%=objRs("user_gender")%>" autocomplete="off"></td>
		</tr>
		<tr>
			<td width="150" align="left" bgcolor="cccccc"><font size="3">이메일</font></td> 
			<td align="left">
			<input type="text" name="user_email" size="35" value="<%=objRs("user_email")%>" autocomplete="off"></td>
		</tr>
		<tr>
			<td width="150" align="left" bgcolor="cccccc"><font size="3">부서</font></td> 
			<td align="left">
			<input type="text" name="user_dept" size="35" value="<%=objRs("user_dept")%>" autocomplete="off"></td>
		</tr>
		<tr>
			<td width="150" align="left" bgcolor="cccccc"><font size="3">전화번호</font></td> 
			<td align="left">
			<input type="text" name="user_phone" size="35" value="<%=objRs("user_phone")%>" autocomplete="off"></td>
		</tr>
	</table>

	<table border="0" width="100%" cellpadding="0" cellspacing="0">
		 <tr>
			 <td><hr size="1" noshade>
			 </td>
		 <tr>
	</table>
	<table align="center" width="100%">
		<tr>
			<td align="center">
				<button type="Button" Name="Btn1" onClick="location.href='user_list.asp'">사용자 리스트</button>
				<input type="Button" Value="수정 완료" onclick="user_list.asp?PageNum=<%=i%>&search=<%=search%>&key=<%=key%>&keyword=<%=keyword%>">
				<input type="Reset" Value="다시 작성">
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

