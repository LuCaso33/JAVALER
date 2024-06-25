<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna modify jsp</title>
</head>
<body>
<h3>QNA 수정</h3>
<!-- 
파일 첨부 시 form 태그의 필수 속성
1. method="post"
2. enctype="multipart/form-data"
 -->
<form action="update.qna" method="post" enctype="multipart/form-data">
	<input type="hidden" name="id" value="${vo.id }"/>
	<input type="hidden" name="attach" />
	<table>
		<tr>
			<th class="w-px160">제목</th>
			<td><input type="text" class="need" name="title" value="${vo.title }"/></td>
		</tr>
		<tr>
			<th>프로젝트 구분</th>
				<td>
                <%
                    String[] options = {"반응형 홈페이지 제작", "PC+MOBILE 홈페이지 제작", "쇼핑몰 제작", "광고페이지 제작" , "기타"};
                    for (int i = 0; i < options.length; i++) {
                        String sortation = options[i];
                        out.println("<input type='checkbox' id='checkbox" + (i+1) + "' name='sortation" + "' value='" + sortation + "'>");
                        out.println("<label for='checkbox" + (i+1) + "'>" + sortation + "</label>");
                    }
                %>
				</td>
		</tr>
		<tr>
			<th>상담방법</th>
				<td>
					<select name="method" id="method">
		            <option value="전화">전화</option>
		            <option value="이메일">이메일</option>
		            <option value="방문상담">방문상담</option>
        			</select>
				</td>
		</tr>
		<tr>
			<th>회사명</th>
			<td><input type="text" name="cname" /></td>
		</tr>
		<tr>
			<th>프로젝트 예산(만원)</th>
				<td>
                <%
                    String[] options2 = {"100~500", "500~1000", "1000이상"};
                    for (int i = 0; i < options2.length; i++) {
                        String budget = options2[i];
                        out.println("<input type='checkbox' id='checkbox" + (i+1) + "' name='budget" + "' value='" + budget + "'>");
                        out.println("<label for='checkbox" + (i+1) + "'>" + budget + "</label>");
                    }
                %>
				</td>
		</tr>
		<tr>
			<th>프로젝트 기한</th>
				<td>
			    <%
                    String[] options3 = {"1~3개월 이내", "3~6개월 이내", "6개월 이상"};
                    for (int i = 0; i < options3.length; i++) {
                        String limitDate = options3[i];
                        out.println("<input type='checkbox' id='checkbox" + (i+1) + "' name='limitDate" + "' value='" + limitDate + "'>");
                        out.println("<label for='checkbox" + (i+1) + "'>" + limitDate + "</label>");
                    }
                %>
                </td>
		</tr>
		<tr>
			<th class="w-px160">참조 사이트</th>
			<td><input type="text" name="url" /></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea class="need" name="content">${vo.content }</textarea></td>
		</tr>
		<tr>
			<th>첨부 파일</th>
			<td class="left">
				<label>
					<input id="attach-file" type="file" name="file" />
					<img src="img/select.png" class="file-img" />
				</label>
				<span id="file-name">${vo.filename }</span>
				<span id="delete-file" style="display:${empty vo.filename ? 'none' : 'inline'}; color:red; margin-left:20px;"><i class="fas fa-times font-img"></i></span>
			</td>
		</tr>
	</table>
</form>
<div class="btnSet">
	<a class="btn-fill" onclick="if( necessary() ) { $('[name=attach]').val($('#file-name').text()); $('form').submit(); }">저장</a>
	<a class="btn-empty" href="detail.qna?id=${vo.id }">취소</a>
</div>

<script type="text/javascript" src="js/need_check.js?v=<%=new java.util.Date().getTime() %>"></script>
<script type="text/javascript" src="js/file_attach.js"></script>
</body>
</html>