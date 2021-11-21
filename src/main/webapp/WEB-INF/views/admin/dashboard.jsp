<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<link rel="stylesheet"
	href="<c:url value='/resources/assets/vendors/iconly/bold.css'/>">
<link rel="shortcut icon"
	href="<c:url value='/resources/assets/images/favicon.svg'/>">
<link rel="shortcut icon"
	href="<c:url value='/resources/assets/vendors/apexcharts/apexcharts.css'/>">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
	
<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			type : 'GET',
			headers : {
				Accept : "application/json; charset=utf-8",
				"Content-Type" : "application/json; charset=utf-8"
			},
			url : 'data',
			success : function(result) {
				google.charts.load('current', {
					'packages' : [ 'corechart' ]
				});
				google.charts.setOnLoadCallback(function() {
					drawChart(result);
				});
			}
		});

		function drawChart(result) {

			var data = new google.visualization.DataTable();
			data.addColumn('string', 'Phòng Ban');
			data.addColumn('number', 'nhân viên');
			var dataArray = [];
			$.each(result, function(i, obj) {
				dataArray.push([ obj.department, obj.staffOfDepartment ]);
			});

			data.addRows(dataArray);

			var piechart_options = {
				title : 'Biểu đồ tròn Tỷ lệ nhân viên của từng phòng ban',
				width : 1100,
				height : 550
			};
			var piechart = new google.visualization.PieChart(document
					.getElementById('piechart_div'));
			piechart.draw(data, piechart_options);

			var barchart_options = {
				title : 'Biểu đồ cột số nhân viên của từng phòng ban',
				width : 1000,
				height : 550,
				legend : 'none'
			};
			var barchart = new google.visualization.BarChart(document
					.getElementById('barchart_div'));
			barchart.draw(data, barchart_options);
		}

	});
</script>
<%-- 	<h2>Welcome back, ${username}!!! </h2> --%>
<div class="page-heading">
	<h3>Dashboard</h3>

</div>
<div class="page-content">
	<section class="row">
		<div class="col-12 col-lg-9">
			<div class="row">
				<div class="col-6 col-lg-3 col-md-6">
					<div class="card">
						<div class="card-body px-3 py-4-5">
							<div class="row">
								<div class="col-md-4">
									<div class="stats-icon purple">
										<i class="iconly-boldShow"></i>
									</div>
								</div>
								<div class="col-md-8">
									<h6 class="text-muted font-semibold">Nhân Viên</h6>
									<h6 class="font-extrabold mb-0">${TotalStaff}</h6>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-6 col-lg-3 col-md-6">
					<div class="card">
						<div class="card-body px-3 py-4-5">
							<div class="row">
								<div class="col-md-4">
									<div class="stats-icon blue">
										<i class="iconly-boldProfile"></i>
									</div>
								</div>
								<div class="col-md-8">
									<h6 class="text-muted font-semibold">Phòng Ban</h6>
									<h6 class="font-extrabold mb-0">${TotalDepart}</h6>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-6 col-lg-3 col-md-6">
					<div class="card">
						<div class="card-body px-3 py-4-5">
							<div class="row">
								<div class="col-md-4">
									<div class="stats-icon green">
										<i class="iconly-boldAdd-User"></i>
									</div>
								</div>
								<div class="col-md-8">
									<h6 class="text-muted font-semibold">Checkin Trong Ngày</h6>
									<h6 class="font-extrabold mb-0">${TotalCheckin}</h6>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-6 col-lg-3 col-md-6">
					<div class="card">
						<div class="card-body px-3 py-4-5">
							<div class="row">
								<div class="col-md-4">
									<div class="stats-icon red">
										<i class="iconly-boldBookmark"></i>
									</div>
								</div>
								<div class="col-md-8">
									<h6 class="text-muted font-semibold">Checkout Trong Ngày</h6>
									<h6 class="font-extrabold mb-0">${TotalCheckout}</h6>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- <div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<h4>Nhân Viên Các Phòng Ban</h4>
						</div>
						<div class="card-body">
							<div id="chartContainer" style="height: 370px; width: 100%;"></div>
						</div>
					</div>
				</div>
			</div> -->
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<h4>Thống kê nhân viên của Cửa hàng</h4>
						</div>
						<div class="card-body">
							<!-- <div id="bar"></div> -->
							<div id="piechart_div" ></div>
							<div id="barchart_div" ></div>
						</div>
					</div>
				</div>
			</div>

		</div>
		<div class="col-12 col-lg-3">
			<!-- <div class="card">
				<div class="card-body py-4 px-5">
					<div class="d-flex align-items-center">
						<div class="avatar avatar-xl">
							<img src="assets/images/faces/1.jpg" alt="Face 1">
						</div>
						<div class="ms-3 name">
							<h5 class="font-bold">John Duck</h5>
							<h6 class="text-muted mb-0">@johnducky</h6>
						</div>
					</div>
				</div>
			</div> -->
			<div class="card">
				<div class="card-header">
					<h4>Chấm Công Gần Đây</h4>
				</div>
				<div class="card-content pb-4">
					<div class="recent-message d-flex px-4 py-3">
						<div class="avatar avatar-lg">
							<img src="<c:url value="resources/assets/images/faces/4.jpg"/>">
						</div>
						<div class="name ms-4">
							<h5 class="mb-1">${hotencheck}</h5>
							<h6 class="text-muted mb-0">${chitietcheck}</h6>
						</div>
					</div>
					<div class="recent-message d-flex px-4 py-3">
						<div class="avatar avatar-lg">
							<img src="<c:url value="resources/assets/images/faces/4.jpg"/>">
						</div>
						<div class="name ms-4">
							<h5 class="mb-1">${hotencheck1}</h5>
							<h6 class="text-muted mb-0">${chitietcheck1}</h6>
						</div>
					</div>
					<div class="recent-message d-flex px-4 py-3">
						<div class="avatar avatar-lg">
							<img src="<c:url value="resources/assets/images/faces/1.jpg"/>">
						</div>
						<div class="name ms-4">
							<h5 class="mb-1">${hotencheck2}</h5>
							<h6 class="text-muted mb-0">${chitietcheck2}</h6>
						</div>
					</div>
					<div class="px-4">
						<button onclick="window.location.href='admin/listcheckstaff'"
							class='btn btn-block btn-xl btn-light-primary font-bold mt-3'>Xem
							Chi Tiết</button>
					</div>
				</div>
			</div>


		</div>
	</section>
</div>

<script src="<c:url value='/resources/assets/js/pages/dashboard.js'/>"></script>

<script
	src="<c:url value='/resources/assets/vendors/apexcharts/apexcharts.js'/>"></script>
<script
	src="<c:url value='/resources/assets/js/pages/ui-apexchart.js'/>"></script>
<script
	src="<c:url value='/resources/assets/vendors/dayjs/dayjs.min.js'/>"></script>




