<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<base href="${pageContext.servletContext.contextPath}/">

<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<c:url value='/resources/assets/css/bootstrap.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/assets/vendors/bootstrap-icons/bootstrap-icons.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/assets/css/app.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/assets/vendors/toastify/toastify.css'/>">

<link href="https://unpkg.com/filepond/dist/filepond.css"
	rel="stylesheet">
<link
	href="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.css"
	rel="stylesheet">
<style type="text/css">
.card {
	box-shadow: 0 1px 3px 0 rgba(0, 0, 0, .1), 0 1px 2px 0
		rgba(0, 0, 0, .06);
}

.card {
	position: relative;
	display: flex;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 0 solid rgba(0, 0, 0, .125);
	border-radius: .25rem;
}

.card-body {
	flex: 1 1 auto;
	min-height: 1px;
	padding: 1rem;
}

.gutters-sm {
	margin-right: -8px;
	margin-left: -8px;
}

.gutters-sm>.col, .gutters-sm>[class*=col-] {
	padding-right: 8px;
	padding-left: 8px;
}

.mb-3, .my-3 {
	margin-bottom: 1rem !important;
}

.bg-gray-300 {
	background-color: #e2e8f0;
}

.h-100 {
	height: 100% !important;
}

.shadow-none {
	box-shadow: none !important;
}

.main-timeline {
	font-family: 'Poppins', sans-serif;
}

.main-timeline:after {
	content: '';
	display: block;
	clear: both;
}

.main-timeline .timeline {
	width: 50%;
	padding: 50px 0 20px;
	margin: 0 0 0 5px;
	float: right;
}

.main-timeline .timeline-content {
	background: #fff;
	padding: 20px 20px 30px;
	border: 2px solid #25396F;
	border-radius: 30px;
	box-shadow: -5px 5px 10px rgba(0, 0, 0, 0.1) inset;
	display: block;
	position: relative;
}

.main-timeline .timeline-content:hover {
	text-decoration: none;
}

.main-timeline .timeline-icon {
	color: #fff;
	background-color: #25396F;
	font-size: 50px;
	text-align: center;
	line-height: 105px;
	height: 100px;
	width: 100px;
	border-radius: 50%;
	position: absolute;
	top: -50px;
	left: -50px;
}

.main-timeline .title {
	color: #555;
	font-size: 22px;
	font-weight: 700;
	text-transform: capitalize;
	margin: 0 0 15px 40px;
}

.main-timeline .description {
	color: #999;
	font-size: 13px;
	letter-spacing: 1px;
	margin: 0;
}

.main-timeline .timeline-year {
	color: #25396F;
	background-color: #fff;
	font-size: 30px;
	font-weight: 700;
	line-height: 30px;
	transform: translateX(-50%);
	position: absolute;
	left: 50%;
	bottom: -16px;
}

.main-timeline .timeline:nth-child(even) {
	float: left;
	margin: 0 5px 0 0;
}

.main-timeline .timeline:nth-child(even) .timeline-content {
	box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.1) inset;
}

.main-timeline .timeline:nth-child(even) .timeline-icon {
	left: auto;
	right: -50px;
}

.main-timeline .timeline:nth-child(even) .title {
	margin: 0 40px 15px 0;
}

.main-timeline .timeline:nth-child(4n+2) .timeline-content {
	border-color: #25396F;
}

.main-timeline .timeline:nth-child(4n+2) .timeline-icon {
	background-color: #25396F;
}

.main-timeline .timeline:nth-child(4n+2) .timeline-year {
	color: #25396F;
}

.main-timeline .timeline:nth-child(4n+3) .timeline-content {
	border-color: #FE7C02;
}

.main-timeline .timeline:nth-child(4n+3) .timeline-icon {
	background-color: #FE7C02;
}

.main-timeline .timeline:nth-child(4n+3) .timeline-year {
	color: #FE7C02;
}

.main-timeline .timeline:nth-child(4n+4) .timeline-content {
	border-color: #02A7D5;
}

.main-timeline .timeline:nth-child(4n+4) .timeline-icon {
	background-color: #02A7D5;
}

