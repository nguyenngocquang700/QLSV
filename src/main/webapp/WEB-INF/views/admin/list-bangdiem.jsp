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
				<h3>Bảng điểm Sinh viên</h3>
			</div>
			<div class="col-12 col-md-6 order-md-2 order-first">
				<nav aria-label="breadcrumb"
					class="breadcrumb-header float-start float-lg-end">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
						<li class="breadcrumb-item active" aria-current="page">Bảng điểm Sinh viên</li>
					</ol>
				</nav>
			</div>
			<c:if test="${message.equals('Thêm mới thành công !')}">
				<div class="alert alert-success alert-dismissible show fade">
					${message}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>
			<c:if test="${message.equals('Thêm mới thất bại !')}">
				<div class="alert alert-danger alert-dismissible show fade">
					${message}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>
			<c:if test="${message.equals('Delete thành công!')}">
				<div class="alert alert-success alert-dismissible show fade">
					${message}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>
			<c:if test="${message.equals('Delete thất bại!')}">
				<div class="alert alert-danger alert-dismissible show fade">
					${message}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>
			<c:if test="${message.equals('Chỉnh sửa Phòng ban thành công!')}">
				<div class="alert alert-success alert-dismissible show fade">
					${message}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>
			<c:if test="${message.equals('Chỉnh sửa Phòng ban thất bại!')}">
				<div class="alert alert-danger alert-dismissible show fade">
					${message}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>
		</div>
	</div>

	<section class="section">
		<div class="card">
			<div class="card-header">Bảng điểm Sinh viên</div>
			<div class="card-body">
				<table class="table table-striped" id="table1">
					<thead>
						<tr>
							<th>Mã Sinh Viên</th>
							<th>Tên Sinh Viên</th>
							<th>Mã Học Phần</th>
							<th>Tên Học Phần</th>
							<th>Điểm Thi</th>
							<th>Thiết Lập</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="d" items="${bangdiem}">
							<tr>
								<td class="masv">${d.sinhvien.masv}</td>
								<td class="hoten">${d.sinhvien.hoten}</td>
								<td class="mahp">${d.hocphan.mahp}</td>
								<td class="tenhp">${d.hocphan.tenhp}</td>
								<td class="diemthi">${d.diemthi}</td>
								
								<td><a class="settings edit-btn" title="Settings"
									type="button" href="javascript:" data-bs-toggle="modal"
									data-bs-target="#DepartmentModal"><i class="material-icons">&#xe88e;</i>
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


<%-- 	<div id="DeleteModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- MODEL BODY -->
				<form:form action="admin/deletedepartment"
					modelAttribute="department2del" method="POST">
					<section class="section">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title" id="info2del"></h4>
								<form:input type="hidden" path="maPB" id="maPB" />
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
	<div id="DepartmentModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- MODEL BODY -->
				<form:form action="admin/updatedepartment"
					modelAttribute="department2edit" method="POST">
					<section class="section">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">Thông Tin Phòng Ban</h4>
							</div>
							<div class="card-body">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<h6>Mã Phòng Ban</h6>
											<form:input path="maPB" type="text" class="form-control"
												id="ma_pb_modal" readonly="true" placeholder="Mã Phòng Ban" />
										</div>
										<div class="form-group">
											<h6>Tên Phòng Ban</h6>
											<form:input path="tenPB" type="text" class="form-control"
												id="ten_pb_modal" placeholder="Tên Phòng Ban" />
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group col-md-12">
											<h6>Số Điện Thoại</h6>
											<form:input path="sdt" type="text" class="form-control"
												id="sdt_modal" placeholder="Số Điện Thoại" />
										</div>
										<div class="form-group col-md-12">
											<h6>Mã Nhân Viên Quản Lý</h6>
											<form:select path="maNVQL" class="form-select"
												id="staff_modal">
												<form:option value="" label="-MANV-" />
												<form:options items="${listStaff}" />
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
	</div> --%>

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

		$(document).ready(function() {

			$("#table1").on('click', '.edit-btn', function() {

				var currentRow = $(this).closest("tr");

				var ma_pb = currentRow.find("td:eq(0)").text();
				var ten_pb = currentRow.find("td:eq(1)").text();
				var sdt = currentRow.find("td:eq(2)").text();
				var ma_nvql = currentRow.find("td:eq(3)").text();

				console.log(ma_pb)
				// GETTING DATA TO SHOW ON MODEL
				$('#ma_pb_modal').val(ma_pb);
				$('#ten_pb_modal').val(ten_pb);
				$('#sdt_modal').val(sdt);
				$('#ma_nvql_modal').val(ma_nvql);
			});
		});
		$('#table1').on('click', '.delete-btn', function() {
			let id = $(this).parents("tr").find(".ma-pb").text();
			let ten = $(this).parents("tr").find(".ten-pb").text();
			$('#info2del').text('Bạn có chắc chắn muốn xoá ' + ten + '?')
			$('#info2del').parent().find('#maPB').val(id)
		})

		console.log($('#DeleteModal'))
	</script>

</div>