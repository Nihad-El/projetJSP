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
<script src="scripts/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="scripts/charts.js"></script>
<script src="chart.js/dist/Chart.min.js"></script>
</head>
<body>

	<div class="container-scroller">


		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="Menu.jsp"></jsp:include>


		<div class="container-fluid page-body-wrapper">
			<div class="main-panel">
				<div class="content-wrapper pb-0">


<div class="col-lg-6 grid-margin stretch-card">
					<div class="card">
					  <div class="card-body">
						<canvas id="MyChart" style="height:230px"></canvas>
					  </div>
					</div>

				</div>
<jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>