.main-timeline .timeline:nth-child(4n+4) .timeline-year {
	color: #02A7D5;
}

@media screen and (max-width:767px) {
	.main-timeline .timeline, .main-timeline .timeline:nth-child(even) {
		width: 100%;
		padding: 40px 0 15px;
		margin: 0 0 15px 0;
	}
	.main-timeline .timeline-content {
		padding: 50px 20px 30px;
	}
	.main-timeline .timeline-icon {
		font-size: 40px;
		line-height: 85px;
		height: 80px;
		width: 80px;
		left: 15px;
		top: -40px;
	}
	.main-timeline .timeline:nth-child(even) .timeline-icon {
		right: 15px;
	}
	.main-timeline .title, .main-timeline .timeline:nth-child(even) .title {
		font-size: 20px;
		margin: 0 0 7px;
	}
	.main-timeline .timeline-year {
		font-size: 15px;
	}
}

.button {
	position: relative;
	display: inline-block;
	margin: 20px;
}

.button a {
	color: white;
	font-family: Helvetica, sans-serif;
	font-weight: bold;
	font-size: 36px;
	text-align: center;
	text-decoration: none;
	background-color: #FFA12B;
	display: block;
	position: relative;
	padding: 20px 40px;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	text-shadow: 0px 1px 0px #000;
	filter: dropshadow(color = #000, offx = 0px, offy = 1px);
	-webkit-box-shadow: inset 0 1px 0 #FFE5C4, 0 10px 0 #915100;
	-moz-box-shadow: inset 0 1px 0 #FFE5C4, 0 10px 0 #915100;
	box-shadow: inset 0 1px 0 #FFE5C4, 0 10px 0 #915100;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

.button a:active {
	top: 10px;
	background-color: #F78900;
	-webkit-box-shadow: inset 0 1px 0 #FFE5C4, inset 0 -3px 0 #915100;
	-moz-box-shadow: inset 0 1px 0 #FFE5C4, inset 0 -3pxpx 0 #915100;
	box-shadow: inset 0 1px 0 #FFE5C4, inset 0 -3px 0 #915100;
}

.button:after {
	content: "";
	height: 100%;
	width: 100%;
	padding: 4px;
	position: absolute;
	bottom: -15px;
	left: -4px;
	z-index: -1;
	background-color: #2B1800;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}
</style>
</head>

<body>
	<nav class="navbar navbar-light">
		<div class="container d-block">
			<a href="#home"><i class="bi bi-chevron-left"></i></a> <a
				class="navbar-brand ms-4" href="index.html"> <img
				src="<c:url value="resources/assets/images/logo/logo1.png"/>">
			</a>
		</div>

		<div class="dropdown">
			<a href="#" data-bs-toggle="dropdown" aria-expanded="false">
				<div class="user-menu d-flex">
					<div class="user-name text-end me-3">
						<h6 class="mb-0 text-gray-600">${welcome}</h6>
						<h6 class="mb-0 text-gray-600">Nhân Viên</h6>
					</div>
					<div class="user-img d-flex align-items-center">
						<div class="avatar avatar-md">
							<img src="<c:url value="resources/assets/images/faces/1.jpg"/>">
						</div>
					</div>
				</div>
			</a>
			<ul class="dropdown-menu dropdown-menu-end"
				aria-labelledby="dropdownMenuButton">
				<li>
					<h6 class="dropdown-header">Hello, ${welcome}!</h6>
				</li>
				<li><a class="dropdown-item" href="#"><i
						class="icon-mid bi bi-person me-2"></i> My Profile</a></li>
				<li><a class="dropdown-item" href="#"><i
						class="icon-mid bi bi-gear me-2"></i> Settings</a></li>

				<li>
					<hr class="dropdown-divider">
				</li>
				<li><a class="dropdown-item" href="logout"><i
						class="icon-mid bi bi-box-arrow-left me-2"></i> Logout</a></li>
			</ul>
		</div>
	</nav>



	<div class="container">
		<div class="page-heading">
			<!-- 			<h3>Profile Statistics</h3>
 -->
			<h2>Welcome, ${welcome}!</h2>
		</div>
		<div class="card mt-5">
			<c:if
				test="${message.equals('Bạn đã hoàn tất điểm danh hôm nay! Chúc một ngày tốt lành!')}">
				<div class="alert alert-success alert-dismissible show fade">
					${message}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>
			<section class="section">

				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header"></div>
							<div class="card-body">
								<ul class="nav nav-tabs" id="myTab" role="tablist">
									<li class="nav-item" role="presentation"><a
										class="nav-link active" id="home-tab" data-bs-toggle="tab"
										href="#home" role="tab" aria-controls="home"
										aria-selected="true">Chấm Công</a></li>
									<li class="nav-item" role="presentation"><a
										class="nav-link" id="profile-tab" data-bs-toggle="tab"
										href="#profile" role="tab" aria-controls="profile"
										aria-selected="false">Thông Tin Cá Nhân</a></li>
									<li class="nav-item" role="presentation"><a
										class="nav-link" id="contact-tab" data-bs-toggle="tab"
										href="#contact" role="tab" aria-controls="contact"
										aria-selected="false">Lương</a></li>
									<li class="nav-item" role="presentation"><a
										class="nav-link" id="report-tab" data-bs-toggle="tab"
										href="#report" role="tab" aria-controls="report"
										aria-selected="false">Đơn Từ</a></li>
								</ul>
								<div class="tab-content" id="myTabContent">
									<div class="tab-pane fade show active" id="home"
										role="tabpanel" aria-labelledby="home-tab">
										<div class="row">
											<div class="col-md-12">
												<div class="main-timeline">
													<div class="timeline">
														<a href="#" class="timeline-content">
															<div class="timeline-icon">
																<i class="fa fa-rocket"></i>
															</div>
															<h3 class="title">Checkin</h3>
															<p class="description">
																<c:choose>
																	<c:when
																		test="${checkinStatusUser.equals('Đã Checkin')}">
																		<p id="checkin">${checkinStatusUser}</p>
																	</c:when>
																	<c:otherwise>
																		<p id="checkin">Chưa Checkin</p>
																	</c:otherwise>
																</c:choose>
															<div class="timeline-year">
																<p id="starttime1">${checkinTimeUser}</p>
															</div>
														</a>
													</div>
													<div class="timeline">
														<a href="#" class="timeline-content">
															<div class="timeline-icon">
																<i class="fa fa-globe"></i>
															</div>
															<h3 class="title">Checkout</h3>
															<p class="description">
																<c:choose>
																	<c:when
																		test="${checkoutStatusUser.equals('Đã Checkout')}">
																		<p id="checkin">${checkoutStatusUser}</p>
																	</c:when>
																	<c:otherwise>
																		<p id="checkin">Chưa Checkout</p>
																	</c:otherwise>
																</c:choose>
															<div class="timeline-year">
																<p id="starttime1">${checkoutTimeUser}</p>
															</div>
														</a>
													</div>
												</div>
											</div>
											<form action="user/checkstaff" method="POST">
												<!--  button - Start Timer -->
												<input name="checkstaff" type="hidden" class="form-control"
													id="starttime3" />
												<div class="text-center">
													<button class="btn btn-primary rounded-pill"
														id="starttime_button" name="starttime_button"
														type="submit" value="Start Timer" onclick="setStartTime()">Chấm
														Công Ngay!!!</button>
												</div>
											</form>
										</div>
									</div>
									<div class="tab-pane fade" id="profile" role="tabpanel"
										aria-labelledby="contact-tab">
										<div class="container">
											<div class="row gutters-sm">
												<div class="col-md-4 mb-3">
													<div class="card">
														<div class="card-body">
															<div
																class="d-flex flex-column align-items-center text-center">
																<!-- <img
																src="https://bootdey.com/img/Content/avatar/avatar7.png"
																alt="Admin" class="rounded-circle" width="150"> -->
																<img src="/qlnv/resources/assets/images/bg/${avatar}"
																	class="rounded-circle" width="150">
																<div class="mt-3">
																	<h4>${hoten}</h4>
																	<p class="text-secondary mb-1">${maCV}</p>
																	<p class="text-muted font-size-sm">${diaChi}</p>
																</div>
															</div>
														</div>
													</div>

												</div>
												<div class="col-md-8">
													<div class="card mb-3">
														<div class="card-body">
															<div class="row">
																<div class="col-sm-3">
																	<h6 class="mb-0">Họ và Tên</h6>
																</div>
																<div class="col-sm-9 text-secondary">${hoten}</div>
															</div>
															<hr>
															<div class="row">
																<div class="col-sm-3">
																	<h6 class="mb-0">Giới Tính</h6>
																</div>
																<div class="col-sm-9 text-secondary">${gioiTinh}</div>
															</div>
															<hr>
															<div class="row">
																<div class="col-sm-3">
																	<h6 class="mb-0">Địa Chỉ</h6>
																</div>
																<div class="col-sm-9 text-secondary">${diaChi}</div>
															</div>
															<hr>
															<div class="row">
																<div class="col-sm-3">
																	<h6 class="mb-0">Ngày Sinh</h6>
																</div>
																<div class="col-sm-9 text-secondary">${ngaySinh}</div>
															</div>
															<hr>
															<div class="row">
																<div class="col-sm-3">
																	<h6 class="mb-0">Dân Tộc</h6>
																</div>
																<div class="col-sm-9 text-secondary">${danToc}</div>
															</div>
															<hr>
															<div class="row">
																<div class="col-sm-3">
																	<h6 class="mb-0">Số Điện Thoại</h6>
																</div>
																<div class="col-sm-9 text-secondary">${SDT}</div>
															</div>
															<hr>
															<div class="row">
																<div class="col-sm-3">
																	<h6 class="mb-0">Trình Độ</h6>
																</div>
																<div class="col-sm-9 text-secondary">${trinhDo}</div>
															</div>
															<hr>
															<div class="row">
																<div class="col-sm-3">
																	<h6 class="mb-0">Chuyên Ngành</h6>
																</div>
																<div class="col-sm-9 text-secondary">${chuyenNganh}</div>
															</div>
															<hr>
															<div class="row">
																<div class="col-sm-3">
																	<h6 class="mb-0">Phòng Ban</h6>
																</div>
																<div class="col-sm-9 text-secondary">${maPB}</div>
															</div>
															<hr>
															<div class="row">
																<div class="col-sm-3">
																	<h6 class="mb-0">Tên Công Việc</h6>
																</div>
																<div class="col-sm-9 text-secondary">${maCV}</div>
															</div>
															<hr>
															<div class="row">
																<div class="col-sm-3">
																	<h6 class="mb-0">Loại Hợp Đồng</h6>
																</div>
																<div class="col-sm-9 text-secondary">${HDLD}</div>
															</div>
															<hr>

														</div>
													</div>


												</div>
											</div>

										</div>
									</div>
									<div class="tab-pane fade" id="contact" role="tabpanel"
										aria-labelledby="profile-tab">
										<div class="container mt-5 mb-5">
											<div class="row d-flex justify-content-center">
												<div class="col-md-8">
													<div class="card">
														<div class="upper p-4">
															<div class="d-flex justify-content-between">
																<div class="amount">
																	<!-- <img
																		src="https://bootdey.com/img/Content/avatar/avatar7.png"
																		width="60" class="rounded-circle"> -->
																	<h4>${hoten}</h4>
																	<span class="text-primary font-weight-bold">${maCV}</span>
																	<small>${thoigian}</small>
																</div>
															</div>
															<hr>
															<div class="delivery">
																<div class="d-flex justify-content-between">
																	<div class="d-flex flex-row align-items-center">
																		<i class="fa fa-check-circle-o"></i> <span
																			class="ml-2">Ngày Làm Việc Quy Định</span>
																	</div>
																	<span class="font-weight-bold">26 Ngày/tháng</span>
																</div>
															</div>
															<div class="delivery">
																<div class="d-flex justify-content-between">
																	<div class="d-flex flex-row align-items-center">
																		<i class="fa fa-check-circle-o"></i> <span
																			class="ml-2">Ngày Làm Việc Thực Tế</span>
																	</div>
																	<span class="font-weight-bold">${ngayTT}</span>
																</div>
															</div>
															<div class="transaction mt-2">
																<div class="d-flex justify-content-between">
																	<div class="d-flex flex-row align-items-center">
																		<i class="fa fa-check-circle-o"></i> <span
																			class="ml-2">Lương Cơ Bản</span>
																	</div>
																	<span class="font-weight-bold"> <fmt:formatNumber
																			type="number" maxFractionDigits="2"
																			value="${luongcb}" /></span>
																</div>
															</div>
															<div class="transaction mt-2">
																<div class="d-flex justify-content-between">
																	<div class="d-flex flex-row align-items-center">
																		<i class="fa fa-check-circle-o"></i> <span
																			class="ml-2">Lương Thực Tế</span>
																	</div>
																	<span class="font-weight-bold"><fmt:formatNumber
																			type="number" maxFractionDigits="2"
																			value="${luongtt}" /></span>
																</div>
															</div>
															<div class="transaction mt-2">
																<div class="d-flex justify-content-between">
																	<div class="d-flex flex-row align-items-center">
																		<i class="fa fa-check-circle-o"></i> <span
																			class="ml-2">Phụ Cấp</span>
																	</div>
																	<span class="font-weight-bold"><fmt:formatNumber
																			type="number" maxFractionDigits="2" value="${phucap}" /></span>
																</div>
															</div>
															<hr>
															<div class="transaction mt-2">
																<div class="d-flex justify-content-between">
																	<div class="d-flex flex-row align-items-center">
																		<i class="fa fa-check-circle-o"></i> <span
																			class="ml-2">Tổng Lương</span>
																	</div>
																	<span class="font-weight-bold"><fmt:formatNumber
																			type="number" maxFractionDigits="2"
																			value="${tongluong}" /></span>
																</div>
															</div>
															<hr>
															<div class="transaction mt-2">
																<div class="d-flex justify-content-between">
																	<div class="d-flex flex-row align-items-center">
																		<i class="fa fa-check-circle-o"></i> <span
																			class="ml-2">BHXH</span>
																	</div>
																	<span class="font-weight-bold"><fmt:formatNumber
																			type="number" maxFractionDigits="2" value="${bhxh}" /></span>
																</div>
															</div>
															<div class="transaction mt-2">
																<div class="d-flex justify-content-between">
																	<div class="d-flex flex-row align-items-center">
																		<i class="fa fa-check-circle-o"></i> <span
																			class="ml-2">Tạm Ứng </span>
																	</div>
																	<span class="font-weight-bold"><fmt:formatNumber
																			type="number" maxFractionDigits="2" value="${tamung}" /></span>
																</div>
															</div>
															<div class="transaction mt-2">
																<div class="d-flex justify-content-between">
																	<div class="d-flex flex-row align-items-center">
																		<i class="fa fa-check-circle-o"></i> <span
																			class="ml-2">Trừ Khác </span>
																	</div>
																	<span class="font-weight-bold"><fmt:formatNumber
																			type="number" maxFractionDigits="2"
																			value="${trukhac}" /></span>
																</div>
															</div>
														</div>
														<div
															class="lower bg-primary p-4 py-5 text-white d-flex justify-content-between">
															<div class="d-flex flex-column">
																<span>Thực Nhận</span> <small>Đơn vị tính: VNĐ</small>
															</div>
															<h3>
																<fmt:formatNumber type="number" maxFractionDigits="2"
																	value="${thucnhan}" />
															</h3>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="tab-pane fade" id="report" role="tabpanel"
										aria-labelledby="report-tab">
										<div class="container mt-5 mb-5">
											<form action="user/submitForm" method="POST"
												enctype="multipart/form-data">
												<div class="col-12 col-md-12">
													<div class="card">
														<div class="card-header">
															<h5 class="card-title">Tải Lên Đơn Của Bạn</h5>
														</div>
														<div class="card-content">
															<div class="card-body">
																<p class="card-text">Chỉ chấp nhận file hình ảnh/
																	tài liệu</p>
																<!-- Basic file uploader -->
																<input type="file" class="form-control" name="formName"
																	id="helpInputTop" />
															</div>
														</div>
													</div>
												</div>
												<div class="col-sm-12 d-flex justify-content-end">
													<button type="submit" class="btn btn-primary me-1 mb-1">Tải
														Lên</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</section>
		</div>
	</div>

	<script>
		ClassicEditor
    		.create(document.querySelector('#editor'))
   	 		.catch(error => {
        	console.error(error);
    		});
		var today = new Date();
		var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-'
				+ today.getDate();
		var time = today.getHours() + ":" + today.getMinutes() + ":"
				+ today.getSeconds();
		var dateTime = date + ' ' + time;
		function setStartTime() {
			document.getElementById('starttime3').value = dateTime;
			if (document.getElementById("checkin").getElementsByTagName("P").length === 'N/A') {
				document.getElementById('starttime1').innerHTML = dateTime;
			}
		}
	</script>

	<script
		src="<c:url value='/resources/assets/vendors/quill/quill.min.js'/>"></script>
	<script
		src="<c:url value='/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js'/>"></script>
	<script
		src="<c:url value='/resources/assets/js/bootstrap.bundle.min.js'/>"></script>
	<script
		src="<c:url value='/resources/assets/js/pages/form-editor.js'/>"></script>



	<!-- filepond validation -->
	<script
		src="https://unpkg.com/filepond-plugin-file-validate-size/dist/filepond-plugin-file-validate-size.js"></script>
	<script
		src="https://unpkg.com/filepond-plugin-file-validate-type/dist/filepond-plugin-file-validate-type.js"></script>

	<!-- image editor -->
	<script
		src="https://unpkg.com/filepond-plugin-image-exif-orientation/dist/filepond-plugin-image-exif-orientation.js"></script>
	<script
		src="https://unpkg.com/filepond-plugin-image-crop/dist/filepond-plugin-image-crop.js"></script>
	<script
		src="https://unpkg.com/filepond-plugin-image-filter/dist/filepond-plugin-image-filter.js"></script>
	<script
		src="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.js"></script>
	<script
		src="https://unpkg.com/filepond-plugin-image-resize/dist/filepond-plugin-image-resize.js"></script>

	<!-- toastify -->
	<script
		src="<c:url value='/resources/assets/vendors/toastify/toastify.js'/>"></script>

	<!-- filepond -->
	<script src="https://unpkg.com/filepond/dist/filepond.js"></script>

	<script>
    // register desired plugins...
	FilePond.registerPlugin(
        // validates the size of the file...
        FilePondPluginFileValidateSize,
        // validates the file type...
        FilePondPluginFileValidateType,

        // calculates & dds cropping info based on the input image dimensions and the set crop ratio...
        FilePondPluginImageCrop,
        // preview the image file type...
        FilePondPluginImagePreview,
        // filter the image file
        FilePondPluginImageFilter,
        // corrects mobile image orientation...
        FilePondPluginImageExifOrientation,
        // calculates & adds resize information...
        FilePondPluginImageResize,
    );
    
    // Filepond: Basic
    FilePond.create( document.querySelector('.basic-filepond'), { 
        allowImagePreview: false,
        allowMultiple: false,
        allowFileEncode: false,
        required: false
    });

    // Filepond: Multiple Files
    FilePond.create( document.querySelector('.multiple-files-filepond'), { 
        allowImagePreview: false,
        allowMultiple: true,
        allowFileEncode: false,
        required: false
    });

    // Filepond: With Validation
    FilePond.create( document.querySelector('.with-validation-filepond'), { 
        allowImagePreview: false,
        allowMultiple: true,
        allowFileEncode: false,
        required: true,
        acceptedFileTypes: ['image/png'],
        fileValidateTypeDetectType: (source, type) => new Promise((resolve, reject) => {
            // Do custom type detection here and return with promise
            resolve(type);
        })
    });

    // Filepond: ImgBB with server property
    FilePond.create( document.querySelector('.imgbb-filepond'), { 
        allowImagePreview: false, 
        server: {
            process: (fieldName, file, metadata, load, error, progress, abort) => {
                // We ignore the metadata property and only send the file

                const formData = new FormData();
                formData.append(fieldName, file, file.name);

                const request = new XMLHttpRequest();
                // you can change it by your client api key
                request.open('POST', 'https://api.imgbb.com/1/upload?key=762894e2014f83c023b233b2f10395e2');

                request.upload.onprogress = (e) => {
                    progress(e.lengthComputable, e.loaded, e.total);
                };

                request.onload = function() {
                    if (request.status >= 200 && request.status < 300) {
                        load(request.responseText);
                    }
                    else {
                        error('oh no');
                    }
                };

                request.onreadystatechange = function() {
                    if (this.readyState == 4) {
                        if(this.status == 200) {
                            let response = JSON.parse(this.responseText);
                            
                            Toastify({
                                text: "Success uploading to imgbb! see console f12",
                                duration: 3000,
                                close:true,
                                gravity:"bottom",
                                position: "right",
                                backgroundColor: "#4fbe87",
                            }).showToast();
                
                            console.log(response);
                        } else {
                            Toastify({
                                text: "Failed uploading to imgbb! see console f12",
                                duration: 3000,
                                close:true,
                                gravity:"bottom",
                                position: "right",
                                backgroundColor: "#ff0000",
                            }).showToast();   

                            console.log("Error", this.statusText);
                        }
                    }
                };

                request.send(formData);
            }
        }
    });

    // Filepond: Image Preview
    FilePond.create( document.querySelector('.image-preview-filepond'), { 
        allowImagePreview: true, 
        allowImageFilter: false,
        allowImageExifOrientation: false,
        allowImageCrop: false,
        acceptedFileTypes: ['image/png','image/jpg','image/jpeg'],
        fileValidateTypeDetectType: (source, type) => new Promise((resolve, reject) => {
            // Do custom type detection here and return with promise
            resolve(type);
        })
    });

    // Filepond: Image Crop
    FilePond.create( document.querySelector('.image-crop-filepond'), { 
        allowImagePreview: true, 
        allowImageFilter: false,
        allowImageExifOrientation: false,
        allowImageCrop: true,
        acceptedFileTypes: ['image/png','image/jpg','image/jpeg'],
        fileValidateTypeDetectType: (source, type) => new Promise((resolve, reject) => {
            // Do custom type detection here and return with promise
            resolve(type);
        })
    });

        // Filepond: Image Exif Orientation
    FilePond.create( document.querySelector('.image-exif-filepond'), { 
        allowImagePreview: true, 
        allowImageFilter: false,
        allowImageExifOrientation: true,
        allowImageCrop: false,
        acceptedFileTypes: ['image/png','image/jpg','image/jpeg'],
        fileValidateTypeDetectType: (source, type) => new Promise((resolve, reject) => {
            // Do custom type detection here and return with promise
            resolve(type);
        })
    });

    // Filepond: Image Filter
    FilePond.create( document.querySelector('.image-filter-filepond'), {
        allowImagePreview: true, 
        allowImageFilter: true,
        allowImageExifOrientation: false,
        allowImageCrop: false,
        imageFilterColorMatrix: [
            0.299, 0.587, 0.114, 0, 0,
            0.299, 0.587, 0.114, 0, 0,
            0.299, 0.587, 0.114, 0, 0,
            0.000, 0.000, 0.000, 1, 0
        ],
        acceptedFileTypes: ['image/png','image/jpg','image/jpeg'],
        fileValidateTypeDetectType: (source, type) => new Promise((resolve, reject) => {
            // Do custom type detection here and return with promise
            resolve(type);
        })
    });

    // Filepond: Image Resize
    FilePond.create( document.querySelector('.image-resize-filepond'), {
        allowImagePreview: true, 
        allowImageFilter: false,
        allowImageExifOrientation: false,
        allowImageCrop: false,
        allowImageResize: true,
        imageResizeTargetWidth: 200,
        imageResizeTargetHeight: 200,
        imageResizeMode: 'cover',
        imageResizeUpscale: true,
        acceptedFileTypes: ['image/png','image/jpg','image/jpeg'],
        fileValidateTypeDetectType: (source, type) => new Promise((resolve, reject) => {
            // Do custom type detection here and return with promise
            resolve(type);
        })
    });
</script>
</body>


</html>