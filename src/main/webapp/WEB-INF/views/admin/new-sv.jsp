<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<base href="${pageContext.servletContext.contextPath}/">

<div class="page-heading">
	<div class="page-title">
		<div class="row">
			<div class="col-12 col-md-6 order-md-1 order-last">
				<h3>Thêm Mới Sinh Viên</h3>
			</div>
			<div class="col-12 col-md-6 order-md-2 order-first">
				<nav aria-label="breadcrumb"
					class="breadcrumb-header float-start float-lg-end">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
						<li class="breadcrumb-item active" aria-current="page">Thêm
							Mới Sinh Viên</li>
					</ol>
				</nav>
			</div>
			<c:if test="${message.equals('Thêm mới Sinh viên thành công !')}">
				<div class="alert alert-success alert-dismissible show fade">
					${message}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>
			<c:if test="${message.equals('Thêm mới Sinh viên thất bại !')}">
				<div class="alert alert-danger alert-dismissible show fade">
					${message}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>
			<c:if
				test="${message.equals('Mã Công Việc đã tồn tại! Vui lòng kiểm tra lại!')}">
				<div class="alert alert-danger alert-dismissible show fade">
					${message}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>
		</div>
	</div>

	<form:form action="admin/new-sv" modelAttribute="sinhvien"
		method="POST">
		<section class="section">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">Thông Tin Sinh Viên</h4>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<h6>Mã Sinh Viên</h6>
								<form:input path="masv" type="text" class="form-control"
									id="basicInput" placeholder="Nhập mã sinh viên..." />
							</div>
							<div class="form-group">
								<h6>Họ và Tên</h6>
								<form:input path="hoten" type="text" class="form-control"
									id="basicInput" placeholder="Nhập họ và tên..." />
							</div>
							<div class="form-group">
								<h6>Địa Chỉ</h6>
								<form:input path="diachi" type="text" class="form-control"
									id="basicInput" placeholder="Nhập địa chỉ..." />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group col-md-12">
								<h6>Ngày Sinh</h6>
								<div id="datepicker" class="input-group date"
									data-date-format="dd-mm-yyyy">
									<form:input path="ngaysinh" class="form-control" type="date"
										value="01/01/1997" /> <span class="input-group-addon"><i
										class="glyphicon glyphicon-calendar"></i></span>
								</div>
							</div>
							<div class="form-group">
								<h6>Mật Khẩu</h6>
								<form:input path="matkhau" type="password" class="form-control"
									id="basicInput" placeholder="Nhập mật khẩu..." />
							</div>
							<%-- <div class="form-group col-md-12">
								<h6>Mã Nhân Viên Quản Lý</h6>
								<form:input path="maNVQL" type="text" class="form-control"
									id="basicInput" placeholder="Mã Nhân Viên Quản Lý" />
							</div> --%>
							<h6>Mã Lớp</h6>
							<form:select path="lop.malop" class="form-select" id="staff_modal">
								<%-- <form:option value="" label="-MANV-" /> --%>
								<form:options items="${listlop}" />
							</form:select>
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