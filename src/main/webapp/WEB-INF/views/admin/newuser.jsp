<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<base href="${pageContext.servletContext.contextPath}/">

<div class="page-heading">
	<div class="page-title">
		<div class="row">
			<div class="col-12 col-md-6 order-md-1 order-last">
				<h3>Thêm Mới Tài Khoản</h3>
			</div>
			<div class="col-12 col-md-6 order-md-2 order-first">
				<nav aria-label="breadcrumb"
					class="breadcrumb-header float-start float-lg-end">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
						<li class="breadcrumb-item active" aria-current="page">Thêm
							Mới Tài Khoản</li>
					</ol>
				</nav>
			</div>
			<c:if test="${message.equals('Thêm mới thành công !')}">
				<div class="alert alert-success alert-dismissible show fade">
					${message}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>
			<c:if test="${message.equals('Thêm mới thất bại !')}">
				<div class="alert alert-danger alert-dismissible show fade">
					${message}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>
		</div>
	</div>
	<form:form action="admin/newuser" modelAttribute="user" method="POST">
		<section class="section">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">Thông Tin Tài Khoản</h4>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-md-6">
							<fieldset class="form-group">
								<h6>Mã Nhân Viên</h6>
								<form:select path="staff.MaNV" class="form-select"
									id="role_modal">
									<%-- <form:option value="" label="-MANV-" /> --%>
									<form:options items="${listStaff}" />
								</form:select>
							</fieldset>
							<div class="form-group">
								<h6>Username</h6>
								<form:input path="username" type="text" class="form-control"
									id="basicInput" placeholder="Tên Tài Khoản" />
							</div>
							<div class="form-group">
								<h6>Password</h6>
								<form:input path="password" type="password" class="form-control"
									id="basicInput" placeholder="Mật Khẩu" />
							</div>
						</div>
						<div class="col-md-6">
							<fieldset class="form-group">
								<h6>Role</h6>
								<form:select path="role.role" class="form-select"
									items="${listRole}">
								</form:select>
							</fieldset>
							<fieldset class="form-group">
								<h6>Trạng Thái</h6>
								<form:select path="status" class="form-select" type="hidden"
									typeclass="form-select" id="status_modal">
									<%-- <form:option value="" label="-Trạng thái-" /> --%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</form:select>
							</fieldset>
						</div>
					</div>
				</div>
			</div>
		</section>
		<div class="col-sm-12 d-flex justify-content-end">
			<button type="submit" class="btn btn-primary me-1 mb-1">Hoàn
				Thành</button>
			<button type="reset" class="btn btn-light-secondary me-1 mb-1">Reset</button>
		</div>
	</form:form>
</div>