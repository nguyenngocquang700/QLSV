<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page import="java.text.ParseException"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Locale"%>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

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
				<h3>Bảng Lương Nhân Viên</h3>
			</div>
			<div class="col-12 col-md-6 order-md-2 order-first">
				<nav aria-label="breadcrumb"
					class="breadcrumb-header float-start float-lg-end">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.html">Dashboard</a>
						</li>
						<li class="breadcrumb-item active" aria-current="page">Bảng
							Lương Nhân Viên</li>
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
			<c:if test="${message.equals('Chỉnh sửa Lương thành công!')}">
				<div class="alert alert-success alert-dismissible show fade">
					${message}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>
			<c:if test="${message.equals('Chỉnh sửa Lương thất bại!')}">
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
			<div class="card-header">Bảng Lương Nhân Viên</div>
			<div class="card-body">
				<table class="table table-striped" id="table1">
					<thead>
						<tr>
							<th>Mã NV</th>
							<th>Họ Và Tên</th>
							<th>Thời Gian</th>
							<th>NLV Quy Định</th>
							<th>NLV Thực Tế</th>
							<th>Lương CB</th>
							<th>Lương Thực Tế</th>
							<th>Phụ Cấp</th>
							<th>Tổng Lương</th>
							<th>BHXH</th>
							<th>Tạm Ứng</th>
							<th>Trừ Khác</th>
							<th>Thực Nhận</th>
							<th style="display: none;">id_details</th>
							<th style="display: none;">id_salary</th>
							<th>Thiết Lập</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="s" items="${salary}">
							<tr>
								<td class="id_user">${s.nhanVienEntity.maNV}</td>
								<td class="name">${s.nhanVienEntity.hoTen}</td>
								<td class="time">${s.thoiGian}</td>
								<td class="qdday">26</td>
								<td class="check"><c:forEach var="c"
										items="${CheckStaffbyMonth}">
										<c:if
											test="${c[0].equals(s.nhanVienEntity.maNV) && c[1].toString() == s.thoiGian.getMonth() +1}">
											${c[2]}
											<c:set var="ngaylvtt" value="${c[2]}" scope="page"/>
										</c:if>
										
									</c:forEach></td>

								<td class="salary_cb"><fmt:formatNumber type="number"
										maxFractionDigits="2" value="${s.detailSalaryEntity.luongCB}" /></td>
								<td class="salary_tt"><fmt:formatNumber type="number"
										maxFractionDigits="-1"
										value="${(s.detailSalaryEntity.luongCB/26)*ngaylvtt}" /></td>
								<td class="salary_pc"><fmt:formatNumber type="number"
										maxFractionDigits="2" value="${s.detailSalaryEntity.phuCap}" /></td>
								<td class="salaryTotal"><fmt:formatNumber type="number"
										maxFractionDigits="-1"
										value="${((s.detailSalaryEntity.luongCB/26)*ngaylvtt)+s.detailSalaryEntity.phuCap}" />
										
								</td>
								<td class="bhxh"><fmt:formatNumber type="number"
										maxFractionDigits="2" value="${s.bhxh}" /></td>
								<td class="tamung"><fmt:formatNumber type="number"
										maxFractionDigits="2" value="${s.tamUng}" /></td>
								<td class="trukhac"><fmt:formatNumber type="number"
										maxFractionDigits="2" value="${s.truKhac}" /></td>
								<td class="thucnhan"><fmt:formatNumber type="number"
										maxFractionDigits="-1"
										value="${(((s.detailSalaryEntity.luongCB/26)*ngaylvtt)+s.detailSalaryEntity.phuCap)-s.bhxh-s.tamUng-s.truKhac}" />
								</td>
								<td style="display: none;">${s.bacLuong}</td>
								<td style="display: none;">${s.detailSalaryEntity.bacLuong}</td>
								<td><a class="settings edit-btn" title="Settings"
									type="button" href="javascript:" data-bs-toggle="modal"
									data-bs-target="#SalaryModal"> <i class="material-icons">&#xe88e;</i>
								</a></td>
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

	$(document).ready(function() {

		$("#table1").on('click', '.edit-btn', function() {

			var currentRow = $(this).closest("tr");

			var id_user = currentRow.find("td:eq(0)").text();
			var name = currentRow.find("td:eq(1)").text();
			var time = currentRow.find("td:eq(2)").text();
			var check = currentRow.find("td:eq(4)").text();
			var qdday = currentRow.find("td:eq(3)").text();
			var salary_cb = currentRow.find("td:eq(5)").text();
			salary_cb = salary_cb.replace(/[^0-9|-]/g, "")
			var salary_tt = currentRow.find("td:eq(6)").text();
			var salary_pc = currentRow.find("td:eq(7)").text();
			salary_pc = salary_pc.replace(/[^0-9|-]/g, "")
			var salaryTotal = currentRow.find("td:eq(8)").text();
			var bhxh = currentRow.find("td:eq(9)").text();
			bhxh = bhxh.replace(/[^0-9|-]/g, "")
			var tamung = currentRow.find("td:eq(10)").text();
			tamung = tamung.replace(/[^0-9|-]/g, "")
			var trukhac = currentRow.find("td:eq(11)").text();
			trukhac = trukhac.replace(/[^0-9|-]/g, "")
			var thucnhan = currentRow.find("td:eq(12)").text();
			var id_details = currentRow.find("td:eq(13)").text();
			var id_salary = currentRow.find("td:eq(14)").text();

			// GETTING DATA TO SHOW ON MODEL
			$('#id_user_modal').val(id_user);
			$('#name_modal').val(name);
			$('#time_modal').val(time);
			$('#qdday_modal').val(qdday);
			$('#salary_cb_modal').val(salary_cb);
			$('#salary_tt_modal').val(salary_tt);
			$('#salary_pc_modal').val(salary_pc);
			$('#salaryTotal_modal').val(salaryTotal);
			$('#bhxh_modal').val(bhxh);
			$('#tamung_modal').val(tamung);
			$('#trukhac_modal').val(trukhac);
			$('#thucnhan_modal').val(thucnhan);
			$('#id_details_modal').val(id_details);
			$('#id_salary_modal').val(id_salary);
		});
	});
