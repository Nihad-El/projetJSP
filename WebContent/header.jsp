<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Gestion des salles</title>
<!-- plugins:css -->
<link rel="stylesheet"
	href="assets/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="assets/vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet"
	href="assets/vendors/jquery-bar-rating/css-stars.css" />
<link rel="stylesheet"
	href="assets/vendors/font-awesome/css/font-awesome.min.css" />
<!-- End plugin css for this page -->
<!-- inject:css -->
<!-- endinject -->
<!-- Layout styles -->
<link rel="stylesheet" href="assets/css/demo_1/style.css" />
<!-- End layout styles -->
<link rel="shortcut icon" href="assets/images/favicon.png" />
</head>
<body>





			<nav
				class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
				<div class="navbar-menu-wrapper d-flex align-items-stretch">
					<button class="navbar-toggler navbar-toggler align-self-center"
						type="button" data-toggle="minimize">
						<span class="mdi mdi-chevron-double-left"></span>
					</button>
					<div
						class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
						<a class="navbar-brand brand-logo-mini" href="index.html"><img
							src="../assets/images/logo-mini.svg" alt="logo" /></a>
					</div>
					<ul class="navbar-nav">
						<li class="nav-item dropdown"><a class="nav-link"
							id="messageDropdown" href="#" data-toggle="dropdown"
							aria-expanded="false"> <i class="mdi mdi-email-outline"></i>
						</a>
							<div
								class="dropdown-menu dropdown-menu-left navbar-dropdown preview-list"
								aria-labelledby="messageDropdown">
								<h6 class="p-3 mb-0 font-weight-semibold">Messages</h6>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item preview-item">
									<div class="preview-thumbnail">
										<img src="../assets/images/faces/face1.jpg" alt="image"
											class="profile-pic">
									</div>
									<div
										class="preview-item-content d-flex align-items-start flex-column justify-content-center">
										<h6 class="preview-subject ellipsis mb-1 font-weight-normal">Mark
											send you a message</h6>
										<p class="text-gray mb-0">1 Minutes ago</p>
									</div>
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item preview-item">
									<div class="preview-thumbnail">
										<img src="../assets/images/faces/face6.jpg" alt="image"
											class="profile-pic">
									</div>
									<div
										class="preview-item-content d-flex align-items-start flex-column justify-content-center">
										<h6 class="preview-subject ellipsis mb-1 font-weight-normal">Cregh
											send you a message</h6>
										<p class="text-gray mb-0">15 Minutes ago</p>
									</div>
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item preview-item">
									<div class="preview-thumbnail">
										<img src="../assets/images/faces/face7.jpg" alt="image"
											class="profile-pic">
									</div>
									<div
										class="preview-item-content d-flex align-items-start flex-column justify-content-center">
										<h6 class="preview-subject ellipsis mb-1 font-weight-normal">Profile
											picture updated</h6>
										<p class="text-gray mb-0">18 Minutes ago</p>
									</div>
								</a>
								<div class="dropdown-divider"></div>
								<h6 class="p-3 mb-0 text-center text-primary font-13">4 new
									messages</h6>
							</div></li>
						<li class="nav-item dropdown ml-3"><a class="nav-link"
							id="notificationDropdown" href="#" data-toggle="dropdown"> <i
								class="mdi mdi-bell-outline"></i>
						</a>
							<div
								class="dropdown-menu dropdown-menu-left navbar-dropdown preview-list"
								aria-labelledby="notificationDropdown">
								<h6 class="px-3 py-3 font-weight-semibold mb-0">Notifications</h6>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item preview-item">
									<div class="preview-thumbnail">
										<div class="preview-icon bg-success">
											<i class="mdi mdi-calendar"></i>
										</div>
									</div>
									<div
										class="preview-item-content d-flex align-items-start flex-column justify-content-center">
										<h6 class="preview-subject font-weight-normal mb-0">New
											order recieved</h6>
										<p class="text-gray ellipsis mb-0">45 sec ago</p>
									</div>
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item preview-item">
									<div class="preview-thumbnail">
										<div class="preview-icon bg-warning">
											<i class="mdi mdi-settings"></i>
										</div>
									</div>
									<div
										class="preview-item-content d-flex align-items-start flex-column justify-content-center">
										<h6 class="preview-subject font-weight-normal mb-0">Server
											limit reached</h6>
										<p class="text-gray ellipsis mb-0">55 sec ago</p>
									</div>
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item preview-item">
									<div class="preview-thumbnail">
										<div class="preview-icon bg-info">
											<i class="mdi mdi-link-variant"></i>
										</div>
									</div>
									<div
										class="preview-item-content d-flex align-items-start flex-column justify-content-center">
										<h6 class="preview-subject font-weight-normal mb-0">Kevin
											karvelle</h6>
										<p class="text-gray ellipsis mb-0">11:09 PM</p>
									</div>
								</a>
								<div class="dropdown-divider"></div>
								<h6 class="p-3 font-13 mb-0 text-primary text-center">View
									all notifications</h6>
							</div></li>
					</ul>
					<ul class="navbar-nav navbar-nav-right">
                 <form action="deconnexion">
            <input type="submit" value="Se déconnecter">
        </form>
						
								
						</a>

						</li>

					</ul>
					<button
						class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
						type="button" data-toggle="offcanvas">
						<span class="mdi mdi-menu"></span>
					</button>
				</div>
			</nav>




	<script src="assets/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<script src="assets/vendors/jquery-bar-rating/jquery.barrating.min.js"></script>
	<script src="assets/vendors/chart.js/Chart.min.js"></script>
	<script src="assets/vendors/flot/jquery.flot.js"></script>
	<script src="assets/vendors/flot/jquery.flot.resize.js"></script>
	<script src="assets/vendors/flot/jquery.flot.categories.js"></script>
	<script src="assets/vendors/flot/jquery.flot.fillbetween.js"></script>
	<script src="assets/vendors/flot/jquery.flot.stack.js"></script>
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="assets/js/off-canvas.js"></script>
	<script src="assets/js/hoverable-collapse.js"></script>
	<script src="assets/js/misc.js"></script>
	<script src="assets/js/settings.js"></script>
	<script src="assets/js/todolist.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page -->
	<script src="assets/js/dashboard.js"></script>
</body>
</html>