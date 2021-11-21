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
						<li class="breadcrumb-item active" aria-current="page">Danh sách Nhân viên</li>
					</ol>
				</nav>
			</div>
			<%-- <c:if test="${message.equals('Chỉnh sửa Nhân Viên thành công!')}">
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
			</c:if> --%>
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
