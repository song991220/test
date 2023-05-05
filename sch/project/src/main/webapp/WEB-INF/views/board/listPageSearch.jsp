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
 <span>[ <a href="/board/listPageSearch?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a> ]</span>
</c:if>

<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
 <span>
 <!-- 반복문 중간에 조건을 넣어서, select의 값이 num과 다를 경우 링크를 그대로 출력하고
select의 값이 num과 같을 경우 링크가 아닌 굵은 글자로 출력-->

  <c:if test="${select != num}">
   <a href="/board/listPageSearch?num=${num}${page.searchTypeKeyword}">${num}</a>
  </c:if>    
  
  <c:if test="${select == num}">
   <b>${num}</b>
  </c:if>
    
 </span>
</c:forEach>

<c:if test="${page.next}">
 <span>[ <a href="/board/listPageSearch?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a> ]</span>
</c:if>



<c:if test="${page.next}">
 <span>[ <a href="/board/listPageSearch?num=${page.endPageNum + 1}">다음</a> ]</span>
</c:if>

<div>
<!-- searchType는 셀렉트박스에서 가져오는 데이터고, keyword는 사용자가 입력 검색어 -->
  <select name="searchType">
  <!-- 조건 = ${page.searchType eq 'title'} 
       page.searchType와 문자열 title이 같은지(equals) 확인하는것 jstl에서는 .equals(); 대신 eq 로 짧게 사용 -->
   <!-- 검색 조건을 제목으로 한 경우, 
        컨트롤러로 전송되는 searchType의 값은 title이며, 
        이 값이 다시 뷰(jsp)로 전송되면, searchType의 값과 같은 값을 가진 option태그에 selected가 생겨서 선택된 상태가 됨 -->  
          
      <option value="title" <c:if test="${page.searchType eq 'title'}">selected</c:if>>타이틀</option>
      <option value="singersong" <c:if test="${page.searchType eq 'singersong'}">selected</c:if>>가수</option>
      <option value="title_content" <c:if test="${page.searchType eq 'title_content'}">selected</c:if>>타이틀+가수</option>
     
  </select>
  
  <input type="text" name="keyword" value = "${page.keyword}" />
  
  <button type="button" id="searchBtn">검색</button>
 </div>


</div>

<!-- <div>
		<c:forEach begin="1" end="${pageNum}" var="num">
			<span> <a href="/board/listPage?num=${num}">${num}</a>
			</span>                
		</c:forEach>
	</div> -->
	
<script>
//name이 searchType인 html 엘리먼트중 첫번째([0])의 값을 변수(let) serarchType에 저장하고, 
//name이 keyword인 html 엘리먼트중 첫번째([0])의 값을 변수(let) keyword에 저장.
 
 document.getElementById("searchBtn").onclick = function () {
    
  let searchType = document.getElementsByName("searchType")[0].value;
  let keyword =  document.getElementsByName("keyword")[0].value;
  
  //console.log(searchType)
  //console.log(keyword)
  location.href = "/board/listPageSearch?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
 };
</script>	
</body>
</html>