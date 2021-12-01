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
						<li class="breadcrumb-item active" aria-current="page">Thêm
							Mới Học Phần</li>
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
			<c:if test="${error!=null}">
				<div class="alert alert-danger alert-dismissible show fade">
					${error}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>
		</div>
	</div>
	<form action="admin/new-hocphan" method="POST">
		<section class="section">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">Thông Tin Học Phần</h4>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<h6>Mã Học Phần</h6>
								<input name="mahp" type="text" class="form-control"
									id="basicInput" placeholder="Nhập mã học phần..." />
							</div>
							<div class="form-group">
								<h6>Tên học phần</h6>
								<input name="tenhp" type="text" class="form-control"
									id="basicInput" placeholder="Nhập tên học phần..." />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group col-md-12">
								<h6>Số Tín Chỉ</h6>
								<input name="sotc" type="text" class="form-control"
									id="basicInput" placeholder="Nhập số tín chỉ.." />
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