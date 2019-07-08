<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>사용자로부터 정보 얻기 test</title>
 </head>
 <body>
			<form name="frminfo" method="post" action="test_ok.asp">
	이름	:		<input type="text" name="txtName" size="30"><br>
	비밀번호 :	<input type="password" name="txtPassword" size="30"><br>
	성별			<input type="radio" name="rdoSex" value="M" checked>남자
				<input type="radio" name="rdoSex" value="F"> 여자<br>
	관심사 :		<input type="checkbox" name="chkFavor1" value="on"> 영화
				<input type="checkbox" name="chkFavor2" value="on"> 만화
				<input type="checkbox" name="chkFavor3" value="on"> 쇼핑
				<input type="checkbox" name="chkFavor4" value="on"> 운동<br>
	직업 :		<select name="sltJob">
					<option value="1">중학생</option>
					<option value="2">고등학생</option>
					<option value="3">대학생</option>
					<option value="4" selected>직장인</option>
					<option value="5">주부</option>
				</select><br>
	소개 :		<textarea name="txtCom" cols="30" rows="3"></textarea><br>
				<input type="submit" value="전송">
			</form>
 </body>
</html>
