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
					<td><a href="/board/view?id=${list.id}">${list.title}</a> 
					<!-- 제목 --></td></th>

					<th>
					<td><fmt:formatDate value="${list.reg_date}" pattern="yyyy-MM-dd" /></td>
					</th>
					<td>${list.singersong}</td>
					<!--  <td>${list.viewCnt}</td>-->
				</tr>
			</c:forEach>
		</tbody>

	</table>

<div>
<c:if test="${page.prev}">
 <span>[ <a href="/board/listPage?num=${page.startPageNum - 1}">이전</a> ]</span>
</c:if>

<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
  <span>
    <!-- 반복문 중간에 조건을 넣어서, select의 값이 num과 다를 경우 링크를 그대로 출력하고
select의 값이 num과 같을 경우 링크가 아닌 굵은 글자로 출력-->
 
  <c:if test="${select != num}">
   <a href="/board/listPage?num=${num}">${num}</a>
  </c:if>    
  
  <c:if test="${select == num}">
   <b>${num}</b>
  </c:if>
    
 </span>
</c:forEach>

<c:if test="${page.next}">
 <span>[ <a href="/board/listPage?num=${page.endPageNum + 1}">다음</a> ]</span>
</c:if>
</div>

<!-- <div>
		<c:forEach begin="1" end="${pageNum}" var="num">
			<span> <a href="/board/listPage?num=${num}">${num}</a>
			</span> ㅓ               
		</c:forEach>
	</div> -->
</body>
</html>