<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
</head>
<body>
<div id="nav">
 <%@ include file="../include/nav.jsp" %>
</div>
<form method="post">

		<label>아이디번호</label><input type="text" name= "id" value ="${view.id}" /><br> 
		<label>타이틀</label><input type="text" name="title" value ="${view.title}" /><br> 
		<label>가수</label><input type="text"  name="singersong" value = "${view.singersong}"/><br>

		<button type="submit">완료</button>

	</form>
</body>
</html>