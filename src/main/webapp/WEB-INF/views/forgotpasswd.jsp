<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml"
	xmlns:th="http://www.thymeleaf.org">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<c:url value='/resources/assets/css/bootstrap.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/assets/vendors/bootstrap-icons/bootstrap-icons.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/assets/css/app.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/assets/css/pages/auth.css'/>">
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
</head>

<body>
	<div id="auth">

		<div class="row h-100">
			<div class="col-lg-5 col-12">
				<div id="auth-left">
					<div class="auth-logo">
						<a href="index.html"><img
							src="<c:url value="resources/assets/images/logo/logo1.png"/>"></a>
					</div>
					<c:if test="${success!=null}">
						<div class="alert alert-success alert-dismissible show fade">
							${success}
							<button type="button" class="btn-close" data-bs-dismiss="alert"
								aria-label="Close"></button>
						</div>
					</c:if>
					<h1 class="auth-title">Forgot Password</h1>
					<p class="auth-subtitle mb-5">Nhập vào tên đăng nhập của bạn,
						chúng tôi sẽ gửi cho bạn đường dẫn reset password nếu trùng khớp</p>

					<form action="forgotpasswd" method="POST">
						<div class="form-group position-relative has-icon-left mb-4">
							<input name="tendn" type="text"
								class="form-control form-control-xl"
								placeholder="Nhập tên đăng nhập...">
							<div class="form-control-icon">
								<i class="bi bi-envelope"></i>
							</div>
						</div>
						<div class="g-recaptcha"
							data-sitekey="6LcE_GsdAAAAADVBD-1uuPndrLfiJOMw9GNk0obB"></div>
						<button class="btn btn-primary btn-block btn-lg shadow-lg mt-5">Send</button>
					</form>
					<div class="text-center mt-5 text-lg fs-4">
						<p class='text-gray-600'>
							Remember your account? <a href="login" class="font-bold">Log
								in</a>.
						</p>
					</div>
				</div>
			</div>
			<div class="col-lg-7 d-none d-lg-block">
				<div id="auth-right"></div>
			</div>
		</div>

	</div>
</body>

</html>