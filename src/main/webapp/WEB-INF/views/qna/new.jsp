<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna new jsp</title>
</head>
<body>
<fmt:setLocale value="${sessionScope.language}" />
<fmt:bundle basename="bundle.message">
<h3><fmt:message key="projectInquiries" /></h3>

<!-- 
파일 첨부 시 form 태그의  필요 속성
1. 반드시 method가 post
2. enctype을 지정 ▶ enctype='multipart/form-data'
 -->
<form action="insert.qna" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<th class="w-px160"><fmt:message key="title" /></th>
			<td><input type="text" name="title" class="need" /></td>
		</tr>
		<tr>
			<th><fmt:message key="writer" /></th>
			<td>${login_info.name }</td>
		</tr>
		<tr>
			<th><fmt:message key="categoryProjects" /></th>
				<td>
                <%
		            String[] options = {"レスポンシブウェブサイト制作", "PCとモバイルウェブサイト制作", "ショッピングモール制作", "広告ページ制作", "その他"};
		            for (int i = 0; i < options.length; i++) {
		                String sortation = options[i];
		                out.println("<input type='checkbox' class='need' id='checkbox" + (i+1) + "' name='sortation' value='" + sortation + "' title='オプション'>");
		                out.println("<label for='checkbox" + (i+1) + "'>" + sortation + "</label>");
		            }
		        %>
				</td>
		</tr>
			<th>상담방법</th>
				<td>
					<select name="method" id="method">
		            <option value="電話"><fmt:message key="phone" /></option>
		            <option value="メール"><fmt:message key="email" /></option>
		            <option value="訪問相談"><fmt:message key="visitConsultation" /></option>
        			</select>
				</td>
		</tr>
		<tr>
			<th><fmt:message key="companyName" /></th>
			<td><input type="text" name="cname" /></td>
		</tr>
		<tr>
			<th><fmt:message key="projectBudget" /></th>
				<td>
		        <%
		            String[] options2 = {"100~500", "500~1000", "1000以上"};
		            for (int i = 0; i < options2.length; i++) {
		                String budget = options2[i];
		                out.println("<input type='radio' class='need' id='radioBudget" + (i+1) + "' name='budget' value='" + budget + "' title='予算'>");
		                out.println("<label for='radioBudget" + (i+1) + "'>" + budget + "</label>");
		            }
		        %>
		    	</td>
		</tr>
		<tr>
			<th><fmt:message key="projectDueDate" /></th>
				<td>
		        <%
		            String[] options3 = {"1~3か月以内", "3~6か月以内", "6か月以上"};
		            for (int i = 0; i < options3.length; i++) {
		                String limitDate = options3[i];
		                out.println("<input type='radio' class='need' id='radio" + (i+1) + "' name='limitDate' value='" + limitDate + "' title='期限'>");
		                out.println("<label for='radio" + (i+1) + "'>" + limitDate + "</label>");
		            }
		        %>
		    	</td>
		</tr>
		<tr>
			<th class="w-px160"><fmt:message key="referenceSites" /></th>
			<td><input type="text" name="url" /></td>
		</tr>
		<tr>
			<th class="w-px160"><fmt:message key="content" /></th>
			<td><textarea name="content" class="need"></textarea></td>
		</tr>
		<tr>
			<th><fmt:message key="attachments" /></th>
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
	<a class="btn-fill" onclick="if(necessary()) $('form').submit()"><fmt:message key="save" /></a>
	<a class="btn-empty" href="list.qna"><fmt:message key="cancel" /></a>
</div>

<script type="text/javascript" src="js/need_check.js?v=<%=new java.util.Date().getTime() %>"></script>
<script type="text/javascript" src="js/file_attach.js"></script>
</fmt:bundle>
</body>
</html>