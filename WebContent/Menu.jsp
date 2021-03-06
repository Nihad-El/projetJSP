<%@page import="ma.projet.entity.Client"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title></title>
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
	<div class="container-scroller">
		<!-- partial:partials/_sidebar.html -->
		<nav class="sidebar sidebar-offcanvas" id="sidebar">
			<ul class="nav">
				<li class="nav-item nav-profile border-bottom"><a href="#"
					class="nav-link flex-column">
						<div class="nav-profile-image">
							<img src="assets/images/faces/face1.jpg" alt="profile" />
							<!--change to offline or busy as needed-->
						</div>
						<div class="nav-profile-text d-flex ml-0 mb-3 flex-column">

						        <%!Client c ;%>
        <%
         
        HttpSession sessio = request.getSession();
        if (sessio != null) {
             c = (Client) sessio.getAttribute("client");
        }
        else{
            response.sendRedirect("Authentification.jsp");
        }
        %>

							<span class="font-weight-semibold mb-1 mt-2 text-center"><%= c.getNom() + " " + c.getPrenom()%></span> 

						</div>
				</a></li>
				<li class="nav-item pt-3"><a class="nav-link d-block"
					href="index.html"> <img class="sidebar-brand-logo"
						src="assets/images/logo.svg" alt="" /> <img
						class="sidebar-brand-logomini" src="assets/images/logo-mini.svg"
						alt="" />

				</a>
</li>
				
				<li class="nav-item"><a class="nav-link" href="SalleForm.jsp">
						<i class="mdi mdi-compass-outline menu-icon"></i> <span
						class="menu-title">Gestion des salles</span>
				</a></li>

				<li class="nav-item"><a class="nav-link"
					href="CrenonForm.jsp"> <i
						class="mdi mdi-contacts menu-icon"></i> <span class="menu-title">Gestion des cr??noms</span>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="ClientForm.jsp"> <i
						class="mdi mdi-format-list-bulleted menu-icon"></i> <span
						class="menu-title">Gestion des clients</span>
				</a></li>

				<li class="nav-item"><a class="nav-link" href="Res.jsp">
						<i class="mdi mdi-compass-outline menu-icon"></i> <span
						class="menu-title">Gestion des Res</span>
				</a></li>

				<li class="nav-item"><a class="nav-link" href="Chart.jsp">
						<i class="mdi mdi-compass-outline menu-icon"></i> <span
						class="menu-title">Graphiques 1</span>
				</a></li>

				<li class="nav-item"><a class="nav-link" data-toggle="collapse"
					href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
						<i class="mdi mdi-crosshairs-gps menu-icon"></i> <span
						class="menu-title">Graphiques</span> <i class="menu-arrow"></i>
				</a>
					<div class="collapse" id="ui-basic">
						<ul class="nav flex-column sub-menu">
							<li class="nav-item"><a class="nav-link"
								href="">Line Chart</a>

								<div class="collapse" id="ui-basic">
									<ul class="nav flex-column sub-menu">
										<li class="nav-item"><a class="nav-link"
											href="LineGraph.jsp">Plus r??serv??es</a></li>

										<li class="nav-item"><a class="nav-link"
											href="Graph2.jsp">Par mois</a></li>
									</ul>
								</div></li>
						</ul>
					</div>
					
										<div class="collapse" id="ui-basic">
						<ul class="nav flex-column sub-menu">
							<li class="nav-item"><a class="nav-link"
								href="">Pie Chart</a>

								<div class="collapse" id="ui-basic">
									<ul class="nav flex-column sub-menu">
										<li class="nav-item"><a class="nav-link"
											href="PiePlus.jsp">Plus r??serv??es</a></li>

										<li class="nav-item"><a class="nav-link"
											href="PieMois.jsp">Par mois</a></li>
									</ul>
								</div></li>
						</ul>
					</div>
					
										<div class="collapse" id="ui-basic">
						<ul class="nav flex-column sub-menu">
							<li class="nav-item"><a class="nav-link"
								href="">Bar Chart</a>

								<div class="collapse" id="ui-basic">
									<ul class="nav flex-column sub-menu">
										<li class="nav-item"><a class="nav-link"
											href="BarPlus.jsp">Plus r??serv??es</a></li>

										<li class="nav-item"><a class="nav-link"
											href="BarRes.jsp">Par mois</a></li>
									</ul>
								</div></li>
						</ul>
					</div>
					
					
					</li>



			</ul>
		</nav>

	</div>
	
	
	
	
	<!-- container-scroller -->
	<!-- plugins:js -->
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
	<!-- End custom js for this page -->
</body>
</html>