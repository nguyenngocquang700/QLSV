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
								<td class="mahp"><c:out value="${u.mahp}"/></td>
								<td class="tenhp"><c:out value="${u.tenhp}"/></td>
								<td class="sotc"><c:out value="${u.sotc}"/></td>
								<td><a class="settings edit-btn" title="Settings"
									type="button" href="javascript:" data-bs-toggle="modal"
									data-bs-target="#HocPhanModal"><i class="material-icons">&#xe88e;</i>
								</a><a href="javascript:" class="delete delete-btn" title="Delete"
									data-bs-toggle="modal" data-bs-target="#DeleteModal"><i
										class="material-icons">&#xE5C9;</i></a></td>
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

			var mahp = currentRow.find("td:eq(0)").text();
			var tenhp = currentRow.find("td:eq(1)").text();
			var sotc = currentRow.find("td:eq(2)").text();

			// GETTING DATA TO SHOW ON MODEL
			$('#mahp_modal').val(mahp);
			$('#tenhp_modal').val(tenhp);
			$('#sotc_modal').val(sotc);
		});
	});
	$('#table1').on('click', '.delete-btn', function() {
		let id = $(this).parents("tr").find(".majp").text();
		let ten = $(this).parents("tr").find(".tenhp").text();
		console.log(ten);
		$('#info2del').text('Bạn có chắc chắn muốn xoá ' + ten + '?')
		$('#info2del').parent().find('#mahp').val(id)
	})
</script>

<div id="DeleteModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- MODEL BODY -->
			<form action="admin/delete-hocphan" method="POST">
				<section class="section">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title" id="info2del"></h4>
							<input type="hidden" name="mahp" id="mahp" />
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
<div id="HocPhanModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- MODEL BODY -->
			<form action="admin/update-hocphan" method="POST">
				<section class="section">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">Chỉnh Sửa Học Phầnn</h4>
						</div>
						<div class="card-body">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<h6>Mã Học Phần</h6>
										<input name="mahp" type="text" class="form-control"
											id="mahp_modal" readonly="true"
											placeholder="Nhập mã học phần..." />
									</div>
									<div class="form-group">
										<h6>Tên Học Phần</h6>
										<input name="tenhp" type="text" class="form-control"
											id="tenhp_modal" placeholder="Nhập tên học phần..." />
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<h6>Số Tín Chỉ</h6>
										<input name="sotc" type="text" class="form-control"
											id="sotc_modal" placeholder="Nhập số tín chỉ..." />
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

