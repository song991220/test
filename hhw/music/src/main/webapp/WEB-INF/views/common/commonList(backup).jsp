<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
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

</head>
<body>
	<div class="container">

		<div class="row">
			<div class="col">groupcd</div>
			<div class="col">code</div>
			<div class="col">value</div>
			<div class="col">delyn</div>
			<div class="col">reg_user</div>
			<div class="col">reg_date</div>
			<div class="col">up_user</div>
			<div class="col">up_date</div>
			<div class="col">button</div>
		</div>

		<c:forEach var="commonvo" items="${lists }">
			<div class="row">
				<div class="col">${commonvo.groupcd }</div>
				<div class="col">${commonvo.code }</div>
				<div class="col">${commonvo.value }</div>
				<div class="col">${commonvo.delyn }</div>
				<div class="col">${commonvo.reg_user }</div>
				<div class="col">${commonvo.reg_date }</div>
				<div class="col">${commonvo.up_user }</div>
				<div class="col">${commonvo.up_date }</div>
				<div class="col">
				<a href= "/commondetail?value=${commonvo.value}" role="button" class="btn btn-outline-info">수정</a>
				</div>
			</div>
		</c:forEach>
	</div>

</body>
</html>