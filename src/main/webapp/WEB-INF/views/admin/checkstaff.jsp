<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<style type="text/css">
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

/* button */
</style>
<div class="page-heading">
	<div class="page-title">
		<div class="row">
			<div class="col-12 col-md-6 order-md-1 order-last">
				<h3>Chấm Công</h3>
			</div>
			<div class="col-12 col-md-6 order-md-2 order-first">
				<nav aria-label="breadcrumb"
					class="breadcrumb-header float-start float-lg-end">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
						<li class="breadcrumb-item active" aria-current="page">Chấm
							Công</li>
					</ol>
				</nav>
			</div>
			<c:if
				test="${message.equals('Bạn đã hoàn tất điểm danh hôm nay! Chúc một ngày tốt lành!')}">
				<div class="alert alert-success alert-dismissible show fade">
					${message}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="main-timeline">
					<div class="timeline">
						<a href="#" class="timeline-content">
							<div class="timeline-icon">
								<i class="fa fa-rocket"></i>
							</div>
							<h3 class="title">CHECKIN</h3>
							<p class="description">
								<c:choose>
									<c:when test="${checkinStatus.equals('Đã Checkin')}">
										<p id="checkin">${checkinStatus}</p>
									</c:when>
									<c:otherwise>
										<p id="checkin">Chưa Checkin</p>
									</c:otherwise>
								</c:choose>
							<div class="timeline-year">
								<p id="starttime1">${checkinTime}</p>
							</div>
						</a>
					</div>
					<div class="timeline">
						<a href="#" class="timeline-content">
							<div class="timeline-icon">
								<i class="fa fa-globe"></i>
							</div>
							<h3 class="title">CHECKOUT</h3>
							<p class="description">
								<c:choose>
									<c:when test="${checkoutStatus.equals('Đã Checkout')}">
										<p id="checkin">${checkinStatus}</p>
									</c:when>
									<c:otherwise>
										<p id="checkin">Chưa Checkout</p>
									</c:otherwise>
								</c:choose>
							<div class="timeline-year">
								<p id="starttime1">${checkoutTime}</p>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form action="admin/checkstaff" method="POST">
		<!--  button - Start Timer -->
		<input name="checkstaff" type="hidden" class="form-control"
			id="starttime3" />
		<div class="text-center">
			<button class="btn btn-primary rounded-pill" id="starttime_button"
				name="starttime_button" type="submit" value="Start Timer"
				onclick="setStartTime()">Chấm Công Ngay!!!</button>
		</div>
	</form>
	<script>
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
</div>