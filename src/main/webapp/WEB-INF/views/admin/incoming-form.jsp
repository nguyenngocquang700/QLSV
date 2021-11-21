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

.modal-dialog {
	overflow-y: initial !important
}

.modal-body {
	height: 800px;
	overflow-y: auto;
}
</style>
<div class="page-heading">
	<div class="page-title">
		<div class="row">
			<div class="col-12 col-md-6 order-md-1 order-last">
				<h3>Danh Sách Đơn Từ</h3>
			</div>
			<div class="col-12 col-md-6 order-md-2 order-first">
				<nav aria-label="breadcrumb"
					class="breadcrumb-header float-start float-lg-end">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
						<li class="breadcrumb-item active" aria-current="page">Danh
							Sách Đơn Từ</li>
					</ol>
				</nav>
			</div>
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
			<div class="card-body">
				<div class="card-header"></div>
				<table class="table table-striped" id="table1">
					<thead>
						<tr>
							<th>Mã Thông Báo</th>
							<th>Thời Gian</th>
							<th>Tệp</th>
							<th>Mã Nhân Viên</th>
							<th>Thiết lập</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="s" items="${noti}">
							<tr>
								<td class="matb">${s.maTB}</td>
								<td class="ngay">${s.ngay}</td>
								<td class="noiDung">${s.noiDung}</td>
								<td class="manv">${s.nhanVienEntity.maNV}</td>
								<td><a class="settings edit-btn" title="Settings"
									type="button" href="/qlnv/resources/assets/images/bg/${s.noiDung}" target="_blank"><i class="material-icons">&#xe2c4;</i>
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
<div id="staffModal" class="modal fade text-left w-100" id="xlarge"
	tabindex="-1" role="dialog" aria-labelledby="myModalLabel16"
	aria-hidden="true">
	<div
		class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl"
		role="document">
		<div class="modal-content">
			<!-- MODEL BODY -->

			<section class="section">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel16">Nội dung File</h4>
					<button type="button" class="close" data-bs-dismiss="modal"
						aria-label="Close">
						<i data-feather="x"></i>
					</button>
				</div>
				<div class="modal-body">
					<a href="/qlnv/resources/assets/images/bg/${s.noiDung}" width="100%"
						height="100%" style="border: none;">
						
					</a>
				</div>
			</section>

		</div>
	</div>
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

			var manv = currentRow.find("td:eq(0)").text();
			var hoten = currentRow.find("td:eq(1)").text();
			var avatar = currentRow.find("td:eq(2)").text();
			var gioitinh = currentRow.find("td:eq(3)").text();
			var diachi = currentRow.find("td:eq(4)").text();
			var ngaysinh = currentRow.find("td:eq(5)").text();
			var dantoc = currentRow.find("td:eq(6)").text();
			var quequan = currentRow.find("td:eq(7)").text();
			var sdt = currentRow.find("td:eq(8)").text();
			var trinhdo = currentRow.find("td:eq(9)").text();
			var chuyennganh = currentRow.find("td:eq(10)").text();
			var tinhtrang = currentRow.find("td:eq(11)").text();
			var mapb = currentRow.find("td:eq(12)").text();
			var macv = currentRow.find("td:eq(13)").text();
			var tencv = currentRow.find("td:eq(14)").text();
			var mahdld = currentRow.find("td:eq(15)").text();
			var tenhdld = currentRow.find("td:eq(16)").text();
			var ngaybdhdld = currentRow.find("td:eq(17)").text();
			var ngaykthdld = currentRow.find("td:eq(18)").text();

			// GETTING DATA TO SHOW ON MODEL
			$('#manv_modal').val(manv);
			$('#hoten_modal').val(hoten);
			$('#avatar_modal').val(avatar);
			$('#gioitinh_modal').val(gioitinh);
			$('#diachi_modal').val(diachi);
			$('#ngaysinh_modal').val(ngaysinh);
			$('#dantoc_modal').val(dantoc);
			$('#quequan_modal').val(quequan);
			$('#sdt_modal').val(sdt);
			$('#trinhdo_modal').val(trinhdo);
			$('#chuyennganh_modal').val(chuyennganh);
			/* $('#tinhtrang_modal').val(tinhtrang); */
			$('#mapb_modal').val(mapb);
			$('#macv_modal').val(macv);
			$('#tencv_modal').val(tencv);
			$('#mahdld_modal').val(mahdld);
			$('#tenhdld_modal').val(tenhdld);
			$('#ngaybdhdld_modal').val(ngaybdhdld);
			$('#ngaykthdld_modal').val(ngaykthdld);
		});
	});
	$('#table1').on('click', '.delete-btn', function() {
		let id = $(this).parents("tr").find(".ma-pb").text();
		let ten = $(this).parents("tr").find(".hoten").text();
		$('#info2del').text('Bạn có chắc chắn muốn xoá ' + ten + '?')
		$('#info2del').parent().find('#maPB').val(id)
	})

	console.log($('#DeleteModal'))
</script>