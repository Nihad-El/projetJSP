<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="beans.Client"%>
<%@page import="service.ClientService"%>
<%@page import="controller.OccupationController"%>
<%@page import="ma.projet.controlleur.deconnexion"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="scripts/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="scripts/creneau.js" type="text/javascript"></script>
<title>Gestion des créneaux</title>
</head>
<body>


	<div class="container-scroller">


		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="Menu.jsp"></jsp:include>


		<div class="container-fluid page-body-wrapper">
			<div class="main-panel">
				<div class="content-wrapper pb-0">


					<div class="content">

						<div class="col-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Ajout d'un créneau</h4>
									<div class="form-group">
										<label for="exampleInputName1">Heure début</label> <input
											required="" type="time" class="form-control" value=""
											name="heureDebut" id="heureDebut" placeholder="heureDebut" />
									</div>

									<div class="form-group">
										<label for="exampleInputName1">Heure Fin</label> <input
											required="" type="time" class="form-control" value=""
											name="heureFin" id="heureFin" placeholder="heureFin" />
									</div>





									<button class="btn btn-light" id="add" type="submit">Envoyer</button>




								</div>
							</div>
						</div>









						<div class="col-lg-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">

									</p>
									<div class="table-responsive">
										<table class="table table-bordered">
											<thead>
												<tr>
													<th>id</th>
													<th>Heure Début</th>
													<th>Heure Fin</th>
													<th>Supprimer</th>
												</tr>
											</thead>

											<tbody id="content">

											</tbody>

										</table>
									</div>
								</div>
							</div>
						</div>



						<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>