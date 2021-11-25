<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<base href="${pageContext.servletContext.contextPath}/">

<div class="page-heading">
	<div class="page-title">
		<div class="row">
			<div class="col-12 col-md-6 order-md-1 order-last">
				<h3>Thêm Mới Nhân Viên</h3>
			</div>
			<div class="col-12 col-md-6 order-md-2 order-first">
				<nav aria-label="breadcrumb"
					class="breadcrumb-header float-start float-lg-end">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
						<li class="breadcrumb-item active" aria-current="page">Thêm
							Mới Nhân Viên</li>
					</ol>
				</nav>
			</div>
			<c:if test="${message.equals('Thêm mới Nhân viên thành công !')}">
				<div class="alert alert-success alert-dismissible show fade">
					${message}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>
			<c:if test="${message.equals('Thêm mới Nhân viên thất bại !')}">
				<div class="alert alert-danger alert-dismissible show fade">
					${message}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>
		</div>
	</div>
	<form action="admin/new-nhanvien" method="POST">
		<section class="section">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">Thông Tin Nhân Viên</h4>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<h6>Mã Nhân Viên</h6>
								<input name="manv" type="text" class="form-control"
									id="basicInput" placeholder="Nhập mã nhân viên..." />
							</div>
							<div class="form-group">
								<h6>Họ và Tên</h6>
								<input name="hoten" type="text" class="form-control"
									id="basicInput" placeholder="Nhập họ và tên..." />
							</div>
							<div class="form-group">
								<h6>Email</h6>
								<input name="email" type="text" class="form-control"
									id="basicInput" placeholder="Nhập email..." />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<h6>Lương</h6>
								<input name="luong" type="text" class="form-control"
									id="basicInput" placeholder="Nhập lương..." />
							</div>
							<div class="form-group">
								<h6>Tên Đăng Nhập</h6>
								<input name="tendn" type="text" class="form-control"
									id="basicInput" placeholder="Nhập tên đăng nhập..." />
							</div>
							<div class="form-group">
								<h6>Mật Khẩu</h6>
								<input name="matkhau" type="password" class="form-control"
									id="basicInput" placeholder="Nhập password..." />
							</div>
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
		</form>
</div>