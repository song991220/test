<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
</head>
<body>
	<div id="nav">
		<%@ include file="../include/nav.jsp"%>
	</div>
	<table>
		<thead>
			<tr>
				<th>아이디번호</th>
				<th>타이틀</th>
				<th>등록일</th>
				<th>가수</th>
				<!--<th>조회수</th>-->
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.id}</td>
					<th>
					<td><a href="/board/view?id=${list.id}">${list.title}</a> <!-- 제목 --></td>
					</th>

					<th>
					<td><fmt:formatDate value="${list.reg_date}"
							pattern="yyyy-MM-dd" /></td>
					</th>
					<td>${list.singersong}</td>
					<!--  <td>${list.viewCnt}</td>-->
				</tr>
			</c:forEach>
		</tbody>

	</table>
	<div>
		<c:if test="${prev}">
			<span>[ <a href="/board/listPage?num=${startPageNum - 1}">이전</a>
				]
			</span>
		</c:if>

		<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
			<span> <a href="/board/listPage?num=${num}">${num}</a>
			</span>
		</c:forEach>

		<c:if test="${next}">
			<span>[ <a href="/board/listPage?num=${endPageNum + 1}">다음</a>
				]
			</span>
		</c:if>
	</div>
	
	<!-- <div>
		<c:forEach begin="1" end="${pageNum}" var="num">
			<span> <a href="/board/listPage?num=${num}">${num}</a>
			</span>
		</c:forEach> 
	</div> -->
</body>
</html>