</script>
<div id="SalaryModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- MODEL BODY -->
			<form action="admin/updatesalary" method="POST">
				<section class="section">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">Chi Tiết Lương</h4>
						</div>
						<div class="card-body">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<h6>Mã NV</h6>
										<input name="maNV" type="text" readonly="true"
											class="form-control" id="id_user_modal" />
									</div>
									<div class="form-group">
										<h6>Họ và Tên</h6>
										<input type="text" readonly="true" class="form-control"
											id="name_modal" placeholder="Họ và Tên" />
									</div>
									<div class="form-group">
										<h6>Thời Gian</h6>
										<div id="datepicker" class="input-group date"
											data-date-format="dd-mm-yyyy">
											<input name="thoiGian" class="form-control" id="time_modal"
												type="date" value="01/01/1997" /> <span
												class="input-group-addon"> <i
												class="glyphicon glyphicon-calendar"></i>
											</span>
										</div>
									</div>
									<div class="form-group">
										<h6>Lương Cơ Bản</h6>
										<input name="luongCB" type="text" class="form-control"
											id="salary_cb_modal" placeholder="Lương Cơ Bản" />
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<h6>Phụ Cấp</h6>
										<input name="phuCap" type="text" class="form-control"
											id="salary_pc_modal" placeholder="Phụ Cấp" />
									</div>
									<div class="form-group">
										<h6>BHXH</h6>
										<input name="bhxh" type="text" class="form-control"
											id="bhxh_modal" placeholder="Phụ Cấp" />
									</div>
									<div class="form-group">
										<h6>Tạm Ứng</h6>
										<input name="tamUng" type="text" class="form-control"
											id="tamung_modal" placeholder="Tạm Ứng" />
									</div>
									<div class="form-group">
										<h6>Trừ Khác</h6>
										<input name="truKhac" type="text" class="form-control"
											id="trukhac_modal" placeholder="Trừ Khác" /> <input
											name="id_detail" type="hidden" class="form-control"
											id="id_details_modal" /> <input name="id_salary"
											type="hidden" class="form-control" id="id_salary_modal" />
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
