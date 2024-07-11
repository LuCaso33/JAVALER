<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%> <!-- 타일을 사용하기 위한 라이브러리 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<fmt:setLocale value="${sessionScope.language}" />
<fmt:bundle basename="bundle.message">
    <form id="languageForm" method="post" action="changeLanguage">
        <input type="hidden" name="language" id="languageInput">
        <a href="javascript:void(0);" onclick="changeLanguage('ko')">Korean</a> | 
        <a href="javascript:void(0);" onclick="changeLanguage('jp')">Japanese</a>
    </form>
</fmt:bundle>
<title>${category eq 'cu' ? 'メンテナンス依頼' : (category eq 'qna' ? 'プロジェクト問い合わせ' : (category eq 'no' ? 'メンテナンス問い合わせ' : (category eq 'bo' ? '採用応募' : (category eq 'da' ? '協力会社' : (category eq 'join' ? '会員登録' : '') ) ) ) )} ${empty category ? '' : ' : ' }JAVALAR</title>
<!-- 브라우저 탭의 작은 아이콘 설정 -->
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/icon.ico" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/js/all.min.js"></script>
<!-- cdnjs.com에서 가져온 fontawesome cdn 라이브러리 -->
<!-- 모든 화면에서 사용하기 위해 join.jsp에 있던 코드를 layout.jsp로 옮겨온다. -->
</head>
<body>
<fmt:setLocale value="${sessionScope.language}" />
<fmt:bundle basename="bundle.message">
<!-- 각 jsp 파일의 인클루드 단을 없애도 된다. -->
<tiles:insertAttribute name="header" />

<!-- 각 jsp 파일의 div id="content" 부분을 없애도 된다. -->
<div id="content">
	<tiles:insertAttribute name="content" />
</div>
<tiles:insertAttribute name="estimateButton" />
<tiles:insertAttribute name="chatButton" />

<tiles:insertAttribute name="footer" />

</fmt:bundle>
<script>
    function changeLanguage(language) {
        document.getElementById('languageInput').value = language;
        document.getElementById('languageForm').submit();
    }
</script>
</body>
</html>