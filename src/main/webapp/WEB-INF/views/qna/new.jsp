<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna new jsp</title>
</head>
<body>
<h3>신규 QNA</h3>

<!-- 
파일 첨부 시 form 태그의  필요 속성
1. 반드시 method가 post
2. enctype을 지정 ▶ enctype='multipart/form-data'
 -->
<form action="insert.qna" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<th class="w-px160">제목</th>
			<td><input type="text" name="title" class="need" /></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${login_info.name }</td>
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
			<th class="w-px160">내용</th>
			<td><textarea name="content" class="need"></textarea></td>
		</tr>
		<tr>
			<th>파일 첨부</th>
			<td class="left">
				<label>
					<input type="file" name="file" id="attach-file" />
					<img src="img/select.png" class="file-img" />
				</label>
				<span id="file-name"></span>
				<span id="delete-file" style="color: red; margin-lefT: 20px;"><i class="fas fa-times font-img" ></i></span>
 			</td>
		</tr>
	</table>
</form>
<div class="btnSet">
	<a class="btn-fill" onclick="if(necessary()) $('form').submit()">저장</a>
	<a class="btn-empty" href="list.qna">취소</a>
</div>

<script type="text/javascript" src="js/need_check.js?v=<%=new java.util.Date().getTime() %>"></script>
<script type="text/javascript" src="js/file_attach.js"></script>
</body>
</html>