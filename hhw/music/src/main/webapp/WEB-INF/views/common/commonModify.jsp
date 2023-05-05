<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>
<body>
	<form name="update" method="post"
		action="/commonmodify?groupcd=${data.groupcd}&code=${data.code}">

		<p>
			그룹코드 : <input type="text" name="groupcd" value="${data.groupcd }"
				disabled>
		</p>
		<p>
			코드 : <input type="text" name="code" value="${data.code }" disabled>
		</p>
		<p>
			코드값 : <input type="text" name="value" value="${data.value }">
			<%-- <input type="text" name="value" value="${data.value}"> --%>

		</p>
		<p>
			사용여부 : <select name="delyn" style="width: 50px">
				<option value="N">N</option>
				<option value="Y">Y</option>
			</select>
		</p>
		<div>
			<input type="submit" class="btn btn-success" value="완료">
			<input type="reset" class="btn btn-warning" value="리셋">
		</div>
	</form>
</body>
</html>