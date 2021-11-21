<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<base href="${pageContext.servletContext.contextPath}/">

<div class="page-heading">
	<div class="page-title">
		<div class="row">
			<div class="col-12 col-md-6 order-md-1 order-last">
				<h3>Cập Nhật Thông Tin Nhân Viên</h3>
			</div>
			<div class="col-12 col-md-6 order-md-2 order-first">
				<nav aria-label="breadcrumb"
					class="breadcrumb-header float-start float-lg-end">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
						<li class="breadcrumb-item"><a href="admin/liststaff">Danh Sách Nhân Viên</a></li>
						<li class="breadcrumb-item active" aria-current="page">Cập Nhật Thông Tin Nhân Viên</li>
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
	<form:form action="admin/updatestaff" modelAttribute="staff" method="POST">
		<section class="section">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">Cập nhật Thông Tin Cá Nhân</h4>
				</div>
				<!-- 			<div class="card-body">
				<div class="d-flex flex-column align-items-center text-center">
					<img src="https://bootdey.com/img/Content/avatar/avatar7.png"
						alt="Admin" class="rounded-circle" width="150">
					<div class="mt-3">
						<button class="btn btn-primary" href="editUser">Thêm Ảnh</button>
					</div>
				</div>
			</div>
 -->

				<div class="card-body">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<h6>Họ Và Tên</h6>
								<form:input path="hoTen" type="text" class="form-control"
									id="basicInput" placeholder="Họ Và Tên" />
							</div>

							<%-- 							<div class="form-group">
								<h6>Username</h6>
								<form:input type="text" path="username" class="form-control" id="helpInputTop"/>
							</div> --%>


							<fieldset class="form-group">
								<h6>Giới Tính</h6>
								<form:select path="gioiTinh" class="form-select"
									id="basicSelect">
									<option>Nam</option>
									<option>Nữ</option>
								</form:select>
							</fieldset>

							<div class="form-group">
								<h6>Ngày sinh</h6>
								<div id="datepicker" class="input-group date"
									data-date-format="dd-mm-yyyy">
									<form:input path="ngaySinh" class="form-control" type="date"
										value="01/01/1997" />
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-calendar"></i></span>
								</div>
							</div>

							<div class="form-group">
								<h6>Quê Quán</h6>
								<form:input path="queQuan" type="text" class="form-control"
									id="basicInput" placeholder="Quê Quán" />
							</div>

							<div class="form-group">
								<h6>Trình Độ</h6>
								<form:input path="trinhDo" type="text" class="form-control"
									id="basicInput" placeholder="Trình Độ" />
							</div>

						</div>
						<div class="col-md-6">

							<%-- 							<div class="form-group">
								<h6>Password</h6>
								<form:input path="password" type="password" id="helperText" class="form-control"
									placeholder="Password"/>
							</div> --%>

							<div class="form-group col-md-12">
								<h6>Địa Chỉ</h6>
								<form:input path="diaChi" type="text" class="form-control"
									id="basicInput" placeholder="Địa Chỉ" />
							</div>

							<div class="form-group">
								<h6>Dân Tộc</h6>
								<form:input path="danToc" type="text" class="form-control"
									id="basicInput" placeholder="Dân Tộc" />
							</div>

							<div class="form-group">
								<h6>Số Điện Thoại</h6>
								<form:input path="SDT" type="text" class="form-control"
									id="basicInput" placeholder="Số Điện Thoại" />
							</div>

							<div class="form-group">
								<h6>Chuyên Ngành</h6>
								<form:input path="chuyenNganh" type="text" class="form-control"
									id="basicInput" placeholder="Chuyên Ngành" />
							</div>
							<fieldset class="form-group">
								<h6>Mã Phòng Ban</h6>
								<form:select path="gioiTinh" class="form-select"
									id="basicSelect">
									<c:forEach var="s" items="${departmentCode}">
										<option>${d.maPB}</option>
									</c:forEach>
								</form:select>
							</fieldset>
							<div class="form-group">
								<h6>Mã Công Việc</h6>
								<form:input path="chuyenNganh" type="text" class="form-control"
									id="basicInput" placeholder="Chuyên Ngành" />
							</div>
						</div>
					</div>

				</div>

			</div>

		</section>

		<%-- <section class="section">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">Thông Tin Hợp Đồng</h4>
				</div>

				<div class="card-body">
					<div class="row">
						<div class="col-md-12">
							<fieldset class="form-group">
								<h6>Loại Hợp Đồng</h6>
								<form:select path="TenHD" class="form-select" id="basicSelect">
									<option>Chính Thức</option>
									<option>Thử Việc</option>
									<option>Thực Tập</option>
									<option>Nghỉ Việc</option>
								</form:select>
							</fieldset>

						</div>
						<div class="col-md-6">

							<div class="form-group">
								<h6>Ngày Bắt Đầu</h6>
								<div id="datepicker" class="input-group date"
									data-date-format="dd-mm-yyyy">
									<form:input path="NgayBD" class="form-control" type="date" value="01/01/1997"/>
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-calendar"></i></span>
								</div>
							</div>

						</div>
						<div class="col-md-6">
							<div class="form-group">
								<h6>Ngày Kết Thúc</h6>
								<div id="datepicker" class="input-group date"
									data-date-format="dd-mm-yyyy">
									<form:input path="NgayKT" class="form-control" type="date" value="01/01/1997"/>
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-calendar"></i></span>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div> --%>
		<div class="col-sm-12 d-flex justify-content-end">
			<button type="submit" class="btn btn-primary me-1 mb-1">Hoàn
				Thành</button>
			<button type="reset" class="btn btn-light-secondary me-1 mb-1">Reset</button>
		</div>
		<!-- </section> -->
	</form:form>
</div>