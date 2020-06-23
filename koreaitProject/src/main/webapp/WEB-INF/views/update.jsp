<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- <%@ page session="false" %> --%>
<html>
<head>
 	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
	<title>Home</title>
	<style type="text/css">
	#add{
	font-weight:bold;
	font-size: 1.5em;
	}
	body {
	margin : 0;
	padding : 0;
	background : url (img.jpg) center center fixed no-repeat;
	}
	td{
	color:white;
	}
	     .img_wrap {
            width: 200px;
            margin-top: 10px;
        }
        .img_wrap img {
            max-width: 100%;
        }
	</style>
	
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 	
	<script type="text/javascript">
	
    var sel_file;
    
    $(document).ready(function() {
        $("#input_img").on("change", handleImgFileSelect);
    }); 

    function handleImgFileSelect(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);

        filesArr.forEach(function(f) {
            if(!f.type.match("image.*")) {
                alert("이미지 파일을 넣어주세요.");
                return;
            }

            sel_file = f;

            var reader = new FileReader();
            reader.onload = function(e) {
                $("#img").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
    }
	
	</script>	
	
	
	
</head>
<body>

<jsp:include page="head.jsp" flush="true"/>
<form action="updateOK"  method="POST" enctype="multipart/form-data">
<table width="1000" align="center" border="1" cellpadding="5" cellspacing="0">
<caption id="add" style="color:white;">사원 수정 </caption>
		<tr>
			<td>사진 등록 :</td>
			<td><input type="file" name="file" id="input_img">
				<div class="img_wrap"><img id="img" src="${pageContext.request.contextPath }/resources/memberPhoto/${memberPhoto}"/></div>
				
				<input type="hidden" name="memberPhoto" value="img"/>
			</td>
			
		</tr>
		<tr>
			<td>이름 : </td>
			<td><input type="text"  name="name" value="${name}"/></td>
		</tr>
		<tr>
			<td>나이 : </td>
			<td><input type="text"  name="age" value="${age}"/></td>
		</tr>
		<tr>
			<td>부서 : </td>
			<td><select name="depart" id="depart">
				<option value="인사부" id="person">인사</option>			
				<option value="경영부" id="manager">경영</option>			
				<option value="영업부" id="business">영업</option>			
				<option value="마케팅부" id="marketing">마케팅</option>			
			</select></td>
		</tr>
		<tr>
			<td>비고 : </td>
			<td><input type="text" name="con" style="width: 100%;" value="${con}"/></td>
		</tr>
		<tr>
			<td><input type="submit" value="수정하기"/><br/><input type="button" onclick="location.href='list'" value="돌아가기"/><input type="hidden" name="idx" value="${idx}"/></td>

		</tr>
	
</table>

</form>

</body>
</html>
