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
  <title>user_info</title>
 <script type="text/javascript">

    function Check() {
        if (member.user_id.value == "") {
            alert("아이디를 입력하지 않았습니다.")
            member.user_id.focus()
            return false;
        }

        //아이디 유효성 검사 (영문소문자, 숫자만 허용)
        for (i = 0; i < member.user_id.value.length; i++) {
            ch = member.user_id.value.charAt(i)
            if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')&&!(ch >= 'A' && ch <= 'Z')) {
                alert("아이디는 대소문자, 숫자만 입력가능합니다.")
                member.user_id.focus()
                member.user_id.select()
                return false;
            }
        }

        //아이디 길이 체크 (4~12자)
        if (member.user_id.value.length<4 || member.user_id.value.length>12) {
            alert("아이디를 4~12자까지 입력해주세요.")
            member.user_id.focus()
            member.user_id.select()
            return false;
        }

        //비밀번호 입력여부 체크
        if (member.user_password.value == "") {
            alert("비밀번호를 입력하지 않았습니다.")
            member.user_password.focus()
            return false;
        }

        if (member.user_password.value == member.user_id.value) {
            alert("아이디와 비밀번호가 같습니다.")
            member.user_password.focus()
            return false;
        }

        //비밀번호 길이 체크(4~8자 까지 허용)
        if (member.user_password.value.length<4 || member.user_password.value.length>12) {
            alert("비밀번호를 4~12자까지 입력해주세요.")
            member.user_password.focus()
            member.user_password.select()
            return false;
        }

        //비밀번호와 비밀번호 확인 일치여부 체크
        if (member.user_password.value != member.user_password_chk.value) {
            alert("비밀번호가 일치하지 않습니다")
            member.user_password_chk.value = ""
            member.user_password_chk.focus()
            return false;
        }

        if (member.user_name.value == "") {
            alert("이름을 입력하지 않았습니다.")
            member.user_name.focus()
            return false;
        }

        if(member.user_name.value.length<2){
            alert("이름을 2자 이상 입력해주십시오.")
            member.user_name.focus()
            return false;
        }

        if(member.user_date.value == ""){
            alert("생년월일을 입력하지 않았습니다.")
            member.user_date.focus()
            return false;
        }

        if(member.user_gender.value == ""){
            alert("성별을 입력하지 않았습니다.")
            member.user_gender.focus()
            return false;
        }

		if(member.user_email.value.indexOf("@") + "" == "-1" || member.user_email.value.indexOf(".") + "" == "-1" || member.user_email.value == "" ) {
			alert("E-mail을 입력하세요.");
			member.user_email.focus();
			return false;
		}

		if(member.user_dept.value.length < 1) {
			alert("부서를 입력하세요.");
			member.user_dept.focus();
			return false;
		}
	
		if(member.user_phone.value.length < 1) {
			alert("전화번호를 입력하세요.");
			member.user_phone.focus();
			return false;
		}
		if(member.user_interest.value == "") {
			alert("관심분야를 선택하세요.");
			member.user_interest.focus();
			return false;
		}
		if(member.user_email_rec.value == "") {
			alert("이메일 수신여부를 선택하세요.");
			member.user_email_rec.focus();
			return false;
		}

		Write.submit();
    }
	function check_id()
	{
		browsing_window = window.open("checkid.asp?user_id="+member.user_id.value,"idcheck","height=200, width=300, menubar=no, directories=no, resizable=no, status=no, scrollbars=yes");
		browsing_window.focus();
	}

