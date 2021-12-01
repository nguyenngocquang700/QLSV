<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

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
					<h1 class="auth-title">Đổi Mật Khẩu</h1>
					<p class="auth-subtitle mb-5">Trước tiên bạn cần đổi mật khẩu</p>
					<c:if test="${error!=null}">
						<i style="color: red; float: left;"> ${error}</i>
					</c:if>
					<form action="reset-password" method="POST">
						<div class="form-group position-relative has-icon-left mb-4">
							<%-- <i style="color: red; float: left;"><form:errors
									path="matkhau"></form:errors></i> <i
								style="color: red; float: left;"><form:errors
									path="tendn"></form:errors></i>  --%>
							<input name="tendn" type="hidden"
								class="form-control form-control-xl" value="${tendn}" /> <input
								name="oldpass" type="text" class="form-control form-control-xl"
								placeholder="Nhập mật khẩu cũ..." />

							<div class="form-control-icon">
								<i class="bi bi-person"></i>
							</div>
						</div>
						<div class="form-group position-relative has-icon-left mb-4">
							<%-- <i style="color: red; float: left;"><form:errors
									path="matkhau"></form:errors></i> <i
								style="color: red; float: left;"><form:errors
									path="tendn"></form:errors></i>  --%>

							<input name="newpass" type="password"
								class="form-control form-control-xl"
								placeholder="Nhập mật khẩu mới..." />

							<div class="form-control-icon">
								<i class="bi bi-person"></i>
							</div>
						</div>
						<div class="form-group position-relative has-icon-left mb-4">
							<input name="retypepass" type="password"
								class="form-control form-control-xl"
								placeholder="Nhập lại mật khẩu mới..." />
							<div class="form-control-icon">
								<i class="bi bi-shield-lock"></i>
							</div>
						</div>
						<div class="form-check form-check-lg d-flex align-items-end">
							<input class="form-check-input me-2" type="checkbox" value=""
								id="flexCheckDefault"> <label
								class="form-check-label text-gray-600" for="flexCheckDefault">
								Giữ đăng nhập </label>
						</div>

						<button class="btn btn-primary btn-block btn-lg shadow-lg mt-5">Đăng
							nhập</button>
					</form>
					<div class="text-center mt-5 text-lg fs-4">
						<p class="text-gray-600">
							Don't have an account? <a href="auth-register.html"
								class="font-bold">Sign up</a>.
						</p>
						<p>
							<a class="font-bold" href="forgotpasswd">Forgot password?</a>.
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