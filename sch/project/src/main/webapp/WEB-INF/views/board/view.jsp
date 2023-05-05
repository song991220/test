<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 조회</title>
</head>
<body>
<div id="nav">
 <%@ include file="../include/nav.jsp" %>
</div>

		<label>아이디번호</label>${view.id}<br> 
		<label>타이틀</label>${view.title}<br>
		<label>가수</label>${view.singersong}<br>
	<a href="/board/modify?id=${view.id}">게시물 수정</a> , <a href="/board/delete?id=${view.id}">게시물 삭제</a>

</body>
</html>