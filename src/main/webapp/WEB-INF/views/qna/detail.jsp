<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>프로젝트 문의</h3>
<table>
	<tr>
		<th class="w-px160">제목</th>
		<td colspan="5" class="left">${vo.title }</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${vo.name }</td>
		<th class="w-px120">작성일자</th>
		<td class="w-px120">${vo.writedate }</td>
		<th class="w-px80">조회수</th>
		<td class="w-px80">${vo.readcnt }</td>
	</tr>
	<c:if test="${vo.sortation ne 'default' or vo.method ne 'default' or vo.cname ne 'default' or vo.budget ne 'default' or vo.limitDate ne 'default' or vo.url ne 'default'}">
    <tr>
        <th>프로젝트 구분</th>
        <td colspan="5" class="left">${vo.sortation }</td>
    </tr>
    <tr>
        <th>상담방법</th>
        <td colspan="5" class="left">${vo.method }</td>
    </tr>
    <tr>
        <th>회사명</th>
        <td colspan="5" class="left">${vo.cname }</td>
    </tr>
    <tr>
        <th>프로젝트 예산(만원)</th>
        <td colspan="5" class="left">${vo.budget }</td>
    </tr>
    <tr>
        <th>프로젝트 기한</th>
        <td colspan="5" class="left">${vo.limitDate }</td>
    </tr>
    <tr>
        <th>참조 사이트</th>
        <td colspan="5" class="left">${vo.url }</td>
    </tr>
	</c:if>
	<tr>
		<th>내용</th>
		<td colspan="5" class="left">${fn:replace(vo.content, crlf, '<br>') }</td>
	</tr>
	<tr>
		<th>첨부 파일</th>
		<td colspan="5" class="left">
			${vo.filename }
			<core:if test="${!empty vo.filename }">
				<a href="download.qna?id=${vo.id }" style="margin-left: 15px"><i class="fas fa-download font-img"></i></a>
			</core:if>
		</td>
	</tr>
</table>

<div class="btnSet">
	<core:choose>
    <core:when test="${sessionScope.category == 'myPost'}">
        <a class="btn-fill" href="myPost">목록으로</a>
    </core:when>
    <core:otherwise>
        <a class="btn-fill" href="list.qna">목록으로</a>
    </core:otherwise>
	</core:choose>
	<!-- 회원인 경우 수정, 관리자는 수정, 삭제 가능 -->
	<core:if test="${login_info.id eq vo.writer}"> 
		<a class="btn-fill" href="modify.qna?id=${vo.id }">수정</a>
	</core:if>
	<core:if test="${login_info.id eq vo.writer or login_info.admin eq 'Y' }"> 
		<a class="btn-fill" onclick="if(confirm('정말 삭제하시겠습니까?')) { href='delete.qna?id=${vo.id }' }">삭제</a>
	</core:if>
	<!-- 관리자의 경우 답글 쓰기 가능 -->
	<core:if test="${login_info.admin eq 'Y' }">
		<a class="btn-fill" href="reply.qna?id=${vo.id }">답글 쓰기</a>
	</core:if>
</div>
</body>
</html>