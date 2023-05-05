<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- Option 1: Bootstrap Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>공통코드 수정</title>
<!-- Bootstrap CSS -->


</head>
<body>
	<form name="detail" method="post"
		action="/commondetail?groupcd=${data.groupcd}&code=${data.code}">
		<p>그룹코드 : <input name="groupcd" value="${data.groupcd }" type="text" disabled> </p>
		<p>코드 : <input name="code" value="${data.code }" type="text" disabled></p>
		<p>코드값 :<input name="value" value="${data.value}" type="text" readonly></p>
		<p>사용여부 : <input name="delyn" value="${data.delyn}" type="text" readonly></p>
		<p>
			<a href="/commonmodify?groupcd=${data.groupcd}&code=${data.code}" role="button" class="btn btn-success">수정</a>
			<input type="submit" class="btn btn-danger" value="삭제">
		</p> 
	</form>
</body>
</html>