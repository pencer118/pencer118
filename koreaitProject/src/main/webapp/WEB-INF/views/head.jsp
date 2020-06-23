<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
	<title>List</title>
	<style type="text/css">
	
	#head h1{
	text-align: center;
	background-color: #2478FF;
	margin-bottom: 0;
	
	}
	/* #head h1:hover{font-size: 250%;
	}
	#head h1:active {font-size: 250%
	} */
	
	#lili {background-color: #2478FF;}
	#lili a {
	  text-decoration: none;
	  color: white;
	  font-size: 20px;
	  padding: 15px;
	  display:inline-block;
	}
	ul {
	  display: inline;
	  margin: 0;
	  padding: 0;
	}
	ul li {display: inline-block;}
	ul li:hover {background: #f9f9;}
	ul li:hover ul {display: block;}
	ul li ul {
	  position: absolute;
	  width: 200px;
	  display: none;
	}
	ul li ul li { 
	  background: #2474FF; 
	  display: block; 
	}
	ul li ul li a {display:block !important;} 
	ul li ul li:hover {background: #f9f7;}
	
	#video {
     position: absolute;
     top: 0px;
     left: 0px;
     min-width: 100%;
     min-height: 100%;
     width: auto;
     height: auto;
     z-index: -1;
     overflow: hidden;
	}
	#con td{
	text-align: center;
	font-weight: bold;
	
	
	}

	</style>
</head>
<body>
<video id="video" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
      <source src=".\resources\movie.mp4">
</video>

<div id="head"><h1>아무전자&nbsp&nbsp<img src=".\resources\11.jpg" width="100px" height="30px"></h1></div>
<div id="lili">
  <a href="#">Operation</a>
  <ul>
    <li style="position: relative; left: 300px;">
      <a href="#">임금 관리</a>
      <ul>
        <li ><a href="#">Couter</a></li>
        <li ><a href="#">Marketing</a></li>
        <li ><a href="#">Business</a></li>
      </ul>
    </li>
  </ul>
  <ul>
    <li style="position: relative; left: 550px;">
      <a href="#">부서 이직</a>
      <ul>
        <li ><a href="#">Other</a></li>
        <li ><a href="#">Rear</a></li>
        <li ><a href="#">Front</a></li>
      </ul>
    </li>
  </ul>
  <ul>
    <li style="position: relative; left: 800px;">
      <a href="#">Member</a>
      <ul>
        <li ><a href="#">Login</a></li>
        <li ><a href="join">Join us</a></li>
        <li ><a href="#">Detail</a></li>
      </ul>
    </li>
  </ul>
</div>


</body>
</html>
