<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	img{
		width: 300px;
		height: 300px;
	}
	body {
		background: black;
	}
	
	
</style>
<script type="text/javascript">


</script>
</head>
<body>
<div>
	<img src="${pageContext.request.contextPath }/resources/memberPhoto/${memberPhoto}" alt="img">
</div>
<div style="">
	<input type="button" value="사진 저장하기" onclick="location.href='download?fileName=${memberPhoto}'">
</div>

</body>
</html>