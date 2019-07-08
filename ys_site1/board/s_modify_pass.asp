<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>게시판 수정</title>
 </head>
 <body>
 <%
 num = CLng(Request("num"))
 %>

 <center><font size="3"><b>비밀번호 확인</b></font>

 <table border="0" width="600" cellpadding="0" cellspacing="0">
	<tr>
		<td><hr size="1" noshade>
		</td>
	</tr>
 </table>
 
 <Form Action="s_modify_input.asp" Method="Post">
 <input type="hidden" name="num" value="<%=num%>">
 
 <table border="0" width="300" align="center">
	<tr>
		<td align="center">
			<font size="2"><B>비밀번호</B></font>
		</td>
		<td>
			<input type="password" name="pass" size="20" maxlength="20">
			<input type="submit" value=" 확 인 " style="background-color:cccccc; font-weight:bolder">
		</td>
	</tr>
 </table>
 
 <table border="0" width="600" cellpadding="0" cellspacing="0">
	<tr>
		<td><hr size="1" noshade>
		</td>
	</tr>
 </table>
 
 <a href="s_listboard.asp">[목록 보기]</a>

 </Form>

 </body>
</html>