</script>
 </head>
 <body style="margin:10px; padding:10px;">
		 <form name="member" Action="user_input.asp" Method="post" OnSubmit="return Check()">
		 <table border="1" width="500" cellpadding="5" cellspacing="1" align="center">
			<tr>
				<td colspan="3" bgcolor="cccccc">사용자 등록</td>
			</tr>
			<tr>
				<td align="left" colspan="3" bgcolor="ededed">아이디</td>
			</tr>
			<tr>
				<td align="left" colspan="3">
				<input type="text" name="user_id" id="user_id" align="left" size="40" placeholder="아이디(4~12자)" style="padding : 5px; border : 1px;">
				<input type="button" onclick="check_id()" value="ID 중복검사">
				</td>
			</tr>
			<tr>
				<td align="left" colspan="3" bgcolor="ededed">비밀번호</td>
			</tr>
			<tr>
				<td align="left" colspan="3">
				<input type="password" name="user_password" id="user_password" align="left" size="40" style="padding : 5px; border : 1px;">
				</td>
			</tr>
			<tr>
				<td align="left" colspan="3" bgcolor="ededed">비밀번호 확인</td>
			</tr>
			<tr>
				<td align="left" colspan="3">
				<input type="password" name="user_password_chk" id="user_password_chk" align="left" size="40" style="padding : 5px; border : 1px;">
				</td>
			</tr>
			<tr>
				<td align="left" colspan="3" bgcolor="ededed">이름</td>
			</tr>
			<tr>
				<td align="left" colspan="3">
				<input type="text" name="user_name" id="user_name" align="left" size="40" style="padding : 5px; border : 1px;">
				</td>
			</tr>
			<tr>
				<td align="left" colspan="3" bgcolor="ededed">생년월일</td>
			</tr>
			<tr>
				<td align="left" colspan="1">
					<input type="text" name="user_date" id="user_date" size="40" placeholder="2000-00-00" style="padding : 5px; border : 1px;">
				</td>
			</tr>
			<tr>
				<td align="left"  colspan="3" bgcolor="ededed">성별</td>
			</tr>
			<tr>
				<td align="left" colspan="3" style="padding : 5px; border : 1px;">
				<select name="user_gender" style="padding : 5px; width : 100px;  border : 1px">
					<option value="">선택</option>
					<option value="남자">남자</option>
					<option value="여자">여자</option>
				</td>
			</tr>
			<tr>
				<td align="left"  colspan="3" bgcolor="ededed">이메일</td>
			</tr>
			<tr>
				<td align="left" colspan="3">
				<input type="text" name="user_email" id="user_email" align="left" size="40" placeholder="example@gmail.com" style="padding : 5px; border : 1px;">
				</td>
			</tr>
			<tr>
				<td align="left"  colspan="3" bgcolor="ededed">부서</td>
			</tr>
			<tr>
				<td align="left" colspan="3">
				<input type="text" name="user_dept" id="user_dept" align="left" size="40" style="padding : 5px; border : 1px;">
				</td>
			</tr>
			<tr>
				<td align="left"  colspan="3" bgcolor="ededed">전화번호</td>
			</tr>
			<tr>
				<td align="left" colspan="3">
				<input type="text" name="user_phone" id="user_phone" align="left" size="40" placeholder="010-0000-0000" style="padding : 5px; border : 1px;">
				</td>
			</tr>
			<tr>
				<td align="left" colspan="3" bgcolor="ededed">관심분야</td>
			</tr>
			<tr>
				<td align="left" colspan="3">
				<input type="checkbox" name="user_interest1" value="컴퓨터">컴퓨터
				<input type="checkbox" name="user_interest2" value="여행">여행
				<input type="checkbox" name="user_interest3" value="영화감상">영화감상
				<input type="checkbox" name="user_interest4" value="음악감상">음악감상
				<input type="checkbox" name="user_interest5" value="스포츠">스포츠
				</td>
			</tr>
			<tr>
				<td align="left" colspan="3" bgcolor="ededed">이메일 수신</td>
			</tr>
			<tr>
				<td align="left" colspan="3">
				<input type="radio" name="user_email_rec" value="수신">수신
				<input type="radio" name="user_email_rec" value="비수신">비수신
				</td>
			</tr>
			<tr>
				<td align="center" colspan="5" width="100%" bgcolor="cccccc">
				<table>
					<tr>
						<td width="200" align="center">
							<input type="Reset" Value="다시 작성">
						</td>
						<td width="200" align="center">
							<input type="Submit" Value="등록">
						</td>
						<td width="200"align="center">
							<button type="Button" Name="Btn1" onClick="location.href='user_list.asp'">사용자 리스트</button>
						</td>
					</tr>
				</table>
				</td>
			</tr>			
		 </table>
	 </form>
 </body>
</html>
