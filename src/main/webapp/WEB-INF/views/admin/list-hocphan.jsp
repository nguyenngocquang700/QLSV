<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style type="text/css">
a.delete {
	color: #F44336; . cmn-toggle { position : absolute;
	margin-left: -9999px;
	visibility: hidden;
}

.cmn-toggle+label {
	display: block;
	position: relative;
	cursor: pointer;
	outline: none;
	user-select: none;
}

input.cmn-toggle-round+label {
	padding: 2px;
	width: 120px;
	height: 60px;
	background-color: #dddddd;
	border-radius: 60px;
}

input.cmn-toggle-round+label:before, input.cmn-toggle-round+label:after
	{
	display: block;
	position: absolute;
	top: 1px;
	left: 1px;
	bottom: 1px;
	content: "";
}

input.cmn-toggle-round+label:before {
	right: 1px;
	background-color: #f1f1f1;
	border-radius: 60px;
	transition: background 0.4s;
}

input.cmn-toggle-round+label:after {
	width: 58px;
	background-color: #fff;
	border-radius: 100%;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
	transition: margin 0.4s;
}

input.cmn-toggle-round:checked+label:before {
	background-color: #8ce196;
}

input.cmn-toggle-round:checked+label:after {
	margin-left: 60px;
}
}
</style>
<div class="page-heading">
	<div class="page-title">
		<div class="row">
			<div class="col-12 col-md-6 order-md-1 order-last">
				<h3>Danh Sách Học Phần</h3>
			</div>
			<div class="col-12 col-md-6 order-md-2 order-first">
				<nav aria-label="breadcrumb"
					class="breadcrumb-header float-start float-lg-end">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
						<li class="breadcrumb-item active" aria-current="page">Danh
							Sách Học Phần</li>
					</ol>
				</nav>
			</div>
			<%-- 			<c:if test="${message != null}">
				<div class="alert alert-danger alert-dismissible show fade">
					${message}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if> --%>
			<c:if test="${message.equals('Chỉnh sửa thông tin Học phần thành công!')}">
				<div class="alert alert-success alert-dismissible show fade">
					${message}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>
			<c:if test="${message.equals('Chỉnh sửa thất bại, kiểm tra lại thông tin Học phần!')}">
				<div class="alert alert-danger alert-dismissible show fade">
					${message}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>
			<%-- <c:if test="${message.equals('Không thể khoá tài khoản Administrator')}">
				<div class="alert alert-danger alert-dismissible show fade">
					${message}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if> --%>
		</div>
	</div>

	<section class="section">
		<div class="card">
			<div class="card-header">Danh Sách Học Phần</div>
			<div class="card-body">
				<table class="table table-striped" id="table1">
					<thead>
						<tr>
							<th>Mã Học Phần</th>
							<th>Tên Học Phần</th>
							<th>Số Tín Chỉ</th>
							<!-- <th style="display: none;">Password</th> -->
							<th>Thiết lập</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="u" items="${hocphan}">
							<tr>
								<td class="mahp">${u.mahp}</td>
								<td class="tenhp">${u.tenhp}</td>
								<%-- <td class="passwd" style="display: none;">${u.password}</td> --%>
								<td class="sotc">${u.sotc}</td>
								<%-- <td class="role">${u.role.role}</td>
								<td class="status"><c:if
										test="${u.status.equals('Active')}">
										<div class="badges">
											<span class="badge bg-light-success">ACTIVE</span>
										</div>
									</c:if> <c:if test="${u.status != 'Active'}">
										<div class="badges">
											<span class="badge bg-light-danger">INACTIVE</span>
										</div>
									</c:if></td> --%>
								<td><a class="settings edit-btn" title="Settings"
									type="button" href="javascript:" data-bs-toggle="modal"
									data-bs-target="#EmployeeModal"><i class="material-icons">&#xe88e;</i>
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

	</section>
</div>
<script type="text/javascript">
	$(document).ready(function() {

		$("#table1").on('click', '.edit-btn', function() {

			var currentRow = $(this).closest("tr");

			var id_user = currentRow.find("td:eq(0)").text();
			var uname = currentRow.find("td:eq(1)").text();
			var passwd = currentRow.find("td:eq(2)").text();
			var staffcode = currentRow.find("td:eq(3)").text();
			var role = currentRow.find("td:eq(4)").text();
			var status = currentRow.find("td:eq(5)").text();

			// GETTING DATA TO SHOW ON MODEL
			$('#id_modal').val(id_user);
			$('#uname_modal').val(uname);
			$('#passwd_modal').val(passwd);
			$('#staffcode_modal').val(staffcode);
			$('#role_modal').val(role);
			$('#status_modal').val(status);
		});
	});
</script>


<div id="EmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- MODEL BODY -->
			<form action="admin/updateuser" method="POST">
				<section class="section">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">Thông Tin Tài Khoản</h4>
						</div>
						<div class="card-body">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<h6>ID Tài Khoản</h6>
										<input name="id" type="text" 
											class="form-control" id="id_modal" placeholder="ID Tài Khoản" readonly="true"/>
									</div>
									<div class="form-group">
										<h6>Tên Tài Khoản</h6>
										<input name="username" type="text" class="form-control"
											id="uname_modal" placeholder="Tên Tài Khoản" />
									</div>
									<div class="form-group">
										<h6>Mật Khẩu</h6>
										<input name="password" type="password"
											class="form-control" id="passwd_modal" placeholder="Mật Khẩu" />
									</div>

								</div>
								<div class="col-md-6">
									<div class="form-group">
										<h6>Mã Nhân Viên</h6>
										<input name="MaNV" type="text" class="form-control"
											 id="staffcode_modal" readonly="true"/>
									</div>
									<fieldset class="form-group">
										<h6>Role</h6>
										<select name="role" class="form-select"
											id="role_modal">
											<option value="0" selected>Nhân Viên</option>
											<option value="1">Admin</option>
										</select>
									</fieldset>
									<fieldset class="form-group">
										<h6>Trạng Thái</h6>
										<select name="status" class="form-select"
											id="status_modal">
											<option value="Active" selected>Active</option>
											<option value="Inactive">Inactive</option>
										</select>
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
			</form>
		</div>
	</div>
</div>

