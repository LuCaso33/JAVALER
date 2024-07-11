<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><fmt:message key="myPosts" />s</title>
<style type="text/css">
table { table-layout:fixed; }
table td { overflow:hidden; text-overflow:ellipsis; white-space:nowrap; }
.grid li div span{ float: right; }
</style>
</head>
<body>
<fmt:setLocale value="${sessionScope.language}" />
<fmt:bundle basename="bundle.message">
<h3><fmt:message key="myPosts" /></h3>
<form id="list" method="post" action="">
    <input type="hidden" name="curPage" value="1" />
    <input type="hidden" name="id" />
    <div id="list-top">
        <div>
            <ul>
                <li>
                    <select name="search" class="w-px80">
                        <option value="all" ${page.search eq 'all' ? 'selected' : '' }><fmt:message key="entire" /></option>
                        <option value="title" ${page.search eq 'title' ? 'selected' : '' }><fmt:message key="title" /></option>
                        <option value="content" ${page.search eq 'content' ? 'selected' : '' }><fmt:message key="content" /></option>
                    </select>
                </li>
                <li>
                    <input type="text" name="keyword" class="w-px300"/>
                </li>
                <li>
                    <a class="btn-fill" onclick="$('form').submit()"><fmt:message key="search" /></a>
                </li>
            </ul>
            <ul>
                <li>
                    <select name="pageList" class="w-px80" onchange="$('[name=curPage]').val(1); $('form').submit()">
                        <option value="10" ${page.pageList eq 10 ? 'selected' : '' }>10<fmt:message key="items" /></option>
                        <option value="20" ${page.pageList eq 20 ? 'selected' : '' }>20<fmt:message key="items" /></option>
                        <option value="30" ${page.pageList eq 30 ? 'selected' : '' }>30<fmt:message key="items" /></option>
                    </select>
                </li>
                <li>
                    <select name="viewType" class="w-px100" onchange="$('form').submit()">
                        <option value="list" ${page.viewType eq 'list' ? 'selected' : '' }><fmt:message key="listFormat" /></option>
                        <option value="grid" ${page.viewType eq 'grid' ? 'selected' : '' }><fmt:message key="checkerboardFormat" /></option>
                    </select>
                </li>
            </ul>
        </div>
    </div>
</form>

<div id="data-list">
    <core:if test="${page.viewType eq 'list' }">
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
                    <td class="left"><a onclick="go_detail(${vo.id}, '${vo.tableName}')">${vo.title }</a></td>
                    <td>${vo.name }</td>
                    <td>${vo.writedate }</td>
                    <td>
                        <core:if test="${!empty vo.filename }">
                            <img src="img/attach.png" class="file-img"/>
                        </core:if>
                    </td>
                </tr>
            </core:forEach>
        </table>
    </core:if>
    
    <core:if test="${page.viewType eq 'grid' }">
        <ul class="grid">
            <core:forEach items="${page.list }" var="vo">
                <li>
                    <div><a onclick="go_detail(${vo.id}, '${vo.tableName}')">${vo.title }</a></div>
                    <div>${vo.name }</div>
                    <div>
                        ${vo.writedate }
                        <span>${empty vo.filename ? '' : '<img src="img/attach.png" class="file-img" />' }</span>
                    </div>
                </li>
            </core:forEach>
        </ul>
    </core:if>
</div>

<div class="btnSet">
    <jsp:include page="/WEB-INF/views/include/page.jsp"/>
</div>
</fmt:bundle>
<script type="text/javascript">
$(function(){
    $('#data-list ul').css('height', 
            ( ( $('.grid li').length % 5 > 0 ? 1 : 0 ) + Math.floor($('.grid li').length / 5) )
             * $('.grid li').outerHeight(true) - 20);
})

function go_detail(id, tableName) {
	
    let url = '';
    switch(tableName) {
        case 'BOARD':
            url = 'detail.bo';
            break;
        case 'NOTICE':
            url = 'detail.no?id=' + id;
            break;
        case 'QNA':
            url = 'detail.qna?id=' + id;
            break;
        default:
            return;
    }
    $('[name=id]').val(id);
    $('form').attr('action', url);
    $('form').submit();    
}
</script>
</body>
</html>
