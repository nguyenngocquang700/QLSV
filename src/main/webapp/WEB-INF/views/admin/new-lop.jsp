<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<base href="${pageContext.servletContext.contextPath}/">

<div class="page-heading">
	<div class="page-title">
		<div class="row">
			<div class="col-12 col-md-6 order-md-1 order-last">
				<h3>Thêm Mới Lớp Học</h3>
			</div>
			<div class="col-12 col-md-6 order-md-2 order-first">
				<nav aria-label="breadcrumb"
					class="breadcrumb-header float-start float-lg-end">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.html">Dashboard</a>
						</li>
						<li class="breadcrumb-item active" aria-current="page">Thông
							Tin Lớp Học</li>
					</ol>
				</nav>
			</div>
			<c:if test="${success!=null}">
				<div class="alert alert-success alert-dismissible show fade">
					${success}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>
			<c:if
				test="${error!=null}">
				<div class="alert alert-danger alert-dismissible show fade">
					${error}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>
		</div>
	</div>
	<form:form action="admin/new-lop" modelAttribute="lop" method="POST">
		<section class="section">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">Thông Tin Lớp Học</h4>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<h6>Mã Lớp</h6>
								<form:input path="malop" type="text" class="form-control"
									id="basicInput" placeholder="Nhập mã lớp..." />
							</div>
							<div class="form-group">
								<div class="form-group">
									<h6>Tên Lớp</h6>
									<form:input path="tenlop" type="text" class="form-control"
										placeholder="Nhập tên lớp..." />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<h6>Mã Nhân Viên</h6>
								<form:select path="nhanvien.manv" class="form-select"
									items="${listNV}">
								</form:select>
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


	<%-- <form action="admin/new-lop" method="POST">
		<section class="section">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">Thông Tin Lớp Học</h4>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<h6>Mã NV</h6>
								<input name="MaNV" type="text" class="form-control"
									placeholder="Mã NV" />
								<c:forEach var="s" items="${listStaff}">
										<option value="${s.MaNV}">${s.MaNV}</option>
									</c:forEach>
							</div>
							<div class="form-group">
								<h6>Thời Gian</h6>
								<div id="datepicker" class="input-group date"
									data-date-format="dd-mm-yyyy">
									<input name="thoiGian" class="form-control" type="date"
										value="01/01/1997" /> <span class="input-group-addon">
										<i class="glyphicon glyphicon-calendar"></i>
									</span>
								</div>
							</div>
							<div class="form-group">
								<div class="form-group">
									<h6>Lương CB</h6>
									<input name="luongCB" type="text" class="form-control"
										placeholder="Lương CB" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<h6>Phụ Cấp</h6>
								<input name="phuCap" type="text" class="form-control"
									placeholder="Phụ Cấp" />
							</div>
							<div class="form-group">
								<h6>BHXH</h6>
								<input name="bhxh" type="text" class="form-control"
									placeholder="BHXH" />
							</div>
							<div class="form-group">
								<h6>Tạm Ứng</h6>
								<input name="tamUng" type="text" class="form-control"
									placeholder="Tạm Ứng" />
							</div>
							<div class="form-group">
								<h6>Trừ Khác</h6>
								<input name="truKhac" type="text" class="form-control"
									placeholder="Trừ Khác" />
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
	</form> --%>

	<!-- <form action="admin/newsalary" method="POST">
		<section class="section"> 
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">Thêm Lương Tháng</h4>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<h6>Mã NV</h6>
								<input name="MaNV" type="text" class="form-control"
									placeholder="Mã NV" />
							</div>
							<div class="form-group">
								<h6>Thời Gian</h6>
								<div id="datepicker" class="input-group date"
									data-date-format="dd-mm-yyyy">
									<input name="thoiGian" class="form-control" type="date"
										value="01/01/1997" /> <span class="input-group-addon">
										<i class="glyphicon glyphicon-calendar"></i>
									</span>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<h6>Phụ Cấp</h6>
								<input name="phuCap" type="text" class="form-control"
									placeholder="Phụ Cấp" />
							</div>
							<div class="form-group">
								<h6>BHXH</h6>
								<input name="bhxh" type="text" class="form-control"
									placeholder="BHXH" />
							</div>
							<div class="form-group">
								<h6>Tạm Ứng</h6>
								<input name="tamUng" type="text" class="form-control"
									placeholder="Tạm Ứng" />
							</div>
							<div class="form-group">
								<h6>Trừ Khác</h6>
								<input name="truKhac" type="text" class="form-control"
									placeholder="Trừ Khác" />
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
	</form> -->
</div>