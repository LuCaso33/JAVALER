<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 1:1 채팅 버튼 아이콘 CSS -->

<style>
/*縦書きバー
---------------------------------------------------------------------------*/
#message-parts a {
	text-decoration: none;
	display: block;
	writing-mode: vertical-rl;
	text-orientation: upright;
	background: #ff7e00; /*背景色*/
	color: #fff; /*文字色*/
	position: fixed;
	/*スクロールしてもボタンが移動しないようにする指定。移動させたいならfixedをabsoluteにして下さい。*/
	z-index: 1;
	right: 0px; /*ボタンの右からの配置場所指定*/
	top: 520px; /*ボタンの上からの配置場所指定*/
	padding: 20px 15px; /*ボタン内の余白。上下、左右。*/
	border-radius: 10px 0px 0px 10px; /*角を丸くする指定。左上、右上、右下、左下の順番。*/
	letter-spacing: 0.1rem; /*文字間隔を少しだけ広く*/
}

/*ふきだしアイコン*/
#message-parts i {
	transform: scale(1.3); /*1.3倍に*/
	margin-bottom: 10px; /*下に空ける余白*/
}
</style>

<!-- 채팅창 새창으로 여는 함수 -->
<script>
	function openChat() {
		window.open("${pageContext.request.contextPath}/chat", "_blank",
				"width=800,height=1500");
	}
</script>
<!-- 1:1 채팅 버튼 아이콘 -->
<div id="message-parts">
	<a onclick="openChat()"><i class="fas fa-comment-dots"></i>チャット対応中</a>
</div>
