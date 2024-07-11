<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna list JSP</title>
</head>
<body>
<fmt:setLocale value="${sessionScope.language}" />
<fmt:bundle basename="bundle.message">
<h3><fmt:message key="projectInquiries" /></h3>
<form method="post" action="list.qna" id="list">
	<input type="hidden" name="curPage" value="1" />
	
	<div id="list-top">
		<div>
			<ul>
				<li>
					<select name="search" class="w-px80">
						<option value="all" ${page.search eq 'all' ? 'selected' : '' }><fmt:message key="entire" /></option>
						<option value="title" ${page.search eq 'title' ? 'selected' : '' }><fmt:message key="title" /></option>
						<option value="content" ${page.search eq 'content' ? 'selected' : '' }><fmt:message key="content" /></option>
						<option value="writer" ${page.search eq 'writer' ? 'selected' : '' }><fmt:message key="writer" /></option>
					</select>
				</li>
				<li><input value="${page.keyword }" type="text" name="keyword" class="w-px300" /></li>
				<li><a class="btn-fill" onclick="$('form').submit()"><fmt:message key="search" /></a></li>
			</ul>
			<ul>
				<core:if test="${!empty login_info }">
					<li><a class="btn-fill" href="new.qna"><fmt:message key="post" /></a></li>
				</core:if>			
			</ul>
		</div>
	</div>
</form>

<table>
	<tr>
		<th class="w-px60"><fmt:message key="number" /></th>
		<th><fmt:message key="title" /></th>
		<th class="w-px100"><fmt:message key="writer" /></th>
		<th class="w-px120"><fmt:message key="postDate" /></th>
		<th class="w-px60"><fmt:message key="attachments" /></th>
	</tr>
	<core:forEach items="${page.list }" var="vo">
		<tr>
			<td>${vo.no }</td>
			<td class="left">
				<core:forEach var="i" begin="1" end="${vo.indent }">
					${i eq vo.indent ? "<img src='img/re.gif' />" : "&nbsp;&nbsp;" }
				</core:forEach>
				<core:choose>
					<core:when test="${login_info.admin == 'Y' || fn:contains(myPostIds, vo.id) || fn:contains(myPostIds, vo.root + 1)}">
						<a href="detail.qna?id=${vo.id }" >${vo.title }</a>
					</core:when>
					<core:otherwise>
						<a href="javascript:void(0);" onclick="alert('閲覧できません')">${vo.title }</a>
					</core:otherwise>
				</core:choose>
			</td>
			<td>${vo.writer }</td>
			<td>${vo.writedate }</td>
			<td>
				<core:if test="${!empty vo.filename }">
					<a href="download.qna?id=${vo.id }">
						<img title="${vo.filename }" class="file-img" src="img/attach.png" />
					</a>
				</core:if>
			</td>
		</tr>
	</core:forEach>
</table>
<div class="btnSet">
	<jsp:include page="/WEB-INF/views/include/page.jsp"/>
</div>
<core:if test="${not empty alertMessage}">
    <script type="text/javascript">
        alert("${alertMessage}");
    </script>
</core:if>
</fmt:bundle>
</body>
</html>