
<%@ Language=VBScript %>
 <!-- METADATA TYPE="typelib" NAME="Microsoft ActiveX Data Objects 2.5 Library"
	UUID="{00000205-0000-0010-8000-00AA006D2EA4}"-->
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
  <title>user_info</title>

  <SCRIPT language="JavaScript">
  function Check()
  {
	  if (Form.keyword.value.length < 1) {
		  alert("검색어를 입력하세요.");
		  Form.keyword.focus();
		  return false;
	  }
  }
  function Check1()
  {
	  if (Form1.keyword1.value.length < 1) {
		  alert("검색어를 입력하세요.");
		  Form1.keyword1.focus();
		  return false;
	  }
  }
 </SCRIPT>
 </head>
 <body>

<%
	strc = "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=ys_site;Initial Catalog=ys_site1;Data Source=61.85.36.69,3433;password=ys_20190603"
	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.open strc
	Set rs = Server.CreateObject("ADODB.RecordSet")

		rs.Open "select count(*) from user_info group by user_gender", Conn, adOpenStatic

		man = trim(rs(0))
		rs.MoveNext
		women = Trim(rs(0))

	rs.Close
	Set rs = Nothing
	Conn.Close
	Set Conn = Nothing	
		
	If Request("search") <> "" Then
		search		= Request("search")
		key			= Request("key")
		keyword		= Request("keyword")
	Else
		search = 0
	End If

	If Request("PageNum") = "" Then
		PageNum = 1
	Else
		PageNum = CInt(Request("PageNum"))
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

	If (objRs.BOF=True and objRs.EOF=True) Then
		Record_Null = 1
	Else

		objRs.PageSize = 5
		PageSize = objRs.PageSize
		PageCount = objRs.PageCount
		RecordCount = objRs.RecordCount
		BlockNum = (PageNum + (10 - 1)) \ 10
		objRs.AbsolutePage = PageNum
		StartPage = ((BlockNum - 1) * 10) + 1

		If PageCount > (PageNum + (10 - 1)) Then
			EndPage = (PageNum + (10 - 1))
		Else
			EndPage = PageCount
		End If
	 End If

	 If PageNum < 1 OR PageNum > PageCount Then
		Page_Null = 1
	 Else
		Page_Null = 0
	 End If
%>
<div style="width:200px; height:250px; border:1px solid; float:left; margin-right:20px;">	
	<table style="width:200px; padding:5px; border-spacing: 0 15px;" align="center">
		<tr>
			<td align="center"><font size="3"><b>MENU</b></font></td>
		</tr>
		<tr>
			<td align="center">
				<a href="user_list.asp">[사용자 관리]</a>
			</td>
		</tr>
		<tr>
			<td align="center">
				<a href="member.asp">[사용자 등록]</a>
			</td>
		</tr>
		<tr>
			<td align="center">
				<a href="/board/s_listboard.asp">[게시판]</a>
			</td>
		</tr>
		<tr>
			<td align="center">
				<a href="index.asp">[로그아웃]</a>
			</td>
		</tr>
	</table>
</div>

<div style="width:700px; height:250px; border:0px solid; float:left;">
	<div style="width:700px; height:50px; border: 0px solid; float:left;">
		<div style="width:100px; height:50px; border: 0px solid; margin-right:100px; text-align:center; float:left;">
			<li style="list-style:none;">남자 : <%=man%>명</li>
			<li style="list-style:none;">여자 : <%=women%>명</li>
		</div>
		<div style="width:500px; height:50px; border: 0px solid;  text-align:center;">
			<li style="list-style:none; font-size:30px;">user_info</li>
		</div>

	</div>
	<TABLE border="0" width="100%" cellpadding="0" cellspacing="0">
		<tr>
			<td><hr size="1" noshade>
			</td>
		</tr>
	</TABLE>

	<table border="0" align="center" cellspacing="1" cellpadding="2" width="600">
		<tr bgcolor="cccccc">
			<td><font size="2"><center><b>번호</b></center></font></td>
			<td><font size="2"><center><b>아이디</b></center></font></td>
			<td><font size="2"><center><b>이름</b></center></font></td>
			<td><font size="2"><center><b>생년월일</b></center></font></td>
			<td><font size="2"><center><b>성별</b></center></font></td>
			<td><font size="2"><center><b>이메일</b></center></font></td>
			<td><font size="2"><center><b>부서</b></center></font></td>
			<td><font size="2"><center><b>전화번호</b></center></font></td>
		</tr>

