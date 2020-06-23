<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
	<title>List</title>
	<style type="text/css">
		caption{
		font-weight: bold;
		font-size: 2.5em;
		}
		#table{
		margin: auto;
		}
		#table td{
		color: white;
		}
		#table tr{
		}
		#table input{
		width: 700;
		}
	</style>
	<script type="text/javascript">
	function checkform() {
		var re = /^[a-zA-Z0-9]{4,12}$/;
		
		var joinOK = document.joinOK;
		var id = joinOK.id.value;
		var password = joinOK.password.value;
		var password_check = joinOK.password_check.value;
		var name = joinOK.name.value;
		var phone = joinOK.phone.value;
		var userNumber = joinOK.userNumber.value;
		var ip = joinOK.ip.value;
		if (id.trim().length==0) {
			alert("아이디를 입력하세요");
			joinOK.id.focus();
			return false;
		}
		if (password=="") {
			alert("비밀번호를 입력하세요");
			return false;
		}
		
		if (name=="") {
			alert("이름을 입력하세요");
			joinOK.name.focus();
			return false;
		}
		if (phone=="") {
			alert("핸드폰 번호를 입력하세요");
			return false;
		}
		if (userNumber=="") {
			alert("사원번호를 입력하세요");
			return false;
		}
		return ""
		
	}
	
	
	
	</script>
</head>
<body>
	<jsp:include page="head.jsp" flush="true"/>
	<div>
	<form action="joinOK" method="post" name="joinOK">
		<table  cellpadding="0" cellspacing="10" id="table">
			<caption>관리자 등록</caption>
			<tr>
				<td style="border-style: solid;">ID :</td> <td><input type="text" name="id" id="id" placeholder="사용하실 아이디를 입력하세요."></td>
			</tr>
			<tr>
				<td style="border-style: solid; ">PASSWORD : </td><td><input type="password" name="password" id="password" placeholder="비밀번호를 입력하세요."></td>
			</tr>
			<tr>
				<td style="border-style: solid;">password check : </td><td><input type="password" name="password_check" id="password_check" placeholder="비밀번호 확인"></td>
			</tr>
			<tr>
				<td style="border-style: solid;">NAME : </td><td><input type="text" name="name" id="name" placeholder="이름을 입력하세요."></td>
			</tr>
			<tr>
				<td style="border-style: solid; ">H.P : </td><td><input type="text" name="phone" id="phone" placeholder="연락 가능 번호를 입력하세요."></td>
			</tr>
			<tr>
				<td style="border-style: solid; ">사원 번호 : </td><td><input type="text" name="userNumber" id="userNumber" placeholder="사원번호를 입력하세요."></td>
			</tr>
			<tr>
				<td style="border-style: solid; ">IP : </td><td><textarea style="resize: none;" readonly="readonly" name="ip" id="ip">${ip}</textarea></td>
			</tr>
			<tr>
				<td ><button onclick="return checkform()" >등록하기</button></td>
			</tr>
		</table>
	</form>
	</div>



</body>
</html>
