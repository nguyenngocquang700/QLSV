<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<%-- <base href="${pageContext.servletContext.contextPath}/">
 --%>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<style type="text/css">
a.delete {
	color: #F44336;
}
</style>
<div class="page-heading">
	<div class="page-title">
		<div class="row">
			<div class="col-12 col-md-6 order-md-1 order-last">
				<h3>Danh sách Nhân viên</h3>
			</div>
			<div class="col-12 col-md-6 order-md-2 order-first">
				<nav aria-label="breadcrumb"
					class="breadcrumb-header float-start float-lg-end">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
						<li class="breadcrumb-item active" aria-current="page">Danh
							sách Nhân viên</li>
					</ol>
				</nav>
			</div>
			<c:if test="${message.equals('Xoá Nhân Viên thành công!')}">
				<div class="alert alert-success alert-dismissible show fade">
					${message}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>
			<c:if test="${message.equals('Xoá Nhân Viên thất bại! Nhân viên đang quản lý lớp học!')}">
				<div class="alert alert-danger alert-dismissible show fade">
					${message}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>
			<c:if test="${message.equals('Chỉnh sửa Nhân Viên thành công!')}">
				<div class="alert alert-success alert-dismissible show fade">
					${message}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>
			<c:if test="${message.equals('Chỉnh sửa Nhân Viên thất bại!')}">
				<div class="alert alert-danger alert-dismissible show fade">
					${message}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>
		</div>
	</div>
	<%-- <img src="<c:url value="/resources/assets/images/bg/1.jpg"/>"></a> --%>
	<section class="section">
		<div class="card">
			<div class="card-header">Danh sách Nhân viên</div>
			<div class="card-body">
				<table class="table table-striped" id="table1">
					<thead>
						<tr>
							<th>Mã Nhân Viên</th>
							<th>Họ Và Tên</th>
							<th>Email</th>
							<th>Lương</th>
							<th>Tên Đăng Nhập</th>
							<th>Mật Khẩu</th>
							<th>PubKey</th>
							<th>Thiết lập</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="s" items="${nhanvien}">
							<tr>
								<td class="manv">${s.manv}</td>
								<td class="hoten">${s.hoten}</td>
								<td class="email">${s.email}</td>
								<td class="luong">${s.luong}</td>
								<td class="tendn">${s.tendn}</td>
								<td class="matkhau">${s.matkhau}</td>
								<td class="pubkey">${s.pubkey}</td>
								<td><a class="settings edit-btn" title="Settings"
									type="button" href="javascript:" data-bs-toggle="modal"
									data-bs-target="#NhanVienModal"><i class="material-icons">&#xe88e;</i>
								</a><a href="javascript:" class="delete delete-btn" title="Delete"
									data-bs-toggle="modal" data-bs-target="#DeleteModal"><i
										class="material-icons">&#xE5C9;</i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="btn-group mb-3 flex-box" role="group"
					aria-label="Basic example">
					<button type="button" onclick="pdfExport()"
						class="btn btn-danger pdf-btn">PDF</button>
					<button type="button" onclick="xlsExport()"
						class="btn btn-success xls-btn">Excel</button>
				</div>
			</div>
		</div>

	</section>
</div>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="<c:url value='/resources/tableExport/libs/FileSaver/FileSaver.min.js'/>"></script>
<script
	src="<c:url value='/resources/tableExport/libs/js-xlsx/xlsx.core.min.js'/>"></script>
<script
	src="<c:url value='/resources/tableExport/libs/pdfmake/pdfmake.min.js'/>"></script>
<script
	src="<c:url value='/resources/tableExport/libs/pdfmake/vfs_fonts.js'/>"></script>
<script src="<c:url value='/resources/tableExport/tableExport.min.js'/>"></script>

<script type="text/javascript">
	function xlsExport() {
		$('#table1').tableExport({
			type : 'excel'
		});
	}

	function pdfExport() {
		$('#table1').tableExport({
			type : 'pdf',
			pdfmake : {
				enabled : true,
				docDefinition : {
					pageOrientation : 'landscape'
				}
			}
		});
	}
</script>

<script type="text/javascript">
	$(document).ready(function() {

		$("#table1").on('click', '.edit-btn', function() {

			var currentRow = $(this).closest("tr");

			var manv = currentRow.find("td:eq(0)").text();
			var hoten = currentRow.find("td:eq(1)").text();
			var email = currentRow.find("td:eq(2)").text();
			var luong = currentRow.find("td:eq(3)").text();
			var tendn = currentRow.find("td:eq(4)").text();
			var matkhau = currentRow.find("td:eq(5)").text();
			var pubkey = currentRow.find("td:eq(6)").text();

			// GETTING DATA TO SHOW ON MODEL
			$('#manv_modal').val(manv);
			$('#hoten_modal').val(hoten);
			$('#email_modal').val(email);
			$('#luong_modal').val(luong);
			$('#tendn_modal').val(tendn);
			$('#matkhau_modal').val(matkhau);
			$('#pubkey_modal').val(pubkey);
		});
	});
</script>
<div id="DeleteModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- MODEL BODY -->
				<form:form action="admin/del-nhanvien"
					modelAttribute="delete-nhanvien" method="POST">
					<section class="section">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title" id="info2del"></h4>
								<form:input type="hidden" path="manv" id="manv" />
							</div>
						</div>
					</section>
					<div class="col-sm-12 d-flex justify-content-end">
						<button type="submit" class="btn btn-primary me-1 mb-1">Hoàn
							Thành</button>
						<button type="button" data-bs-dismiss="modal"
							class="btn btn-light-secondary me-1 mb-1">Close</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
<div id="NhanVienModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- MODEL BODY -->
			<form action="admin/update-nhanvien" method="POST">
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
											id="manv_modal" placeholder="Mã nhân viên" readonly="true" />
									</div>
									<div class="form-group">
										<h6>Họ và Tên</h6>
										<input name="hoten" type="text" class="form-control"
											id="hoten_modal" placeholder="Nhập họ và tên..." />
									</div>
									<div class="form-group">
										<h6>Email</h6>
										<input name="email" type="text" class="form-control"
											id="email_modal" placeholder="Nhập email..." />
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<h6>Lương</h6>
										<input name="luong" type="text" class="form-control"
											id="luong_modal" placeholder="Nhập lương..." />
									</div>
									<div class="form-group">
										<h6>Tên Đăng Nhập</h6>
										<input name="tendn" type="text" class="form-control"
											id="tendn_modal" placeholder="Nhập tên đăng nhập..." />
									</div>
									<div class="form-group">
										<h6>Mật Khẩu</h6>
										<input name="matkhau" type="password" class="form-control"
											id="matkhau_modal" placeholder="Nhập password..." />
									</div>
									<div class="form-group">

										<input name="pubkey" type="hidden" class="form-control"
											id="pubkey_modal" />
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
	</div>
</div>