<%
	For j = 1 To PageSize
%>

	<tr bgcolor="ededed">
		<td align="center">
			<font size="2" color="black"><%=objRs("num")%></font>
		</td>
		<td align="center">
			<a href="user_output.asp?num=<%=objRs("num")%>">
			<font size="2" color="black"><%=objRs("user_id")%></font></a>
		</td>
		<td align="center">
			<font size="2" color="black"><%=objRs("user_name")%></font>
		</td>
		<td align="center">
			<font size="2" color="black"><%=objRs("user_date")%></font>
		</td>
		<td align="center">
			<font size="2" color="black"><%=objRs("user_gender")%></font>
		</td>
		<td align="center">
			<font size="2" color="black"><%=objRs("user_email")%></font>
		</td>
		<td align="center">
			<font size="2" color="black"><%=objRs("user_dept")%></font>
		</td>
		<td align="center">
			<font size="2" color="black"><%=objRs("user_phone")%></font>
		</td>
	</tr>

<%
	objRs.MoveNext

	If objRs.EOF Then
	Exit For

	End If

	Next
%>

	</table>

	<table border="0" width="600">
		<tr>
			<td align="center">
			</td>
		</tr>
	</table>

	<table border="0" width="100%">
		<tr>
			<td align="center">

<%
	If PageNum > 1 then 
%>
		<a href="user_list.asp?PageNum=<%=PageNum-1%>&search=<%=search%>&key=<%=key%>&keyword=<%=keyword%>">
		<img src="/images/btn_prev.png"></a>
<%
	End If
	
	For i=StartPage to EndPage

		If i = PageNum then
%>
		<b><font size="2">[<%=i%>]</font></b>
<%
		Else
%>
		<a href="user_list.asp?PageNum=<%=i%>&search=<%=search%>&key=<%=key%>&keyword=<%=keyword%>">
		<font size="2">[<%=i%>]</font></a>
<%
		End If
	Next
	
	If PageNum < PageCount then
%>
	<a href="user_list.asp?PageNum=<%=PageNum+1%>&search=<%=search%>&key=<%=key%>&keyword=<%=keyword%>">
	<img src="/images/btn_next.png"></a>

<%
	End If
%>
			</td>
		</tr>
	</table>

	<FORM Name="Form" Method="POST" Action="user_list.asp" OnSubmit="return Check()">
		<div style="border:solid 0px black; width:300px; align:left; float:left; margin-left:30px;">
			<table border="0" cellpadding="0" cellspacing="0">
			<input type="hidden" name="search" value="1">
				<tr>
					<td align="right">
						<select name="key" style="background-color:cccccc;">
							<option value="user_id"><font size="2">아이디</font></option>
							<option value="user_name"><font size="2">이름</font></option>
							<option value="user_dept"><font size="2">부서</font></option>
						</select>
					</td>
					<td align="left">
						<input type="text" name="keyword" value="" size="20" maxlength="30">
						<input type="submit" value="검색">
					</td>
				</tr>
			</table>
		</div>
	</FORM>

	<FORM Name="Form1" Method="POST" Action="user_list.asp" OnSubmit="return Check1()">
		<div style="border:solid 0px black; width:300px; align:left; float:left; margin-left:30px;">
			<table border="0" cellpadding="0" cellspacing="0">
			<input type="hidden" name="search" value="1">
				<tr>
					<td align="right">
						<select name="key" style="background-color:cccccc;">
							<option value="user_gender"><font size="2">성별</font></option>
							<option value="user_phone"><font size="2">전화번호</font></option>
						</select>
					</td>
					<td align="left">
						<input type="text" name="keyword" value="" size="20" maxlength="30">
						<input type="submit" value="검색">
					</td>
				</tr>
			</table>
		</div>
	</FORM>
</div>
<%
	objRs.Close
	Set objRs = Nothing
	ConnDB.Close
	Set ConnDB = Nothing
%>
</body>
</html>
