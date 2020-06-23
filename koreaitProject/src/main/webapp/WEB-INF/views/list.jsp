<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
	<title>List</title>
	<style type="text/css">
	#category td{
	text-align:center;
	text-decoration:underline;
	text-shadow: 2px 2px 5px #FF0000;
	color:white;
	font-weight: bold;
	font-size: 3.5em;
	 white-space: normal;
	}
	#con td{
	text-align: center;
	font-weight: bold;
	color: white;
	
	}
	img{
	width: 40;
	height: 40;
	
	}
	</style>
	<script type="text/javascript">
	
	
	</script>
</head>
<body>
<jsp:include page="head.jsp" flush="true"/>
<div id="con2"style="margin-top: 100px;">

<table width="1000" align="center" border="1" cellpadding="5" cellspacing="0">
		<tr id="category" >
			<td>이름 </td>
			<td>나이 </td>
			<td>부서</td>
			<td>비고 </td>
		</tr>
		 <c:set var="list" value="${boardList.boardList}"/>
		 
   <c:if test="${list.size() ==0}">
	   <table width="1000" align="center" border="1" cellpadding="5" cellspacing="0">
	   		<tr>
	   			<td style="font-size: 3.5em;color:red;"><marquee scrollamount="24">저장된 사원정보가 없습니다.</marquee></td>
	   		</tr>
	   </table>
   </c:if>
   
	   <c:if test="${list.size() !=0}">
	
   <c:forEach var="vo" items="${list}">
  
			<tr id="con">
				<c:set var="memberPhoto" value="${vo.memberPhoto}"/>
				<td><a href='javascript:void(0);' onclick="window.open('downImg?memberPhoto=${memberPhoto}','imgDown','width=350,height=420, scrollbars=yes, resizable=yes');"><img src="${pageContext.request.contextPath }/resources/memberPhoto/${memberPhoto}" alt="img"></a>${vo.name}</td>
				<td>${vo.age}</td>
				<td>${vo.depart}</td>
				<td>${vo.con}</td>
			<td><a href="update?idx=${vo.idx}&age=${vo.age}&name=${vo.name}&img=${memberPhoto}&con=${vo.con}"><input type="button" value="수정"/></a>
			<a href="delete?idx=${vo.idx}"><input type="button" value="삭제"/></a></td>
			</tr>
			
	</c:forEach>
	
		</c:if>
</table>

</div>
<div><a href="home"><button value="back" style="position: relative; left: 1295px;">작성하기</button></a></div>
</body>
</html>
