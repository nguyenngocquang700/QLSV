<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<base href="${pageContext.servletContext.contextPath}/">

<div id="sidebar" class="active">
	<div class="sidebar-wrapper active">
		<div class="sidebar-header">
			<div class="d-flex justify-content-between">
				<div class="logo">
					<a href="/"><img
						src="<c:url value="resources/assets/images/logo/logo1.png"/>"></a>
				</div>
				<div class="toggler">
					<a href="#" class="sidebar-hide d-xl-none d-block"><i
						class="bi bi-x bi-middle"></i></a>
				</div>
			</div>
		</div>
		<div class="sidebar-menu">
			<ul class="menu">
				<li class="sidebar-title">Menu</li>

				<li class="sidebar-item  "><a href="admin" class='sidebar-link'>
						<i class="bi bi-grid-fill"></i> <span>Dashboard</span>
				</a></li>

				<li class="sidebar-item  has-sub"><a href="#"
					class='sidebar-link'> <i class="bi bi-stack"></i> <span>Quản
							Lý Sinh Viên</span>
				</a>
					<ul class="submenu ">
						<li class="submenu-item "><a href="admin/new-sv">Thêm
								Sinh Viên</a></li>
						<li class="submenu-item "><a href="admin/listsv">Danh
								Sách Sinh Viên</a></li>
						<li class="submenu-item "><a href="admin/new-lop">Thêm
								Lớp</a></li>
						<li class="submenu-item "><a href="admin/list-lop">Danh
								Sách Lớp</a></li>
						<li class="submenu-item "><a href="admin/new-diem">Thêm
								Điểm</a></li>
						<li class="submenu-item "><a href="admin/list-bangdiem">Bảng
								Điểm Sinh Viên</a></li>
					</ul></li>
				<li class="sidebar-item  has-sub"><a href="#"
					class='sidebar-link'> <i class="bi bi-stack"></i> <span>Quản
							Lý Học Phần</span>
				</a>
					<ul class="submenu ">
						<li class="submenu-item "><a href="admin/new-hocphan">Thêm
								Học Phần</a></li>
						<li class="submenu-item "><a href="admin/list-hocphan">Danh
								Sách Học Phần</a></li>
					</ul></li>
				<li class="sidebar-item  has-sub"><a href="#"
					class='sidebar-link'> <i class="bi bi-collection-fill"></i> <span>Quản
							Lý Nhân Viên</span>
				</a>
					<ul class="submenu ">
						<li class="submenu-item "><a href="admin/new-nhanvien">Thêm
								Nhân Viên</a></li>
						<li class="submenu-item "><a href="admin/list-nhanvien">Danh
								Sách Nhân Viên</a></li>
					</ul></li>


			</ul>
		</div>
		<button class="sidebar-toggler btn x">
			<i data-feather="x"></i>
		</button>
	</div>
</div>