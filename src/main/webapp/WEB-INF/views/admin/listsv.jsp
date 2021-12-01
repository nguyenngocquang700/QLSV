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
				<h3>Danh Sách Nhân Viên</h3>
			</div>
			<div class="col-12 col-md-6 order-md-2 order-first">
				<nav aria-label="breadcrumb"
					class="breadcrumb-header float-start float-lg-end">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
						<li class="breadcrumb-item active" aria-current="page">Danh
							Sách Nhân Viên</li>
					</ol>
				</nav>
			</div>
			<c:if test="${message.equals('Chỉnh sửa Sinh Viên thành công!')}">
				<div class="alert alert-success alert-dismissible show fade">
					${message}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>
			<c:if test="${message.equals('Chỉnh sửa Sinh Viên thất bại!')}">
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
							<th>Mã Sinh Viên</th>
							<th>Họ Và Tên</th>
							<th>Ngày Sinh</th>
							<th>Địa Chỉ</th>
							<th>Mã Lớp</th>
							<th>Mật Khẩu</th>
							<th>Thiết lập</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="s" items="${sinhvien}">
							<tr>
								<td class="manv"><c:out value="${s.masv}"/></td>
								<td class="hoten"><c:out value="${s.hoten}"/></td>
								<td class="ngaysinh"><c:out value="${s.ngaysinh}"/></td>
								<td class="diachi"><c:out value="${s.diachi}"/></td>
								<td class="malop"><c:out value="${s.lop.malop}"/></td>
								<td class="matkhau"><c:out value="${s.matkhau}"/></td>
								<td><a class="settings edit-btn" title="Settings"
									type="button" href="javascript:" data-bs-toggle="modal"
									data-bs-target="#staffModal"><i class="material-icons">&#xe88e;</i>
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
					<h4 class="modal-title" id="myModalLabel16">Thông Tin Nhân
						Viên</h4>
					<button type="button" class="close" data-bs-dismiss="modal"
						aria-label="Close">
						<i data-feather="x"></i>
					</button>
				</div>
				<div class="modal-body">
					<form action="admin/updatestaff" method="post"
						enctype="multipart/form-data">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<h6>Họ Và Tên</h6>
									<input name="maNV" type="hidden" class="form-control"
										id="manv_modal" placeholder="Mã Nhân Viên" /> <input
										name="hoTen" type="text" class="form-control" id="hoten_modal"
										placeholder="Họ Và Tên" />
								</div>

								<div class="form-group">
									<h6>Avatar</h6>
									<input type="file" class="form-control" name="photo"
										id="avatar_modal" />
								</div>


								<fieldset class="form-group">
									<h6>Giới Tính</h6>
									<select name="gioiTinh" class="form-select" id="gioitinh_modal">
										<option value="" label="-Giới Tính-" />
										<option value="Nam">Nam</option>
										<option value="Nữ">Nữ</option>
									</select>
								</fieldset>

								<div class="form-group">
									<h6>Ngày sinh</h6>
									<div id="datepicker" class="input-group date"
										data-date-format="dd-mm-yyyy">
										<input name="ngaySinh" id="ngaysinh_modal"
											class="form-control" type="date" value="01/01/1997" /> <span
											class="input-group-addon"><i
											class="glyphicon glyphicon-calendar"></i></span>
									</div>
								</div>

								<div class="form-group">
									<h6>Quê Quán</h6>
									<input name="queQuan" type="text" class="form-control"
										id="quequan_modal" placeholder="Quê Quán" />
								</div>
								<fieldset class="form-group">
									<h6>Phòng Ban</h6>
									<select name="maPB" class="form-select" id="mapb_modal">
										<option value="KTBD">Kĩ Thuật Bảo Dưỡng</option>
										<option value="HCNS">Hành Chính - Nhân Sự</option>
										<option value="KT">Kế Toán</option>
										<option value="KTCL">Kiểm Tra Chất Lượng</option>
										<option value="KV">Kho & Vật Tư</option>
										<option value="SM">Sale & Marketing</option>
										<option value="VC">Vận Chuyển</option>
									</select>
								</fieldset>
							</div>
							<div class="col-md-6">
								<div class="form-group col-md-12">
									<h6>Địa Chỉ</h6>
									<input name="diaChi" type="text" class="form-control"
										id="diachi_modal" placeholder="Địa Chỉ" />
								</div>

								<div class="form-group">
									<h6>Dân Tộc</h6>
									<input name="danToc" id="dantoc_modal" type="text"
										class="form-control" placeholder="Dân Tộc" />
								</div>

								<div class="form-group">
									<h6>Số Điện Thoại</h6>
									<input name="SDT" type="text" class="form-control"
										id="sdt_modal" placeholder="Số Điện Thoại" />
								</div>

								<div class="form-group">
									<h6>Chuyên Ngành</h6>
									<input name="chuyenNganh" type="text" class="form-control"
										id="chuyennganh_modal" placeholder="Chuyên Ngành" />
								</div>
								<div class="form-group">
									<h6>Trình Độ</h6>
									<input name="trinhDo" type="text" class="form-control"
										id="trinhdo_modal" placeholder="Chuyên Ngành" />
								</div>

								<fieldset class="form-group">
									<h6>Tình Trạng</h6>
									<select name="tinhTrang" class="form-select"
										id="tinhtrang_modal">
										<option value="Danglam" selected>Đang làm việc</option>
										<option value="Danghi">Đã nghỉ việc</option>
									</select>
								</fieldset>
							</div>


							<div class="row">
								<div class="card-header">
									<h6 class="card-title">Thông Tin Hợp Đồng</h6>
								</div>
								<div class="col-md-6">
									<fieldset class="form-group">
										<h6>Loại Hợp Đồng</h6>
										<input name="mahd" type="hidden" class="form-control"
											id="mahdld_modal" placeholder="Mã Nhân Viên" /> <select
											name="tenHD" class="form-select" id="tenhdld_modal">
											<option value="Chính thức">Chính thức</option>
											<option value="Thử việc">Thử Việc</option>
										</select>
									</fieldset>
									<div class="form-group">
										<h6>Ngày Bắt Đầu HĐ</h6>
										<div id="datepicker" class="input-group date"
											data-date-format="dd-mm-yyyy">
											<input name="ngayBD" class="form-control" type="date"
												value="01/01/1997" id="ngaybdhdld_modal" /> <span
												class="input-group-addon"><i
												class="glyphicon glyphicon-calendar"></i></span>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<h6>Ngày Kết Thúc HĐ</h6>
										<div id="datepicker" class="input-group date"
											data-date-format="dd-mm-yyyy">
											<input name="ngayKT" class="form-control" type="date"
												value="01/01/1997" id="ngaykthdld_modal" /> <span
												class="input-group-addon"><i
												class="glyphicon glyphicon-calendar"></i></span>
										</div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="card-header">
									<h6 class="card-title">Thông Tin Công Việc</h6>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<h6>Mã Công Việc</h6>
										<input name="maCV" type="text" class="form-control"
											placeholder="Mã Công Việc" id="macv_modal" readonly="true" />
									</div>

								</div>
								<div class="col-md-6">
									<div class="form-group">
										<div class="form-group">
											<h6>Tên Công Việc</h6>
											<input name="tenCV" type="text" class="form-control"
												placeholder="Tên Công Việc" id="tencv_modal" />
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-12 d-flex justify-content-end">
							<button type="submit" class="btn btn-primary me-1 mb-1">Hoàn
								Thành</button>
							<button type="reset" class="btn btn-light-secondary me-1 mb-1">Reset</button>
						</div>
					</form>
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
			var avatar1 = ${s.avatarPath}
			
			alert(avatar1); 
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
			 /* $('#tinhtrang_modal').val(tinhtrang);  */
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