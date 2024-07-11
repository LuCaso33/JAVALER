<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- クイック見積ボタンアイコン CSS -->

<style>
/*縦書きバー
---------------------------------------------------------------------------*/
#estimate-parts a {
    text-decoration: none;
    display: block;
    writing-mode: vertical-rl;
    text-orientation: upright;
    background: #007bff; /*背景色を青に設定*/
    color: #fff; /*文字色*/
    position: fixed;
    z-index: 2; /* `chatButton.jsp`より上に配置されるようにする */
    right: 0px; /*ボタンの右からの配置場所指定*/
    top: 350px; /*ボタンの上からの配置場所指定、`chatButton.jsp`の上に位置させる*/
    padding: 20px 15px; /*ボタン内の余白。上下、左右。*/
    border-radius: 10px 0px 0px 10px; /*角を丸くする指定。左上、右上、右下、左下の順番。*/
    letter-spacing: 0.1rem; /*文字間隔を少しだけ広く*/
    transition: all 0.3s ease; /*動的な動きを追加するためのトランジション*/
}

/* 文書アイコン */
#estimate-parts i {
    transform: scale(1.3); /*1.3倍に*/
    margin-bottom: 10px; /*下に空ける余白*/
}

/* マウスホーバー時の動的な動き */
#estimate-parts a:hover {
    background: #0056b3; /*ホーバー時の背景色を濃い青に設定*/
    transform: scale(1.1); /*ホーバー時に少し大きくなる*/
}
</style>

<!-- クイック見積ウィンドウを開く関数 -->
<!-- <script>
    function openEstimate() {
        window.open("${pageContext.request.contextPath}/estimate", "_blank",
                "width=800,height=1500");
    }
</script> -->

<!-- クイック見積ボタンアイコン -->
<fmt:setLocale value="${sessionScope.language}" />
<fmt:bundle basename="bundle.message">
<div id="estimate-parts">
    <a href="${pageContext.request.contextPath}/estimate"><i class="fas fa-file-alt"></i><fmt:message key="quickEstimate" /></a>
</div>
</fmt:bundle>