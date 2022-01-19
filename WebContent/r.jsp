<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="beans.Occupation"%>
<%@page import="service.OccupationService"%>
<%@page import="controller.OccupationController"%>
<%@page import="ma.projet.controlleur.deconnexion"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="scripts/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="scripts/occ3.js" type="text/javascript"></script>
<title>Gestion des créneaux</title>
</head>
<body>


	<div class="container-scroller">




		<div class="container-fluid page-body-wrapper">
			<div class="main-panel">
				<div class="content-wrapper pb-0">


					<div class="content">

						<div class="col-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Validation d'une réservation</h4>
									<div class="form-group">
										<label for="exampleInputName1">Statut</label> <input
											required="" type="text" class="form-control" value=""
											name="statut" id="statut"
											placeholder="Veuillez entre le statut" />

									</div>






									<button class="btn btn-light" id="add" type="submit">Valider la réservation</button>




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
													<th>Date</th>
													<th>Salle</th>
													<th>Heure Début</th>
													<th>Heure Fin</th>
													<th>Client</th>
													<th>Statut</th>
													<th>Modifier</th>
												</tr>
											</thead>

											<tbody id="content">

											</tbody>

										</table>
									</div>
								</div>
							</div>
						</div>



					
</body>
</html>