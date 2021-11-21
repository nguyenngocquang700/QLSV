<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Quản lý nhân viên | Nhóm 26</title>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="<c:url value='/resources/assets/css/bootstrap.css'/>">

<link rel="stylesheet"
	href="<c:url value='/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css'/>">

<link rel="stylesheet"
	href="<c:url value='/resources/assets/vendors/bootstrap-icons/bootstrap-icons.css'/>">

<link rel="stylesheet"
	href="<c:url value='/resources/assets/css/app.css'/>">

<link rel="shortcut icon"
	href="<c:url value='/resources/assets/images/favicon.svg'/>"
	type="image/x-icon">
<link rel="stylesheet"
	href="<c:url value='/resources/assets/vendors/sweetalert2/sweetalert2.min.css'/>">
</head>

<body>
	<div id="app">
		<%@ include file="/common/admin/sidebar.jsp"%>

		<div id="main" class='layout-navbar'>
			<%@ include file="/common/admin/topbar.jsp"%>
			<div id="main-content">
				<decorator:body></decorator:body>
			</div>
		</div>
	</div>

	<script
		src="<c:url value='/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js'/>"></script>

	<script
		src="<c:url value='/resources/assets/js/bootstrap.bundle.min.js'/>"></script>

	<script
		src="<c:url value='/resources/assets/vendors/simple-datatables/simple-datatables.js'/>"></script>
	<script>
		// Simple Datatable
		let table1 = document.querySelector('#table1');
		let dataTable = new simpleDatatables.DataTable(table1);
	</script>

	<script src="<c:url value='/resources/assets/js/main.js'/>"></script>
</body>