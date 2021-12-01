<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
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
				<h3>Danh Sách Lớp Học</h3>
			</div>
			<div class="col-12 col-md-6 order-md-2 order-first">
				<nav aria-label="breadcrumb"
					class="breadcrumb-header float-start float-lg-end">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
						<li class="breadcrumb-item active" aria-current="page">Danh
							Sách Lớp Học</li>
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

	<section class="section">
		<div class="card">
			<div class="card-header">Danh Sách Lớp Học</div>
			<div class="card-body">
				<table class="table table-striped" id="table1">
					<thead>
						<tr>
							<th>Mã Lớp</th>
							<th>Tên Lớp</th>
							<th>Mã Nhân Viên Quản Lý</th>
							<th>Thiết Lập</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="d" items="${lop}">
							<tr>
								<td class="ma-lop"><c:out value="${d.malop}"/></td>
								<td class="ten-lop"><c:out value="${d.tenlop}"/></td>
								<td class="ma-nv"><c:out value="${d.nhanvien.manv}"/></td>
								<td><a class="settings edit-btn" title="Settings"
									type="button" href="javascript:" data-bs-toggle="modal"
									data-bs-target="#LopModal"><i class="material-icons">&#xe88e;</i>
								</a> <a href="javascript:" class="delete delete-btn" title="Delete"
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
	<script
		src="<c:url value='/resources/tableExport/tableExport.min.js'/>"></script>

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
				var malop = currentRow.find("td:eq(0)").text();
				var tenlop = currentRow.find("td:eq(1)").text();
				var manv = currentRow.find("td:eq(2)").text();

				console.log(malop)
				// GETTING DATA TO SHOW ON MODEL
				$('#malop_modal').val(malop);
				$('#tenlop_modal').val(tenlop);
				$('#manv_modal').val(manv);
			});
		});
		$('#table1').on('click', '.delete-btn', function() {
			let id = $(this).parents("tr").find(".ma-lop").text();
			let ten = $(this).parents("tr").find(".ten-lop").text();
			console.log(ten);
			$('#info2del').text('Bạn có chắc chắn muốn xoá ' + ten + '?')
			$('#info2del').parent().find('#ma-lop').val(id)
		})

		console.log($('#DeleteModal'))
	</script>
	<div id="DeleteModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- MODEL BODY -->
				<form action="admin/delete-lop" method="POST">
					<section class="section">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title" id="info2del"></h4>
								<input type="hidden" name="malop" id="ma-lop" />
							</div>
						</div>
					</section>
					<div class="col-sm-12 d-flex justify-content-end">
						<button type="submit" class="btn btn-primary me-1 mb-1">Hoàn
							Thành</button>
						<button type="button" data-bs-dismiss="modal"
							class="btn btn-light-secondary me-1 mb-1">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div id="LopModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- MODEL BODY -->
				<form:form action="admin/update-lop" modelAttribute="update-lop"
					method="POST">
					<section class="section">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">Chỉnh Sửa Thông Tin Lớp Học</h4>
							</div>
							<div class="card-body">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<h6>Mã Lớp</h6>
											<form:input path="malop" type="text" class="form-control"
												id="malop_modal" readonly="true"
												placeholder="Nhập mã lớp..." />
										</div>
										<div class="form-group">
											<h6>Tên Lớp</h6>
											<form:input path="tenlop" type="text" class="form-control"
												id="tenlop_modal" placeholder="Nhập tên lớp..." />
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<h6>Mã Nhân Viên Quản Lý</h6>
											<form:select path="nhanvien.manv" class="form-select"
												items="${listNV}" id="manv_modal">
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
			</div>
		</div>
	</div>
</div>