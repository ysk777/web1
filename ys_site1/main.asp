
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
<style>
	li {
		list-style:none;
	}
	#head_wrap {
		width: 1800px;
		margin: 0px auto;
		padding: 20px;
		border: 1px solid #bcbcbc;
	}
	#header {
		background-color: #01A9DB;
		padding: 20px;
		border: 1px solid #bcbcbc;
	}
	#nav_left {
		padding: 20px;
		width: 200px;
		margin-right: 35px;
		float: left;
		border: 1px solid #bcbcbc;
	}
	#content {
		width: 1100px;
		padding: 20px;
		float: left;
		border: 1px solid #bcbcbc;
	}
	#nav_right {
		width: 300px;
		padding: 20px;
		float: right;
		border: 1px solid #bcbcbc;
	}
	#footer {
		clear: both;
		padding: 20px;
		text-align:center;
		border: 1px solid #bcbcbc;
	}
</style>
<title>Basic Page</title>
</head>
<body>
<div id="head_wrap">
	<div id="header">
		<div class="logo_area" style="float: left;">
			<img src="/images/logo.jpg" style="cursor:pointer;" onclick="pageMoveHeader('HOME', '/index.asp');">
		</div>

		<div class="menu_area">
				<li style="float: left;"><img src="/images/menu1.jpg" style="cursor:pointer;" onclick="pageMoveHeader('HOME', '/index.asp');"></li>
				<li style="float: left;"><img src="/images/menu4.jpg" style="cursor:pointer;" onclick="pageMoveHeader('HOME', '/index.asp');"></li>
				<li style="float: left;"><img src="/images/menu5.jpg" style="cursor:pointer;" onclick="pageMoveHeader('HOME', '/index.asp');"></li>
				<li style="float: left;"><img src="/images/menu6.jpg" style="cursor:pointer;" onclick="pageMoveHeader('HOME', '/index.asp');"></li>
				<li style="float: left;"><img src="/images/menu7.jpg" style="cursor:pointer;" onclick="pageMoveHeader('HOME', '/index.asp');"></li>
				<li><img src="/images/menu100.jpg" style="cursor:pointer;" onclick="pageMoveHeader('HOME', '/index.asp');"></li>
		</div>
	</div>

	<div id="nav_left">
		<div class="left_area">
			<div style="border: 1px solid #bcbcbc; margin-bottom:30px;">
				<ul>
					<li><img src="images/noimage_65.jpg"></li>
					<li class="title">[정보수정]</li>
					<li class="title">[로그아웃]</li>
				</ul>
			</div>

			<div style="border: 1px solid #bcbcbc; margin-bottom:30px;">
				<ul>
					<li class="title">[정보수정]</li>
					<li class="title">[정보수정]</li>
					<li class="title">[정보수정]</li>
					<li class="title">[정보수정]</li>
					<li class="title">[정보수정]</li>
				</ul>
			</div>

			<div style="border: 1px solid #bcbcbc;">
				<ul>
					<li class="title">[정보수정]</li>
					<li class="title">[정보수정]</li>
					<li class="title">[정보수정]</li>
					<li class="title">[정보수정]</li>
					<li class="title">[정보수정]</li>
				</ul>
			</div>
		</div>
	</div>
	<div id="content">
		<div style="border: 1px solid #bcbcbc; margin-bottom:30px;">
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean nec mollis nulla. Phasellus lacinia tempus mauris eu laoreet. Proin gravida velit dictum dui consequat malesuada. Aenean et nibh eu purus scelerisque aliquet nec non justo. Aliquam vitae aliquet ipsum. Etiam condimentum varius purus ut ultricies. Mauris id odio pretium, sollicitudin sapien eget, adipiscing risus.</p>
		</div>

		<div style="border: 1px solid #bcbcbc; margin-bottom:30px;">
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean nec mollis nulla. Phasellus lacinia tempus mauris eu laoreet. Proin gravida velit dictum dui consequat malesuada. Aenean et nibh eu purus scelerisque aliquet nec non justo. Aliquam vitae aliquet ipsum. Etiam condimentum varius purus ut ultricies. Mauris id odio pretium, sollicitudin sapien eget, adipiscing risus.</p>
		</div>

		<div style="border: 1px solid #bcbcbc;">
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean nec mollis nulla. Phasellus lacinia tempus mauris eu laoreet. Proin gravida velit dictum dui consequat malesuada. Aenean et nibh eu purus scelerisque aliquet nec non justo. Aliquam vitae aliquet ipsum. Etiam condimentum varius purus ut ultricies. Mauris id odio pretium, sollicitudin sapien eget, adipiscing risus.</p>
		</div>
	</div>
	<div id="nav_right">
		<div style="border: 1px solid #bcbcbc; margin-bottom:50px;">
				<ul>
					<li class="title">[정보수정]</li>
					<li class="title">[정보수정]</li>
					<li class="title">[정보수정]</li>
					<li class="title">[정보수정]</li>
					<li class="title">[정보수정]</li>
					<li class="title">[정보수정]</li>
					<li class="title">[정보수정]</li>
					<li class="title">[정보수정]</li>
				</ul>
		</div>

		<div style="border: 1px solid #bcbcbc;">
				<ul>
					<li class="title">[정보수정]</li>
					<li class="title">[정보수정]</li>
					<li class="title">[정보수정]</li>
					<li class="title">[정보수정]</li>
					<li class="title">[정보수정]</li>
					<li class="title">[정보수정]</li>
					<li class="title">[정보수정]</li>
					<li class="title">[정보수정]</li>
				</ul>
		</div>
	</div>
	<div id="footer">
		Copyright  <span>iroom community. </span> All rights reserved.	
	</div>
</div>
<div style="clear:both;"></div>
</body>
</html>

