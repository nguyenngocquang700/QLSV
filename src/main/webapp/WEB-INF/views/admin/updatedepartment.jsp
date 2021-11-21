<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<base href="${pageContext.servletContext.contextPath}/">
<link rel="stylesheet"
	href="<c:url value='/resources/assets/vendors/dripicons/webfont.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/assets/css/pages/dripicons.css'/>">
<div class="page-heading">
	<div class="page-title">
		<div class="row">
			<div class="col-12 col-md-6 order-md-1 order-last">
				<h3>Cập Nhật Phòng Ban</h3>
			</div>
			<div class="col-12 col-md-6 order-md-2 order-first">
				<nav aria-label="breadcrumb"
					class="breadcrumb-header float-start float-lg-end">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="admin">Dashboard</a></li>
						<li class="breadcrumb-item"><a href="admin/listdepartment">Danh
								sách Phòng Ban</a></li>
						<li class="breadcrumb-item active" aria-current="page">Cập
							Nhật Phòng Ban</li>
					</ol>
				</nav>
			</div>
			<c:if test="${message != null}">
				<div class="alert alert-danger alert-dismissible show fade">
					${message}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>
		</div>
	</div>
	<form:form action="admin/updatedepartment" modelAttribute="department"
		method="POST">
		<section class="section">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">Thông Tin Phòng Ban</h4>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<h6>Tên Phòng Ban</h6>
								<form:input path="tenPB" type="text" class="form-control"
									id="basicInput" placeholder="Tên Phòng Ban" />
							</div>
							<div class="form-group">
								<h6>Mã Phòng Ban</h6>
								<form:input path="maPB" type="text" class="form-control"
									id="basicInput" placeholder="Mã Phòng Ban" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group col-md-12">
								<h6>Số Điện Thoại</h6>
								<form:input path="sdt" type="text" class="form-control"
									id="basicInput" placeholder="Số Điện Thoại" />
							</div>
							<div class="form-group col-md-12">
								<h6>Mã Nhân Viên Quản Lý</h6>
								<form:input path="maNVQL" type="text" class="form-control"
									id="basicInput" placeholder="Mã Nhân Viên Quản Lý" />
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
	</form:form>
	<section class="section">
		<div class="card">
			<div class="card-header">
				<h4 class="card-title">Danh sách nhân viên Phòng Ban</h4>

				<div class="col-sm-12 d-flex justify-content-end">

					<button type="button" id="basic"
						class="btn btn-outline-primary me-1 mb-1" data-toggle="modal"
						data-target=".bd-example-modal-lg">Thêm Nhân Viên</button>
				</div>
			</div>
			<div class="card-body">
				<table class="table table-striped" id="table1">
					<thead>
						<tr>
							<th>Họ Và Tên</th>
							<th>SĐT</th>
							<th>Chức Vụ</th>
							<th>Thiết lập</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="s" items="${staff}">
							<tr>
								<td>${s.hoTen}</td>
								<td>${s.SDT}</td>
								<td>${s.chuyenNganh}</td>
								<td><section id="basic-dropdown">
										<div class="row">
											<div class="btn-group mb-1">
												<div class="dropdown">
													<button type="button"
														class="btn btn-primary btn-sm dropdown-toggle"
														data-bs-toggle="dropdown" aria-haspopup="true"
														aria-expanded="false">Small</button>
													<div class="dropdown-menu">
														<a class="dropdown-item" href="#">Option 1</a> <a
															class="dropdown-item" href="#">Option 2</a> <a
															class="dropdown-item" href="#">Option 3</a>
													</div>
												</div>
											</div>
										</div>
									</section></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</section>

</div>
<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"
	aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<section class="section">
				<div class="card">
					<div class="card-header">Danh sách nhân viên công ty</div>
					<div class="card-body">
						<table class="table table-striped" id="table1">
							<thead>
								<tr>
									<th>Họ Và Tên</th>
									<th>Chuyên Ngành</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="sa" items="${staffAll}">
									<tr>

										<td>${sa.hoTen}</td>
										<td>${sa.chuyenNganh}</td>
										<td><button class="btn" href="admin/addstaff/${sa.maNV}">
												<i class="icon dripicons-plus"></i>
											</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

			</section>
		</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script> --%>