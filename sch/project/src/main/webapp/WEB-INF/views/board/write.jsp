<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
</head>
<body>
<div id="nav">
 <%@ include file="../include/nav.jsp" %>
</div>
	<form method="post">

		<label>아이디번호</label><input type="text" name="id" /><br> 
		<label>타이틀</label><input type="text" name="title" /><br> 
		<label>가수</label><input type="text"  name="singersong"/><br>

		<button type="submit">작성</button>

	</form>
</body>
</html>