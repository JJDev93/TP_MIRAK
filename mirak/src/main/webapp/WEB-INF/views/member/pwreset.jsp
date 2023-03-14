<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/common/client_hd.jsp"></jsp:include>
<!-- 네아로 SDK -->
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2-nopolyfill.js"
	charset="utf-8"></script>

<style>
.hr-sect {
	display: flex;
	flex-basis: 100%;
	align-items: center;
	color: rgba(0, 0, 0, 0.35);
	margin: 8px 0px;
}

.hr-sect::before, .hr-sect::after {
	content: "";
	flex-grow: 1;
	background: rgba(0, 0, 0, 0.35);
	height: 1px;
	font-size: 0px;
	line-height: 0px;
	margin: 0px 16px;
}
</style>
<div class="hero-wrap hero-bread"
	style="background-image: url('${path}/resources/images/bg_1.jpg');">
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="/">Home</a></span> <span>PW
						RESET</span>
				</p>
				<h1 class="mb-0 bread">비밀번호 재설정</h1>
			</div>
		</div>
	</div>
</div>

<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-8 mb-5 text-center">
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link" href="idfind">아이디찾기</a></li>
					<li class="nav-item"><a class="nav-link active" href="pwreset">비밀번호재설정</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-5 ftco-animate">
				<form action="pwcheck_reset()" method="post" class="contact-form">
					<h3 class="mb-4 billing-heading" style="text-align: center;">비밀번호재설정</h3>
					<div class="form-group">
						<label for="ID">아이디</label>
						<input type="text"class="form-control" name="mem_id" placeholder="아이디를 입력해주세요.."required="required">
					</div>
					<div class="form-group">
						<label for="ID">이름</label>
						<input type="text" id="name"class="form-control" name="mem_name" placeholder="이름을 입력해주세요.."required="required">
					</div>
					<div class="form-group">
						<label for="PW">핸드폰번호</label>
						<input type="text"class="form-control" id="phone" name="mem_phone" placeholder="핸드폰번호를 입력해주세요.." required="required">
					</div>
					<div>
						<span id="check"></span> 
						<label style="color: red">${message }</label>
					</div>
					<div class="form-group row">
						<div class="col-md-12 text-center">
							<input type="submit" value="비밀번호 재설정"class="btn btn-primary py-3 px-5 w-50" data-toggle="modal"
								data-target="#exampleModal" />
						</div>
					</div>
					<div class="form-group row">
						<div class="col-md-12 text-right">
							<a href="idfind">아이디 먼저 찾고싶어요....</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<form action="fn_pwreset()" method="post">
		<div class="modal fade" id="exampleModal" tabindex="9999"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">비밀번호를 재설정
							해주세요.</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="pw">비밀번호</label> <input type="password" name="mem_pw"
								class="form-control" id="pw" onchange="check_pw()"
								placeholder="수정할 비밀번호 입력" required="required">
						</div>

						<div class="form-group">
							<label for="pw2">비밀번호 확인</label> <input type="password"
								class="form-control" id="pw2" onchange="check_pw()"
								placeholder="비밀번호 확인" required="required"> <span
								id="check"></span>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary" id="pwreset"
								onclick="fn_pwreset();">재설정하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

</section>
<script src="${path}/resources/js/naverapi.js"></script>
<jsp:include page="/common/client_ft.jsp"></jsp:include>
<script>
function pwcheck_reset() {
	$.ajax({
		if($("#id").val()==""){
			document.getElementById('check').innerHTML='아이디(이메일)를 입력해주세요.';
            document.getElementById('check').;
            return false;
		}else if($("#name").val()==""){
			document.getElementById('check').innerHTML='이름을 입력해주세요.';
			document.getElementById('check').;
			return false;
		}else if($("#phone").val()==""){
			document.getElementById('check').inne
			rHTML='핸드폰번호를 입력해주세요.';
			document.getElementById('check').;
			return false;
		}
	})
}
</script>

