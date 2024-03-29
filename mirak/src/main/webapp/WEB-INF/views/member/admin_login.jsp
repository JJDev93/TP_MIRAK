<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MiRak Admin</title>
<link rel="icon" href="${path}/resources/images/favicon.gif">
<link rel="stylesheet" href="${path}/resources/css/style.css">
</head>
<style>
html, body {
	height: 100%;
}

body {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-align: center;
	align-items: center;
	padding-top: 40px;
	padding-bottom: 40px;
}

.form-signin {
	width: 100%;
	max-width: 450px;
	padding: 15px;
	margin: auto;
}

.form-signin .checkbox {
	font-weight: 400;
}

.form-signin .form-control {
	position: relative;
	box-sizing: border-box;
	height: auto;
	padding: 10px;
	font-size: 16px;
}

.form-signin .form-control:focus {
	z-index: 2;
}

.form-signin input[type="email"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

.MIRAK{
	font-size: 40px;
	font-weight: bold;	
	margin:0;
    line-height: 1;
}
.mb-self{ margin-bottom:15px !important; }
</style>
<body class="text-center">
	<form class="form-signin" action="/admin" method="post">
		<h1 class="h3 font-weight-normal MIRAK">MIRAK 관리자</h1>
		
		<label for="ID" class="sr-only">어드민 아이디를 입력하세요</label> 
		<input type="text" id="ID" name="mem_id" class="form-control mt-5 mb-self" placeholder="아이디를 입력하세요" required autofocus> 
		
		<label for="PW" class="sr-only">어드민 비밀번호를 입력하세요</label> 
		<input type="password" id="PW" name="mem_pw" class="form-control mb-self" placeholder="비밀번호를 입력하세요" required>
		
		<button class="btn btn-lg btn-primary btn-block mb-self" type="submit">로그인</button>
		<a href="/" class="btn btn-lg btn-secondary btn-block">Client</a>
		
		<p class="mt-5 mb-3 text-muted">
	         &copy Copyright MIRAK .2023<br>
             신용우 전지혜 김연주 김원중 서현진 안창주 정동하
      	</p>
	</form>
	<c:if test="${not empty result}">
		<script>
		alert("${result}");
		</script>
	</c:if>
	<script src="${path}/resources/js/bootstrap.min.js"></script>
</body>
</html>