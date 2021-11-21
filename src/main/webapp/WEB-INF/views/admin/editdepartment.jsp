<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<base href="${pageContext.servletContext.contextPath}/">

<div class="page-heading">
	<div class="page-title">
		<div class="row">
			<div class="col-12 col-md-6 order-md-1 order-last">
				<h3>Thêm Mới Phòng Ban</h3>
			</div>
			<div class="col-12 col-md-6 order-md-2 order-first">
				<nav aria-label="breadcrumb"
					class="breadcrumb-header float-start float-lg-end">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
						<li class="breadcrumb-item active" aria-current="page">Chỉnh
							Sửa Phòng Ban</li>
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
	<form:form action="admin/update" modelAttribute="department">
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
</div>